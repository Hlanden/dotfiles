#!/bin/bash

# Default values
EDITOR="nvim"
ASSIGNED_TO=$(eval  az ad signed-in-user show | jq -r .mail)
VERSION="Genius 2.2"
AREA="Genius"
TYPE="Bug"
PRIORITY=""
SW=""
FW=""

# Help function
help_function() {
    echo ""
    echo "Usage: $0 TITLE [options]"
    echo -e "\tORG                  Required: Organization name in Azure DevOps"
    echo -e "\tPROJECT                  Required: Project name in Azure DevOps"
    echo -e "\tTITLE                  Required: Title of the work item."
    echo -e "\t-e [EDITOR]              Editor to use to write markdown description (default: '$EDITOR')"
    echo -e "\t-t [TYPE]              Type of the ticket (default: '$TYPE')"
    echo -e "\t-a [ASSIGNED_TO]       Assign work item to someone (default: '$ASSIGNED_TO')"
    echo -e "\t-v [VERSION]           Set the version (default: '$VERSION')"
    echo -e "\t--area [AREA]          Set the System.AreaPath (default: 'Genius')"
    echo -e "\t--priority [PRIORITY]  Set the Microsoft.VSTS.Common.Priority"
    echo -e "\t--sw [SW]              Set the Microsoft.VSTS.Build.FoundIn (software version)"
    echo -e "\t--fw [FW]              Set the Custom.STMCommit (firmware version)"
    echo -e "\t-h                     Display this help message"
    exit 1 # Exit script after printing help
}

check_login() {
    if ! az account show > /dev/null 2>&1; then
        echo "You are not logged in. Please run 'az login'."
        az login
        if [ $? -ne 0 ]; then
            echo "Login failed. Exiting."
            exit 1
        fi
    fi
}



# Ensure title is provided as the first positional argument
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    echo "Error: Title, organization and project is required."
    help_function
fi

check_login

# The title is now the first positional argument
ORG_URL="https://dev.azure.com/$1"
PROJECT="$2"
TITLE="$3"
shift
shift
shift

# Parse optional arguments
while [[ "$1" != "" ]]; do
    case "$1" in
        -a) ASSIGNED_TO="$2"; shift ;;
        -e) EDITOR="$2"; shift ;;
        -t) TYPE="$2"; shift ;;
        -v) VERSION="$2"; shift ;;
        --area) AREA="$2"; shift ;;
        --priority) PRIORITY="$2"; shift ;;
        --sw) SW="$2"; shift ;;
        --fw) FW="$2"; shift ;;
        -h) help_function ;;  # Call help function in case -h is passed
        *) echo "Invalid argument: $1"; help_function ;;
    esac
    shift
done

# Remember the starting directory
start_dir=$(pwd)

# Create the necessary temporary directory and files
cd /tmp || exit
mkdir -p azureticket/attachments  # Create a folder for attachments inside the tmp dir
cd azureticket || exit

DESCRIPTION="tmpfile.md"
$EDITOR $DESCRIPTION

if [ ! -f "tmpfile.md" ]; then
    echo "Error: The description file was not saved. Exiting without creating bug"
    exit 1
fi

# Convert markdown to HTML
pandoc "$DESCRIPTION" -f markdown -t html -o tmpfile.html

# Construct the az command
AZ_COMMAND="az boards work-item create --type '$TYPE' --open --assigned-to '$ASSIGNED_TO' --title '$TITLE' -f Version='$VERSION' System.AreaPath='$AREA' System.Description=\"$(cat tmpfile.html)\""

# Add optional fields only if they are provided
[[ -n "$PRIORITY" ]] && AZ_COMMAND+=" -f Microsoft.VSTS.Common.Priority='$PRIORITY'"
[[ -n "$SW" ]] && AZ_COMMAND+=" -f Microsoft.VSTS.Build.FoundIn='$SW'"
[[ -n "$FW" ]] && AZ_COMMAND+=" -f Custom.STMCommit='$FW'"

# Extract the work item ID from the output 
RESULT=$(eval "$AZ_COMMAND")
WORK_ITEM_ID=$(echo "$RESULT" | jq -r '.id')
echo "Work item id '$WORK_ITEM_ID'"

# Check if the work item creation was successful
if [ -z "$WORK_ITEM_ID" ]; then
    echo "Error: Failed to create work item."
    exit 1
fi


TOKEN=$(az account get-access-token --resource "499b84ac-1321-427f-aa17-267ca6975798" | jq -r .accessToken)
API_VERSION="7.2-preview.4"
for image in attachments/*; do
    if [ -f "$image" ]; then
        FILE_NAME=$(basename "$image")
        echo "Uploading $FILE_NAME..."

        # Upload the image file

        RESPONSE=$(curl -X POST \
            "$ORG_URL/$PROJECT/_apis/wit/attachments?fileName=$FILE_NAME&api-version=$API_VERSION" \
            -H "Content-Type: application/octet-stream" \
            -H "Authorization: Bearer $TOKEN" \
            --data-binary "@$image")
        
        # Check if the response is empty or not valid JSON
        if [ -z "$RESPONSE" ]; then
            echo "Failed to get a response from the server for $FILE_NAME."
            continue
        fi

        # Extract the attachment URL from the response
        ATTACHMENT_URL=$(echo "$RESPONSE" | jq -r '.url')

        echo "Attachment URL: '$ATTACHMENT_URL'"

        # Prepare the PATCH request body to attach the image to the work item
        PATCH_BODY=$(jq -n --arg url "$ATTACHMENT_URL" --arg comment "$FILE_NAME" \
            '[{"op": "add", "path": "/relations/-", "value": {"rel": "AttachedFile", "url": $url, "attributes": {"comment": $comment}}}]')

        # Attach the image to a work item
        RESPONSE_ATT=$(curl -X PATCH \
            "$ORG_URL/$PROJECT/_apis/wit/workitems/$WORK_ITEM_ID?api-version=6.0" \
            -H "Content-Type: application/json-patch+json" \
            -H "Authorization: Bearer $TOKEN" \
            -d "$PATCH_BODY" \ 
            --silent)

        echo "Attachment added to work item $WORK_ITEM_ID"
    fi
done

#Clean up
cd /tmp || exit
rm -rf azureticket
cd "$start_dir" || exit

