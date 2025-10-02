#!/bin/bash

# Color definitions
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Success message
echo -e "\n${GREEN}✓ Dotfiles installed successfully!${NC}\n"

# Section header
echo -e "${BLUE}═══════════════════════════════════════${NC}"
echo -e "${BLUE}            NEXT STEPS${NC}"
echo -e "${BLUE}═══════════════════════════════════════${NC}\n"

# Step 1: Shell reload
echo -e "${YELLOW}1. Reload shell configuration:${NC}"
echo -e "   ${BOLD}source ~/.zshrc${NC}\n"

# Step 2: Tmux reload
echo -e "${YELLOW}2. Reload tmux configuration:${NC}"
echo -e "   ${BOLD}tmux source-file ~/.tmux.conf${NC}\n"

# Step 3: Tmux plugins
echo -e "${YELLOW}3. Install tmux plugins:${NC}"
echo -e "   Start tmux and press: ${BOLD}Ctrl-a + I${NC}\n"

# Step 4: Vim plugins
echo -e "${YELLOW}4. Install Vim plugins:${NC}"
echo -e "   Open vim and run: ${BOLD}:PluginInstall${NC}\n"

# Footer
echo -e "${BLUE}═══════════════════════════════════════${NC}"
echo -e "${GREEN}Enjoy your enhanced development environment!${NC}"
echo -e "${BLUE}═══════════════════════════════════════${NC}\n"