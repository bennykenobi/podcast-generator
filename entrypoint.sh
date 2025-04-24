#! /bin/bash

set -e

if [ ! -f "feed.yaml"]; then
    echo "Error: feed.yaml not found in the current directory"
    exit 1
fi

git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUTEMAIL}"
git config --global --add safe.directory /github/workspace

python3 /usr/bin/feed.py

git add -A && git commit -m "Update Feed"
git push --set-upstream origin main

echo "RSS feed generated successfully"