#!/bin/bash

# Usage: ./generate_manifest.sh [folder_with_size_dirs]
# Example: ./generate_manifest.sh src
# Or run from within a folder that contains 128x128, 64x64, 48x48: ./generate_manifest.sh

FOLDER=${1:-.}

# Check if current folder has the size directories
if [ -d "$FOLDER/128x128" ] && [ -d "$FOLDER/64x64" ] && [ -d "$FOLDER/48x48" ]; then
    # Good to go
    :
else
    echo "Error: Directory structure not found. Need 128x128, 64x64, and 48x48 subdirectories in '$FOLDER'" >&2
    exit 1
fi

echo "{"

# Find all 128x128 .png files (assuming all packages have 128, 64, 48)
find "$FOLDER/128x128" -name "*.png" 2>/dev/null | sort | awk -v folder="$FOLDER" '
BEGIN {
    first_package = 1
}
{
    # Extract the package name (basename without extension)
    split($0, parts, "/")
    filename = parts[length(parts)]
    sub(/\.png$/, "", filename)
    package = filename

    if (!first_package) {
        printf ",\n"
    }
    first_package = 0

    printf "  \"%s\": [\n", package
    printf "    \"src/128x128/%s.png\",\n", package
    printf "    \"src/64x64/%s.png\",\n", package
    printf "    \"src/48x48/%s.png\"\n", package
    printf "  ]"
}
END {
    printf "\n"
}
'

echo "}"
