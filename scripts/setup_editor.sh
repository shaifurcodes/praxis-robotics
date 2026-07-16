#!/bin/bash
# Robot Project Environment Setup Script
# Run this from the project root: ./scripts/setup_env.sh

# Get the absolute path to the project root
# We are in 'scripts/', so we go up one level
PROJECT_ROOT=$(cd "$(dirname "$0")/.." && pwd)

echo "--- Configuring environment from $PROJECT_ROOT ---"

# 1. Ensure required system directories exist
mkdir -p ~/.config
mkdir -p ~/.vim

# 2. Link Starship config
ln -sf "$PROJECT_ROOT/env/starship.toml" ~/.config/starship.toml
echo "Linked: starship.toml"

# 3. Link Vim configuration
ln -sf "$PROJECT_ROOT/env/vimrc" ~/.vimrc
echo "Linked: vimrc"

# 4. Link CoC settings
ln -sf "$PROJECT_ROOT/env/coc-settings.json" ~/.vim/coc-settings.json
echo "Linked: coc-settings.json"

# 5. Automatically install CoC extensions
echo "Installing CoC extensions..."
vim -c "CocInstall -sync coc-pyright coc-json coc-cmake | q"

echo "--- Setup complete! ---"
