ln -s {path}/nvim  {path_to_home}/.config/nvim
cd {path_to_home}/.config/nvim
nvim .
:h rtp

make shure $XDG_CONFIG_HOME/nvim/after is set as {path_to_home}/.config/nvim/after
go to lua/main/packer.lua

:so
:PackerSync

restart nvim

main settings
``/lua/main/*``

plugins setup
``/after/plugin/*``

main key mappings
``/lua/main/remap.lua``

main settings
``/lua/main/set.lua``
