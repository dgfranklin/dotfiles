dotfiles
========

A collection of my dotfiles used across computers.
Uses [homeshick](https://github.com/andsens/homeshick) to recursively symbolically link dotfiles in.
For example, this allows for us to have a .config/fish/functions directory that contains both files in public repository and some **not** in a a private repository.
This is particularly useful if you want to include some private (eg. work-related) functions.

There is a relatively untested install script that you can use to bootstrap this with:

```console
$ bash <(curl https://raw.githubusercontent.com/dgfranklin/dotfiles/master/install.sh)
```console
