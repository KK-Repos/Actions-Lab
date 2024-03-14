#!/bin/bash

# Get current date and time
current_time=$(date +"%Y%m%d%H%M%S")

BRANCH_NAME="$1"

# Replace '/' and space with '-' in the branch name
formatted_branch=$(echo "$BRANCH_NAME" | sed 's/[\/ ]/-/g')

# Convert the branch name to lowercase
formatted_branch_lower=$(echo "$formatted_branch" | tr '[:upper:]' '[:lower:]')

# Append current time to the formatted and lowercase branch name
final_branch_name="${formatted_branch_lower}-${current_time}"

