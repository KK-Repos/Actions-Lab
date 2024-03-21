#!/bin/bash

# dummy test

PR_NUMBER=$(curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/$ORG/$REPO/actions/workflows/deploy.yml/dispatches \
  -d '{"ref":"master"}')

echo $PR_NUMBER
