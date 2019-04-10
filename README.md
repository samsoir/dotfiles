# Dotfiles

This is a repository that contains my mostly generic dot files for linux
distributions. It was originally built for ChromeOS linux, but should be
portable to any linux like environment that uses these tools.

# Supported Configurations

The following applications have configurations in this project;

- zsh
- tmux
- vim

# How to install

Clone this repository into your `$HOME` directory

```
git clone <project>
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
