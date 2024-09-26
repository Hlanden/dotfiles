# ADO Tickets From CLI
Note: This is only tested on Ubuntu


## Requirements
[Install the Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt): 
```
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```
Install pandoc: 
```
sudo apt install pandoc
```

After you have installed Azure CLI you need to: 
1. Download Devops Extension
    ```
    az extension add --name azure-devops
    ```
2. Login to devops: 
    ```
    az devops login
    ```

## Usage
To get help: 
```
./create_ado_ticket -h
```
Ones you report a bug, a editor will open a temporary markdown file for you to write the description in. 
This will be located in `/tmp/azureticket/`. 
In this folder you will also have a folder for adding attachmets: `/tmp/azureticket/attachmets`
1. Write the description 
2. Add attachments to `/tmp/azureticket/attachmets`
3. Save the description and close the edior

`organization` and `project` is found in any tickets in ADO. 
The tickets have the following format: 
`https://dev.azure.com/<organization>/<Project>/_workitems/edit/<ID>/`

### Using VS Code 
You have to specify `--wait` in the editor to make sure vscode is blocking the execution for the rest of the script. 

### Examples: 
**Reporting a bug using VS Code: **
```
./create_ado_ticket <organization> <Project> "New test" -e "code --wait"
```

**Reporting a task using Nano: **
```
./create_ado_ticket <organization> <Project> "New test" -e "nano" -t Task
```
