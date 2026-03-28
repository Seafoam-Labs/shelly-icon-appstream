#!/bin/bash

# Usage: ./check_duplicates.sh <new_manifest.json> <existing_manifest.json>
# Example: ./check_duplicates.sh new.json manifest.json
# Checks for duplicate package names between two manifest files

if [ $# -ne 2 ]; then
    echo "Usage: $0 <new_manifest.json> <existing_manifest.json>"
    echo "Example: $0 new.json manifest.json"
    exit 1
fi

NEW_MANIFEST=$1
EXISTING_MANIFEST=$2

if [ ! -f "$NEW_MANIFEST" ]; then
    echo "Error: New manifest '$NEW_MANIFEST' not found"
    exit 1
fi

if [ ! -f "$EXISTING_MANIFEST" ]; then
    echo "Error: Existing manifest '$EXISTING_MANIFEST' not found"
    exit 1
fi

# Extract package names from both manifests and find duplicates
echo "Checking for duplicates..."
echo ""

DUPLICATES=$(comm -12 \
    <(grep -oP '^\s*"\K[^"]+(?=":)' "$NEW_MANIFEST" | sort) \
    <(grep -oP '^\s*"\K[^"]+(?=":)' "$EXISTING_MANIFEST" | sort))

if [ -z "$DUPLICATES" ]; then
    echo "No duplicates found!"
else
    echo "Duplicate packages found:"
    echo "$DUPLICATES"
    echo ""
    echo "Count: $(echo "$DUPLICATES" | wc -l)"
fi
