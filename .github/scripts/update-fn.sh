#!/bin/bash

source ./.github/scripts/config.sh
# source config.sh


AWS_ECR_ACCOUNT_URL="$1"
AWS_ECR_REPO="$2"
TAG="$3"
AWS_REGION="$4"
FUNCTION_GROUP="$5"

function_group="${FUNCTION_GROUP}"

if [[ "$function_group" == "internal" ]]; then
  array_name=("${internal_functions[@]}") 
elif [[ "$function_group" == "main" ]]; then
  array_name=("${main_functions[@]}") 
else
  echo "Invalid function group: $function_group"
  exit 1
fi

echo "List of fn name ${array_name}"

# for function in "${array_name[@]}"; do 
#     echo $function
# done

  for function in "${array_name[@]}"; do 
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
