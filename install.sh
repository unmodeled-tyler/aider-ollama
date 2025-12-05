#!/bin/bash

# Install script for aider-ollama-launcher

set -e

INSTALL_DIR="${HOME}/.local/bin"
SCRIPT_NAME="aider-ollama"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing aider-ollama..."

# Create install directory if needed
mkdir -p "$INSTALL_DIR"

# Copy the script
cp "$SCRIPT_DIR/$SCRIPT_NAME" "$INSTALL_DIR/$SCRIPT_NAME"
chmod +x "$INSTALL_DIR/$SCRIPT_NAME"

echo "✅ Installed to $INSTALL_DIR/$SCRIPT_NAME"

# Check if install dir is in PATH
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo ""
    echo "⚠️  $INSTALL_DIR is not in your PATH"
    echo ""
    echo "Add it by running:"
    echo "  echo 'export PATH=\"\$HOME/.local/bin:\$PATH\"' >> ~/.bashrc"
    echo "  source ~/.bashrc"
fi

# Check for OLLAMA_API_BASE
if [ -z "$OLLAMA_API_BASE" ]; then
    echo ""
    echo "💡 Tip: Set OLLAMA_API_BASE in your shell config:"
    echo "  echo 'export OLLAMA_API_BASE=http://localhost:11434' >> ~/.bashrc"
fi

echo ""
echo "🎉 Installation complete! Run 'aider-ollama' to get started."
