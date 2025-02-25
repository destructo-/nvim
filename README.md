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
all plugins and configuration will download and apply automatically

restart nvim

## Structure
plugins setup
``/lua/plugins/*``

main settings
``/lua/config/*``

general key mappings
``/lua/config/keymaps.lua``

general settings
``/lua/config/options.lua``

general autocmds
``/lua/config/autocmds.lua``

package manager setup
``/lua/config/lazy.lua``

general setup for lsp
``/lua/config/lsp-base.lua``

## language servers
automatically installs and setups 

by `Mason`
`haskell-language-server`
`lua-language-server`

by configuration
`scala metals`
