#!/bin/bash

DATE=$(date +%y%m%d)
HASH=$(git rev-parse --short=8 HEAD)

NEW_VERSION="${DATE}-${HASH}"

echo "Setting version to $NEW_VERSION"

mvn versions:set -DnewVersion="$NEW_VERSION" -DgenerateBackupPoms=false
