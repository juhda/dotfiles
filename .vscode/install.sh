#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
EXT_FILE=${SCRIPT_DIR}/extensions.txt

echo "Installing VSCode extensions from extensions.txt..."
if [ -z $(which code) ]; then
    echo "⚠️ VSCode is not installed. Please install it first."
    exit 1
fi

if [ -f "$EXT_FILE" ]; then
    while read -r extension; do
        if [[ ! -z "$extension" && ! "$extension" =~ ^# ]]; then
            echo "Installing: $extension"
            code --install-extension "$extension" || echo "❌ Failed to install $extension"
        fi
    done < "$EXT_FILE"
else
    echo "⚠️ No extensions.txt file found at $EXT_FILE"
    exit 1
fi
