# Visco's bash scripts

Handy bash scripts I use on a daily basis.

## Print that shit

Printer app that lives on my desktop and converts pdf's and ppt's to 3-slide-per-column A4 documents.

This script makes use of _LibreOffice_ and _psnup_.

## Add .DS_Store gitignore

The `add_ds_gitignore.sh` bash script is saved at `~/.scripts` and I'm able to run the script via its alias `ds_ignore`.

### Setup:

Create script in home folder

```bash
mkdir -p ~/.scripts  # Ensure the scripts directory exists
nano ~/.scripts/add_ds_gitignore.sh
```

The actual script:

```bash
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
```

Make the script executable:

```bash
chmod +x ~/.scripts/add_ds_gitignore.sh
```

Create a zsh alias. First open the `.zshrc` config file:

```bash
open ~/.zshrc
```

Than append this (at the bottom):

```bash
alias ds_ignore='~/.scripts/add_ds_gitignore.sh'
```

Apply changes:

```bash
source ~/.zshrc
```

\
🎉 Congrats, now you can run `ds_ignore` and the `.gitignore` file will automatically be added. 🎉
