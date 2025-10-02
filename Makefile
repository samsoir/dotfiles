DOTFILES_DIR    := $(shell pwd)
DOTFILES_SEARCH := $(wildcard .??*)
EXCLUSIONS      := .git .gitmodules .gitignore scripts .gitconfig
DOTFILES        := $(filter-out $(EXCLUSIONS), $(DOTFILES_SEARCH))

.PHONY: install clean list reload zsh-plugins oh-my-zsh tpm vundle vim-colors system-deps help

help: ## Show this help message
	@echo "Dotfiles Management Commands:"
	@echo ""
	@echo "  make install      - Install all dotfiles and dependencies"
	@echo "  make clean        - Remove dotfiles from home directory"
	@echo "  make list         - List dotfiles that would be installed"
	@echo ""
	@echo "Individual Component Installation:"
	@echo "  make system-deps  - Check/install system dependencies (git, zsh, vim, tmux, curl)"
	@echo "  make oh-my-zsh    - Install Oh My Zsh framework"
	@echo "  make zsh-plugins  - Install zsh plugins (completions, autosuggestions, syntax-highlighting)"
	@echo "  make tpm          - Install Tmux Plugin Manager"
	@echo "  make vundle       - Install Vundle (Vim Plugin Manager)"
	@echo "  make vim-colors   - Install twilight256 vim color scheme"
	@echo ""
	@echo "For more information, see README.md"

system-deps:
	@echo "Checking system dependencies..."
	@missing_deps=""; \
	for dep in git zsh vim tmux curl; do \
		if ! command -v $$dep >/dev/null 2>&1; then \
			missing_deps="$$missing_deps $$dep"; \
		fi; \
	done; \
	if [ -n "$$missing_deps" ]; then \
		echo "Missing dependencies:$$missing_deps"; \
		if command -v apt >/dev/null 2>&1; then \
			echo "Install with: sudo apt install$$missing_deps"; \
		elif command -v pacman >/dev/null 2>&1; then \
			echo "Install with: sudo pacman -S$$missing_deps"; \
		elif command -v yum >/dev/null 2>&1; then \
			echo "Install with: sudo yum install$$missing_deps"; \
		elif command -v dnf >/dev/null 2>&1; then \
			echo "Install with: sudo dnf install$$missing_deps"; \
		elif command -v brew >/dev/null 2>&1; then \
			echo "Install with: brew install$$missing_deps"; \
		else \
			echo "Please install using your system's package manager."; \
		fi; \
		exit 1; \
	else \
		echo "All system dependencies are installed."; \
	fi

oh-my-zsh: system-deps
	@if [ ! -d "${HOME}/.oh-my-zsh" ]; then \
		echo "Installing oh-my-zsh..."; \
		sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended; \
	else \
		echo "oh-my-zsh already installed"; \
	fi

zsh-plugins: oh-my-zsh
	@echo "Installing oh-my-zsh plugins"
	@mkdir -p ${HOME}/.oh-my-zsh/custom/plugins
	@if [ ! -d "${HOME}/.oh-my-zsh/custom/plugins/zsh-completions" ]; then \
		echo "Installing zsh-completions..."; \
		git clone https://github.com/zsh-users/zsh-completions.git ${HOME}/.oh-my-zsh/custom/plugins/zsh-completions; \
	else \
		echo "zsh-completions already installed"; \
	fi
	@if [ ! -d "${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then \
		echo "Installing zsh-autosuggestions..."; \
		git clone https://github.com/zsh-users/zsh-autosuggestions.git ${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions; \
	else \
		echo "zsh-autosuggestions already installed"; \
	fi
	@if [ ! -d "${HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then \
		echo "Installing zsh-syntax-highlighting..."; \
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting; \
	else \
		echo "zsh-syntax-highlighting already installed"; \
	fi

tpm:
	@if [ ! -d "${HOME}/.tmux/plugins/tpm" ]; then \
		echo "Installing TPM (Tmux Plugin Manager)..."; \
		git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm; \
	else \
		echo "TPM already installed"; \
	fi

vundle:
	@if [ ! -d "${HOME}/.vim/bundle/Vundle.vim" ]; then \
		echo "Installing Vundle (Vim Plugin Manager)..."; \
		git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim; \
	else \
		echo "Vundle already installed"; \
	fi

vim-colors:
	@if [ ! -f "${HOME}/.vim/colors/twilight256.vim" ]; then \
		echo "Installing twilight256 color scheme..."; \
		mkdir -p ${HOME}/.vim/colors; \
		curl -fsSL https://raw.githubusercontent.com/vim-scripts/twilight256.vim/master/colors/twilight256.vim -o ${HOME}/.vim/colors/twilight256.vim; \
	else \
		echo "twilight256 color scheme already installed"; \
	fi

install: zsh-plugins tpm vundle vim-colors
	@echo "Installing dotfiles into home directory"
	@$(foreach dtfile, $(DOTFILES), ln -sfn $(abspath $(dtfile)) $(HOME)/$(dtfile);)
	@echo "Copying .gitconfig to $(HOME)"
	@cp "$(DOTFILES_DIR)/.gitconfig" "$(HOME)/.gitconfig"
	@"$(DOTFILES_DIR)/scripts/post-install.sh"

clean:
	@echo "Removing dotfiles from home directory"
	@$(foreach dtfile, $(DOTFILES), rm -rf $(HOME)/$(dtfile);)
	@echo "Removing copied .gitconfig"
	@rm -f "$(HOME)/.gitconfig"
	@cat "$(DOTFILES_DIR)/messages/post-clean.txt"

list: 
	@echo $(DOTFILES)
