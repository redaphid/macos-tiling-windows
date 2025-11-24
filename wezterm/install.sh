#!/usr/bin/env bash
# Installation script for Cyberpunk Pastel Rave WezTerm Configuration
# This script sets up symlinks and installs optional dependencies

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Rainbow banner
echo -e "${MAGENTA}"
cat << "EOF"
╦ ╦┌─┐┌─┐╔╦╗┌─┐┬─┐┌┬┐  ╔═╗┌─┐┌┬┐┬ ┬┌─┐
║║║├┤ ┌─┘ ║ ├┤ ├┬┘│││  ╚═╗├┤  │ │ │├─┘
╚╩╝└─┘└─┘ ╩ └─┘┴└─┴ ┴  ╚═╝└─┘ ┴ └─┘┴
╔═╗┬ ┬┌┐ ┌─┐┬─┐┌─┐┬ ┬┌┐┌┬┌─  ╔═╗┌─┐┌─┐┌┬┐┌─┐┬
║  └┬┘├┴┐├┤ ├┬┘├─┘│ │││││├┴┐ ╠═╝├─┤└─┐ │ ├┤ │
╚═╝ ┴ └─┘└─┘┴└─┴  └─┘┘└┘┴┴ ┴ ╩  ┴ ┴└─┘ ┴ └─┘┴─┘
╦═╗┌─┐┬  ┬┌─┐  ╔═╗┌┬┐┬┌┬┐┬┌─┐┌┐┌
╠╦╝├─┤└┐┌┘├┤   ║╣  │││ │ ││ ││││
╩╚═┴ ┴ └┘ └─┘  ╚═╝─┴┘┴ ┴ ┴└─┘┘└┘
EOF
echo -e "${NC}"

echo -e "${CYAN}🌈 Installing Cyberpunk Pastel Rave WezTerm Configuration...${NC}\n"

# Determine script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"

echo -e "${BLUE}📁 Configuration directory: ${SCRIPT_DIR}${NC}"

# Backup existing config if it exists
if [ -f "$HOME/.wezterm.lua" ] || [ -L "$HOME/.wezterm.lua" ]; then
  BACKUP_FILE="$HOME/.wezterm.lua.backup.$(date +%Y%m%d_%H%M%S)"
  echo -e "${YELLOW}⚠️  Existing .wezterm.lua found. Backing up to ${BACKUP_FILE}${NC}"
  mv "$HOME/.wezterm.lua" "$BACKUP_FILE"
fi

# Create symlink
echo -e "${GREEN}🔗 Creating symlink: ~/.wezterm.lua -> ${SCRIPT_DIR}/.wezterm.lua${NC}"
ln -sf "${SCRIPT_DIR}/.wezterm.lua" "$HOME/.wezterm.lua"

# Check if WezTerm is installed
if ! command -v wezterm &> /dev/null; then
  echo -e "${RED}❌ WezTerm is not installed!${NC}"
  echo -e "${YELLOW}📦 Install WezTerm from: https://wezfurlong.org/wezterm/installation.html${NC}"
  echo -e "${YELLOW}   Or use: brew install --cask wezterm (on macOS)${NC}"
else
  WEZTERM_VERSION=$(wezterm --version)
  echo -e "${GREEN}✅ WezTerm found: ${WEZTERM_VERSION}${NC}"
fi

# Check for recommended fonts
echo -e "\n${CYAN}🔤 Checking for recommended fonts...${NC}"

FONTS_FOUND=0
if fc-list 2>/dev/null | grep -i "JetBrains Mono" > /dev/null; then
  echo -e "${GREEN}✅ JetBrains Mono found${NC}"
  FONTS_FOUND=1
elif system_profiler SPFontsDataType 2>/dev/null | grep -i "JetBrains Mono" > /dev/null; then
  echo -e "${GREEN}✅ JetBrains Mono found${NC}"
  FONTS_FOUND=1
fi

if [ $FONTS_FOUND -eq 0 ]; then
  echo -e "${YELLOW}⚠️  JetBrains Mono font not found${NC}"
  echo -e "${YELLOW}   Install from: https://www.jetbrains.com/lp/mono/${NC}"
  echo -e "${YELLOW}   Or use: brew install --cask font-jetbrains-mono${NC}"
fi

# Check for zoxide (for workspace switcher)
echo -e "\n${CYAN}🚀 Checking for optional dependencies...${NC}"
if ! command -v zoxide &> /dev/null; then
  echo -e "${YELLOW}⚠️  zoxide not found (optional, for smart workspace switching)${NC}"
  echo -e "${YELLOW}   Install: brew install zoxide (macOS) or cargo install zoxide${NC}"
else
  echo -e "${GREEN}✅ zoxide found${NC}"
fi

# Success message
echo -e "\n${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${MAGENTA}✨ Installation complete! ✨${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

echo -e "\n${CYAN}📝 Next steps:${NC}"
echo -e "  1. Launch WezTerm to see your new configuration"
echo -e "  2. Check README.md for keybindings and customization"
echo -e "  3. Install plugins (optional) - see PLUGINS.md"
echo -e "  4. Customize colors in: ${SCRIPT_DIR}/colors/cyberpunk-pastel-rave.lua"

echo -e "\n${BLUE}🎨 Key Features:${NC}"
echo -e "  • 24-bit pastel rainbow colors"
echo -e "  • Animated gradients and transitions"
echo -e "  • Vim-inspired keybindings"
echo -e "  • Smart workspace management"
echo -e "  • GPU-accelerated rendering"

echo -e "\n${YELLOW}💡 Tip: Press CTRL+A (Leader key) to access all pane/tab commands${NC}"
echo -e "${CYAN}     Use CMD+P for the command palette${NC}\n"

echo -e "${MAGENTA}Happy hacking! 🌈✨${NC}\n"
