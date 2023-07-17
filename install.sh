#!/bin/bash

# Prompt the user to choose a theme
echo "Choose a theme:"
echo "1. Dracula"
echo "2. Dracula (clean background)"
read -p "Enter your choice (1 or 2): " choice

# Validate the user's choice
case $choice in
  1)
    theme_dir="dracula"
    ;;
  2)
    theme_dir="dracula-clean-background"
    ;;
  *)
    echo "Invalid choice. Exiting."
    exit 1
    ;;
esac

# Define the paths
source_dir="/dracula-androidide/$theme_dir"
destination_dir="$HOME/.androidide/ui/editor/schemes/"

# Check if the source directory exists
if [ ! -d "$source_dir" ]; then
  echo "The selected theme directory does not exist. Exiting."
  exit 1
fi

# Create the destination directory if it doesn't exist
mkdir -p "$destination_dir"

# Copy the theme folder to idetheme
cp -R "$source_dir" "$destination_dir"

# Check if the copy operation was successful
if [ $? -eq 0 ]; then
  echo "Theme copied successfully."
else
  echo "Failed to copy the theme."
fi
