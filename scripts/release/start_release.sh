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

# Updating the version using bumpver
bumpver update --$VERSION_TYPE

# Extracting the new version number
# Using grep with a regex to find the version number
NEW_VERSION=$(bumpver show | grep -oP 'Current Version: \K.*')

# Starting a new Git Flow release
git flow release start $NEW_VERSION

# Reminder message
echo "Release $NEW_VERSION started. Make any last-minute changes now."
