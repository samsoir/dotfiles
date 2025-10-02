# Dotfiles

A comprehensive dotfiles repository for quickly setting up a modern development environment on Linux systems. Originally built for ChromeOS Linux, this project is designed to be portable across any Linux-like environment.

## Features

🚀 **Fully Automated Setup** - One command installs everything
🔧 **Plugin Manager Integration** - Automatic setup for Oh My Zsh, TPM, and Vundle
🌈 **Enhanced Shell Experience** - Zsh with completions, suggestions, and syntax highlighting
📱 **Cross-Platform Support** - Works with apt, pacman, yum, dnf, and brew
🎨 **Colorized Output** - Beautiful CLI feedback and instructions

## Supported Applications

- **zsh** - Enhanced shell with Oh My Zsh framework
- **tmux** - Terminal multiplexer with plugin support via TPM
- **vim** - Editor with Vundle plugin manager and twilight256 theme
- **git** - Version control configuration

## Quick Start

**One-command setup** - Copy and paste this single line:

```bash
git clone https://github.com/samsoir/dotfiles.git ~/dotfiles && cd ~/dotfiles && make install
```

Or step-by-step:

```bash
git clone https://github.com/samsoir/dotfiles.git ~/dotfiles
cd ~/dotfiles
make install
```

The installer will:
1. Check system dependencies (git, zsh, vim, tmux, curl)
2. Install plugin managers (Oh My Zsh, TPM, Vundle)
3. Download required plugins and themes
4. Create symbolic links to configuration files
5. Provide colorized next-steps instructions

## Available Commands

Run `make help` to see all available options:

```bash
make help           # Show help message
make install        # Full installation
make clean          # Remove dotfiles
make system-deps    # Check dependencies
make oh-my-zsh      # Install Oh My Zsh
make zsh-plugins    # Install zsh plugins
make tpm            # Install Tmux Plugin Manager
make vundle         # Install Vundle
make vim-colors     # Install vim color scheme
```

## Post-Installation

After running `make install`, follow the colorized on-screen instructions to complete setup:

1. **Reload shell**: `source ~/.zshrc`
2. **Reload tmux**: `tmux source-file ~/.tmux.conf`
3. **Install tmux plugins**: Start tmux and press `Ctrl-a + I`
4. **Install Vim plugins**: Open vim and run `:PluginInstall`

## System Requirements

The installer automatically checks for and provides installation instructions for:

- **git** - Version control
- **zsh** - Shell (will be configured as default)
- **vim** - Text editor
- **tmux** - Terminal multiplexer
- **curl** - For downloading components

## Plugin Details

### Zsh Plugins (via Oh My Zsh)
- `zsh-completions` - Additional completion definitions
- `zsh-autosuggestions` - Fish-like fast/unobtrusive autosuggestions
- `zsh-syntax-highlighting` - Fish shell-like syntax highlighting

### Tmux Plugins (via TPM)
- `tmux-sensible` - Basic tmux settings everyone can agree on
- `tmux-themepack` - Powerline theme pack
- `tmux-resurrect` - Persist tmux sessions across system restarts
- `tmux-continuum` - Continuous saving of tmux environment

### Vim Plugins (via Vundle)
- `vim-fugitive` - Git wrapper
- `command-t` - Fast file navigation
- `sparkup` - HTML/CSS abbreviations
- `requirements.txt.vim` - Python requirements support
- `python-syntax` - Enhanced Python syntax highlighting
- `twilight256` - Dark color scheme

## Cleanup

To remove all dotfiles from your home directory:

```bash
make clean
```

## Contributing

Contributions are welcome! Please fork this repository and create a Pull Request with your improvements.

## License

This project is licensed under the MIT License. See the LICENSE file for details.
