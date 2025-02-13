# Nvim Config

this setup is mostly for work with scala metals

but you can setup base support for what-you-whant-language using `:Mason` command

## Clean plugins cache
```bash
rm -rf ~/.local/share/nvim/*
```

## Setup
make simlink to default configuration folder
```bash
$ ln -s {path}/nvim  {path_to_home}/.config/nvim
```
go to vim configuration folder
```bash
$ cd {path_to_home}/.config/nvim
```
open nvim there
```bash
nvim .
```
open `lua/main/packer.lua`

```vim
:so
```
```vim
:PackerSync
```

restart nvim

## Structure
main settings
``/lua/main/*``

plugins setup
``/plugins/*``

main key mappings
``/lua/main/remap.lua``

main settings
``/lua/main/set.lua``
