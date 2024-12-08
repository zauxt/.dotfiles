#!/bin/bash
# Shebang to specify running with bash

# Redirect echo output to file
exec >> linuxsetup.log 2>&1

# Check the operating system
if [ "$(uname)" != "Linux" ]; then
   # Log error and exit if not Linux
   echo "Error: Intended to run on Linux systems only."
   exit 1
else
   # Log sucess if it is Linux
   echo "Success: Continuing since Linux OS detected."
fi

# Create .TRASH directory in the home directory if it doesn't already exist
TRASH_DIR="$HOME/.TRASH"
if [ ! -d "$TRASH_DIR" ]; then
   mkdir "$TRASH_DIR"
   echo "Created directory labeled $TRASH_DIR"
else
   echo "Directory $TRASH_DIR already exists"
fi

# Handle the .nanorc file if it exists
NANORC_FILE="$HOME/.nanorc"
if [ -f "$NANORC_FILE" ]; then
   mv "$NANORC_FILE" "$HOME/.bup_nanorc"
   echo "Renamed existing .nanorc to .bup_nanorc."
else
   echo "No existing .nanorc file found to rename."
fi

# Overwrite the .nanorc in home directory
ETC_NANORC_FILE="$HOME/.dotfiles/etc/.nanorc"
if [ -f "$ETC_NANORC_FILE" ]; then
   cp "$ETC_NANORC_FILE" "$HOME/.nanorc"
   echo "Copied ./etc/.nanorc to $HOME/.nanorc."
else
   echo "Error: ./etc/.nanorc not found - zero changes made."
fi

# Add statement to end of .bashrc file
BASHRC_FILE="$HOME/.bashrc"
echo "source ~/.dotfiles/etc/bashrc_custom" >> "$BASHRC_FILE"

