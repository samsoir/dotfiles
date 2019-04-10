# Dotfiles

This is a repository that contains my mostly generic dot files for linux
distributions. It was originally built for ChromeOS linux, but should be
portable to any linux like environment that uses these tools.

# Supported Configurations

The following applications have configurations in this project;

- zsh
- tmux
- vim
- git

# How to install

Clone this repository into your `$HOME` directory

```
git clone https://github.com/samsoir/dotfiles.git ~/dotfiles 
```

Then make the project

```
make install
```

The make file will place symbollic links to these configurations into
your home directory.

# Clean up

To clean up the dotfiles from your home directory

```
make clean
```

# Contributions

Contributions are welcome. Please fork this repository and make your
contributions there. When ready, create a Pull Request if you wish to
integrate your changes into this repository.

# LICENSE

This project is licensed under the open source MIT License. See LICENSE file
in this repository for terms.
