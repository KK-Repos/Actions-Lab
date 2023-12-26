#!/bin/bash

# Parse arguments and set environment variables
while [[ $# -gt 0 ]]; do
  key="$1"
  value="$2"

  # Check for valid argument format
  if [[ ! $value ]]; then
    echo "Invalid argument format: $key should be followed by a value"
    exit 1
  fi

  # Set environment variable
  export "$key=$value"

  shift 2
done

# Define the array of function names
functions=(
    "kk-test-fn"
)

# Iterate through the array and update each function
for function in "${functions[@]}"; do
  aws lambda update-function-code \
      --function-name "$function" \
      --image-uri "${AWS_ECR_ACCOUNT_URL}/${AWS_ECR_REPO}:${TAG}" \
      --region "${AWS_REGION}" > /dev/null

  # Check for errors and provide informative messages
  if [[ $? -ne 0 ]]; then
    echo "Error updating function: $function"
    echo "Error details: $(aws lambda update-function-code --function-name "$function" --image-uri "${AWS_ECR_ACCOUNT_URL}/${AWS_ECR_REPO}:${TAG}" --region "${AWS_REGION}" 2>&1)"
  else
    echo "Function updated successfully: $function"
  fi
done
