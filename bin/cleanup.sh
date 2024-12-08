#!/bin/bash
# Shebang to specify running bash

# Remove .nanorc file
rm "$HOME/.nanorc"

# Remove line from .bashrc file
sed -i "source ~/.dotfiles/etc/bashrc_custom" "$HOME/.bashrc"

# Remove .TRASH directory
rm -rf "$HOME/.TRASH"
