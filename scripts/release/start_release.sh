#!/bin/bash

# Check if an argument was provided
if [ $# -eq 0 ]; then
    echo "No version type specified. Usage: ./start_release.sh [major/minor/patch]"
    exit 1
fi

# Determine the type of version bump
VERSION_TYPE=$1

# Validate the version type
if [[ "$VERSION_TYPE" != "major" && "$VERSION_TYPE" != "minor" && "$VERSION_TYPE" != "patch" ]]; then
    echo "Invalid version type: $VERSION_TYPE. Use major, minor, or patch."
    exit 1
fi

# Placeholder for the new version
PLACEHOLDER_VERSION="0.0.0"

# Starting a new Git Flow release with a placeholder version
git flow release start $PLACEHOLDER_VERSION

# Updating the version using bumpver
bumpver update --$VERSION_TYPE

# Extracting the new version number
NEW_VERSION=$(bumpver show | grep -oP 'Current Version: \K.*')

# Rename the Git Flow release branch to the correct version
# Assuming default naming convention for Git Flow release branches
git branch -m release/$PLACEHOLDER_VERSION release/$NEW_VERSION

# Update the version files
git add .
git commit -m "Bump version to $NEW_VERSION"

# Reminder message
echo "Release $NEW_VERSION started. Make any last-minute changes now."
