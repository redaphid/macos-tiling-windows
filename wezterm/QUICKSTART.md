# 🚀 Quick Start Guide

Get up and running with Cyberpunk Pastel Rave WezTerm in 5 minutes!

## Step 1: Install WezTerm

```bash
# macOS
brew install --cask wezterm

# Or download from: https://wezfurlong.org/wezterm/installation.html
```

## Step 2: Run the Installer

```bash
cd ~/dotfiles/wezterm
./install.sh
```

That's it! Launch WezTerm and enjoy your new cyberpunk terminal! 🌈

## Step 3: Learn the Basics

### The Leader Key

**Press `CTRL+A`** - this is your "leader key" that unlocks all commands.

### Essential Commands

**Tabs:**
- `CMD+T` → New tab
- `CMD+1-9` → Switch tabs
- `CMD+W` → Close tab

**Split Panes:**
- `CTRL+A` then `|` → Split vertically
- `CTRL+A` then `-` → Split horizontally
- `CTRL+A` then `H/J/K/L` → Navigate panes

**Command Palette:**
- `CMD+P` → Open command palette (when you forget a command!)

## Step 4: Customize (Optional)

Want to tweak colors? Edit:
```bash
~/dotfiles/wezterm/colors/cyberpunk-pastel-rave.lua
```

Want different keybindings? Edit:
```bash
~/dotfiles/wezterm/modules/keybindings.lua
```

Then reload: `CTRL+A` then `R`

## Step 5: Level Up with Plugins

Install workspace switcher for project navigation:

```bash
# Install zoxide first
brew install zoxide

# Add to your shell config:
echo 'eval "$(zoxide init zsh)"' >> ~/.zshrc
```

Then uncomment the plugin section in `.wezterm.lua` and restart WezTerm.

Press `CTRL+A` then `S` to open the workspace switcher! ⚡

## 🆘 Need Help?

- Full docs: [README.md](README.md)
- Plugin guide: [PLUGINS.md](PLUGINS.md)
- Keybindings: Press `CMD+P` and type what you want to do!

## 🎨 First Time Tips

1. **Transparency**: If the background is too dark, increase opacity in `modules/appearance.lua`
2. **Font Size**: `CMD++` or `CMD+-` to adjust on the fly
3. **Copy/Paste**: Works like normal! `CMD+C` and `CMD+V`
4. **URLs**: `CTRL+Click` to open links
5. **Search**: `CMD+F` to search in terminal output

Enjoy your beautiful new terminal! 💜✨
