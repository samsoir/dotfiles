DOTFILES_DIR    := $(shell pwd)
DOTFILES_SEARCH := $(wildcard .??*)
EXCLUSIONS      := .git .gitmodules .gitignore
DOTFILES        := $(filter-out $(EXCLUSIONS), $(DOTFILES_SEARCH))

.PHONY: install clean list reload zsh-plugins oh-my-zsh

oh-my-zsh:
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

install: zsh-plugins
	@echo "Installing dotfiles into home directory"
	@$(foreach dtfile, $(DOTFILES), ln -sfn $(abspath $(dtfile)) $(HOME)/$(dtfile);)
	@cat "$(DOTFILES_DIR)/messages/post-install.txt"

clean:
	@echo "Removing dotfiles from home directory"
	@$(foreach dtfile, $(DOTFILES), rm -rf $(HOME)/$(dtfile);)
	@cat "$(DOTFILES_DIR)/messages/post-clean.txt"

list: 
	@echo $(DOTFILES)
