#!/bin/bash

# Define the array of function names
functions=("kk-test-fn")  # Add more function names here if needed

# Access arguments passed to the script
AWS_ECR_ACCOUNT_URL="$1"  # First argument
AWS_ECR_REPO="$2"        # Second argument
TAG="$3"                  # Third argument (likely from an environment variable)
AWS_REGION="$4"          # Fourth argument (likely from an environment variable)


echo $AWS_ECR_ACCOUNT_URL
echo $AWS_ECR_REPO
echo $TAG
echo $AWS_REGION

functions=("kk-test-fn"
          "kk-test-beta-fn"
)

for function in "${functions[@]}"; do
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


