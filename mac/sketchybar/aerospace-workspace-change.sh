#!/bin/bash

# Called by AeroSpace exec-on-workspace-change.
# AeroSpace sets these env vars automatically:
#   AEROSPACE_FOCUSED_WORKSPACE
#   AEROSPACE_PREV_WORKSPACE

/opt/homebrew/bin/sketchybar --trigger aerospace_workspace_change \
    AEROSPACE_FOCUSED_WORKSPACE="$AEROSPACE_FOCUSED_WORKSPACE" \
    AEROSPACE_PREV_WORKSPACE="$AEROSPACE_PREV_WORKSPACE"
