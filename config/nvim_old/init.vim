
" Smecify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')
" ================================
" EDITOR
" ================================
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'

" ================================
" UTILS
" ================================
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'zenbro/mirror.vim'
Plug 'lambdalisue/vim-gista'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'https://github.com/alok/notational-fzf-vim'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'stsewd/fzf-checkout.vim'
Plug 'hashivim/vim-terraform'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'


" theme
Plug 'sainnhe/gruvbox-material'
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/sonokai'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'drewtempelmeyer/palenight.vim'
" testing
Plug 'geljo/project-clip.vim'
Plug 'puremourning/vimspector'


" Tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'



call plug#end()

lua require("johann.telescope")

" colorscheme gruvbox
" colorscheme one
" colorscheme onedark
colorscheme palenight
" colorscheme molokai
" colorscheme molokayo
" colorscheme gruvbox-material
" colorscheme archery
" colorscheme deus
" colorscheme space-vim-dark
" colorscheme sonokai
highlight Normal ctermbg=none 
" highlight Visual ctermfg=bg ctermbg=fg
highlight LineNr ctermfg=lightblue ctermbg=none 

let mapleader = " "


"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

" For MAC use pbcopy
if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif
