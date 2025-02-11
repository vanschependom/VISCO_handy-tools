#!/bin/bash

# Define the .gitignore file path
GITIGNORE_FILE=".gitignore"

# Check if the .gitignore file exists
if [[ -f "$GITIGNORE_FILE" ]]; then
    # Check if .DS_Store is already ignored
    if grep -qxF ".DS_Store" "$GITIGNORE_FILE"; then
        echo ".DS_Store is already ignored in $GITIGNORE_FILE."
        exit 0
    fi
fi

# Append .DS_Store to .gitignore
echo -e "\n# Ignore macOS system files\n.DS_Store" >> "$GITIGNORE_FILE"
echo "Added .DS_Store to $GITIGNORE_FILE."