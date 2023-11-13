#!/bin/bash

# Custom message for release
RELEASE_MESSAGE="Latest release"

# Finishing the Git Flow release
git flow release finish -m "$RELEASE_MESSAGE"

# Optional: push the changes to the remote repository
git push origin develop
git push origin main
git push --tags