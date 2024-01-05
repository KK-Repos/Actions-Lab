#!/bin/bash

BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
GITHUB_TOKEN=<github-Token>
ORG=<org-name>
REPO=<github-repo>

PR_NUMBER=$(curl -s -H "Authorization: Bearer $GITHUB_TOKEN" \
              "https://api.github.com/repos/$ORG/$REPO/pulls?head=$BRANCH_NAME" | jq -r '.[0].number' )

echo $PR_NUMBER
