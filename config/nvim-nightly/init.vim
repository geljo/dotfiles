set runtimepath-=~/.config/nvim
set runtimepath-=~/.config/nvim/after
set runtimepath-=~/.local/share/nvim/site
set runtimepath-=~/.local/share/nvim/site/after

set runtimepath+=~/.config/nvim-nightly/after
set runtimepath^=~/.config/nvim-nightly
set runtimepath+=~/.local/share/nvim-nightly/site/after
set runtimepath^=~/.local/share/nvim-nightly/site

set packpath-=~/.config/nvim
set packpath-=~/.config/nvim/after
set packpath-=~/.local/share/nvim/site
set packpath-=~/.local/share/nvim/site/after

set packpath^=~/.config/nvim-nightly
set packpath+=~/.config/nvim-nightly/after
set packpath^=~/.local/share/nvim-nightly/site
set packpath+=~/.local/share/nvim-nightly/site/after

call plug#begin('~/.config/nvim-nightly/plugged/')

call plug#end()


autocmd BufWritePost plugins.lua PackerCompile



lua << EOF
require('lua/init.lua')
require('packer').startup(...)
EOF
