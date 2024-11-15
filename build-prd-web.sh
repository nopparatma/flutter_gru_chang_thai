#!/bin/bash

# Get the old version from pubspec.yaml
OLD_VERSION=$(grep "^version:" pubspec.yaml | sed 's/version: //')

# Split the old version into version and build number
VERSION_PART=$(echo $OLD_VERSION | cut -d '+' -f 1)
BUILD_PART=$(echo $OLD_VERSION | cut -d '+' -f 2)

# Increment the build number (you can adjust the logic here if you want to increment differently)
NEW_BUILD=$((BUILD_PART + 1))

# Combine the version and the updated build number
NEW_VERSION="$VERSION_PART+$NEW_BUILD"

# Update the version in pubspec.yaml
sed -i '' "s/^version: .*/version: $NEW_VERSION/" pubspec.yaml

# Output the new version for confirmation
echo "Updated version from: $OLD_VERSION to: $NEW_VERSION"

# Run the Flutter build command
flutter build web --release --web-renderer canvaskit -t "lib/main_prod.dart" -v
