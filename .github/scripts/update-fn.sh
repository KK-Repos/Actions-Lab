#!/bin/bash

source lambda-constants.sh

array_name="${FUNCTION_GROUP}_functions"

AWS_ECR_ACCOUNT_URL="$1"
AWS_ECR_REPO="$2"
TAG="$3"
AWS_REGION="$4"
FUNCTION_GROUP="$5"

echo $array_name

if [[ -v "${array_name}" ]]; then
  for function in "${!array_name[@]}"; do  # Corrected array expansion
    aws lambda update-function-code \
        --function-name "$function" \
        --image-uri "${AWS_ECR_ACCOUNT_URL}/${AWS_ECR_REPO}:${TAG}" \
        --region "${AWS_REGION}" > /dev/null

    if [[ $? -ne 0 ]]; then
      echo "Error updating function: $function"
    else
      echo "Function updated successfully: $function"
    fi
  done
else
  echo "Error: Array ${array_name} does not exist."
fi
