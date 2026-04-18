#!/bin/bash

if [ ! -d ".git" ]; then
    echo "Error: .git folder not found. Run this from your project root."
    exit 1
fi

echo "Installing AO3 Skin Updater..."

mkdir -p .git/hooks
cp .skin-updater/pre-commit .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit

if [ -f ".git/hooks/pre-commit" ]; then
    echo "✓ Installed"
    echo ""
    echo "Add to your CSS metadata:"
    echo "  - Updated:      2026-04-18 14:32 UTC"
else
    echo "✗ Installation failed"
    exit 1
fi
