DOTFILES_DIR    := $(shell pwd)
DOTFILES_SEARCH := $(wildcard .??*)
EXCLUSIONS      := .git .gitmodules .gitignore
DOTFILES        := $(filter-out $(EXCLUSIONS), $(DOTFILES_SEARCH))

.PHONY: install clean list reload

install:
	@echo "Installing dotfiles into home directory"
	@$(foreach dtfile, $(DOTFILES), ln -sfn $(abspath $(dtfile)) $(HOME)/$(dtfile);)
	@cat "$(DOTFILES_DIR)/messages/post-install.txt"

clean:
	@echo "Removing dotfiles from home directory"
	@$(foreach dtfile, $(DOTFILES), rm -rf $(HOME)/$(dtfile);)
	@cat "$(DOTFILES_DIR)/messages/post-clean.txt"

list: 
	@echo $(DOTFILES)
