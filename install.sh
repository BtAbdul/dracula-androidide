#!/bin/bash

# Prompt the user to choose a theme
echo "Choose a theme:"
echo "1. Dracula"
echo "2. Dracula with Clean Background"
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

# Define the source and destination paths
source_dir="dracula-androidide/$theme_dir"
destination_dir="$HOME/.androidide/ui/editor/schemes"

# Check if the source directory exists
if [ ! -d "$source_dir" ]; then
  echo "The selected theme directory does not exist. Exiting."
  exit 1
fi

# Remove the destination directory if it exists
if [ -d "$destination_dir" ]; then
  rm -r "$destination_dir"
fi

# Copy the theme folder to the destination
cp -R "$source_dir" "$destination_dir"

# Check if the copy operation was successful
if [ $? -eq 0 ]; then
  echo "Theme copied successfully."
else
  echo "Failed to copy the theme."
fi
