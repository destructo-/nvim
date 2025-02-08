# Nvim Config

this setup is mostly for work with scala metals

but you can setup base support for what-you-whant-language using `:Mason` command

## Setup
make simlink to default configuration folder
```
$ ln -s {path}/nvim  {path_to_home}/.config/nvim
```
go to vim configuration folder
```
$ cd {path_to_home}/.config/nvim
```
open nvim there
```
nvim .
```
call 
```
:h rtp
```

and make shure that `$XDG_CONFIG_HOME/nvim/after` is set as `{path_to_home}/.config/nvim/after`
open `lua/main/packer.lua`

```
:so
```
```
:PackerSync
```

restart nvim

## Structure
main settings
``/lua/main/*``

plugins setup
``/after/plugin/*``

main key mappings
``/lua/main/remap.lua``

main settings
``/lua/main/set.lua``
