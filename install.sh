#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing VSCode extensions from extensions.txt..."
while read extension; do
    if [[ ! -z "$extension" ]]; then
        code --install-extension "$extension" || echo "Failed to install $extension"
    fi
done < ${SCRIPT_DIR}/.vscode/extensions.txt
