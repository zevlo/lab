#!/usr/bin/env bash

# Description: Display dotfiles information

dotfiles_dir="$HOME/dotfiles"
file_count=$(find "$dotfiles_dir" -maxdepth 1 -mindepth 1 ! -name '.*' | wc -l)
today=$(date +%Y-%m-%d)

echo "=== Dotfiles Info ==="
echo "User: $USER"
echo "Dotfiles location: $dotfiles_dir"
echo "Files tracked: $file_count"
echo "Date: $today"
