#!/bin/bash

# fail if any commands fails
set -e

# Exists if no provided parameters.
if [ -z "${project_path}" ]; then
  echo "[ERROR] Missing required input: project_path"
  exit 1
fi

# Exits if project file does not exists
PBXPROJ_FILE="${project_path}/project.pbxproj"
if [ ! -f $PBXPROJ_FILE ]; then
    echo "[ERROR] Project file not found: ${project_path}"
    exit 1
fi

# Info statements
echo "[INFO] Path of .xcodeproj file:		${project_path}"

# Replaces the setting PRODUCT_BUNDLE_IDENTIFIER in the .pbxproj file.
echo ""
echo "Replacing..."
sed -i '' 's/fr.irrijardin.irrilake;/fr.irrijardin.irrilake.staging;/g' "$PBXPROJ_FILE"
sed -i '' 's/fr.irrijardin.irrilake.OneSignalNotificationServiceExtension;/fr.irrijardin.irrilake.staging.OneSignalNotificationServiceExtension;/g' "$PBXPROJ_FILE"
echo ""
echo "[SUCCESS] Replace done!"
