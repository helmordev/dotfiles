#!/bin/bash

# -----------------------------------------------
# 🚀 Helmor's Dotfiles Installer
# -----------------------------------------------

echo ""
echo "  🔧 Installing Helmor's dotfiles..."
echo ""

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Backup existing files and symlink dotfiles
files=(".bashrc" ".gitconfig")

for file in "${files[@]}"; do
    target="$HOME/$file"
    source="$DOTFILES_DIR/$file"

    # Backup existing file if it exists and is not a symlink
    if [ -f "$target" ] && [ ! -L "$target" ]; then
        echo "  📦 Backing up existing $file to $file.backup"
        mv "$target" "$target.backup"
    fi

    # Create symlink
    echo "  🔗 Linking $file..."
    ln -sf "$source" "$target"
done

# Reload bashrc
source "$HOME/.bashrc" 2>/dev/null

echo ""
echo "  ✅ Dotfiles installed successfully!"
echo "  💡 Run 'reload' anytime to refresh your terminal settings."
echo ""
