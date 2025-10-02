#!/bin/bash

# Minimal Bootstrap Script - Install git and clone dotfiles repository
set -e

# Color definitions
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

REPO_URL="https://github.com/samsoir/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"

echo -e "${YELLOW}Dotfiles Bootstrap: Installing git and cloning repository...${NC}"

# Check if git is installed, install if missing
if ! command -v git >/dev/null 2>&1; then
    echo -e "${YELLOW}Git not found. Installing git...${NC}"

    if command -v apt >/dev/null 2>&1; then
        sudo apt update && sudo apt install -y git
    elif command -v pacman >/dev/null 2>&1; then
        sudo pacman -Sy --noconfirm git
    elif command -v yum >/dev/null 2>&1; then
        sudo yum install -y git
    elif command -v dnf >/dev/null 2>&1; then
        sudo dnf install -y git
    elif command -v brew >/dev/null 2>&1; then
        brew install git
    else
        echo -e "${RED}No supported package manager found. Please install git manually.${NC}"
        exit 1
    fi

    echo -e "${GREEN}✓ Git installed successfully${NC}"
fi

# Clone repository and run installation
echo -e "${YELLOW}Cloning dotfiles repository...${NC}"
rm -rf "$DOTFILES_DIR"
git clone "$REPO_URL" "$DOTFILES_DIR"

echo -e "${GREEN}✓ Repository cloned to $DOTFILES_DIR${NC}"
echo -e "${YELLOW}Running automated installation...${NC}"

cd "$DOTFILES_DIR"
make install