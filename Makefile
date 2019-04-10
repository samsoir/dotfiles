DOTFILES_SEARCH := $(wildcard .??*)
EXCLUSIONS      := .git .gitmodules
DOTFILES        := $(filter-out $(EXCLUSIONS), $(DOTFILES_SEARCH))

.PHONY: install clean list

install:
	@echo "Installing dotfiles into home directory"
	@$(foreach dtfile, $(DOTFILES), ln -sfn $(abspath $(dtfile)) $(HOME)/$(dtfile);)

clean:
	@echo "Removing dotfiles from home directory"
	@$(foreach dtfile, $(DOTFILES), rm -rf $(HOME)/$(dtfile);)

list: 
	@echo $(DOTFILES)
