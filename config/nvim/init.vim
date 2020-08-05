" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')
" ================================
" EDITOR
" ================================
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
" ================================
" GIT
" ================================
" Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mbbill/undotree'
Plug 'kdheepak/lazygit.nvim', { 'branch': 'nvim-v0.4.3' }


" ================================
" THEME
" ================================
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim' 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" ================================
" UTILS
" ================================
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'wakatime/vim-wakatime'
Plug 'https://github.com/alok/notational-fzf-vim'
Plug 'vimwiki/vimwiki'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

" Initialize plugin system
call plug#end()

" TODO check if this section is needed
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu 
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch

set splitright
set splitbelow

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

set hidden

" =======================================
" CUSTOM SETTINGS
" =======================================


let mapleader = "\<Space>"
colorscheme gruvbox
set background=dark

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

"" TODO Fix backspace indent
set backspace=indent,eol,start

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" =======================
" Package setttings
" =======================

"
"" +++++++++++++++++++++++++++++++++++
" UltiSnips and Snippets configuration
" +++++++++++++++++++++++++++++++++++
let g:UltiSnipsExpandTrigger="<tab>" " Don't use tab as trigger if using YCM  
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" +++++++++++++++++++++++
" FZF and Ripgrep
" +++++++++++++++++++++++

if executable('rg')
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
    let g:rg_derive_root='true'
    set grepprg=rg\ --vimgrep
    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

" set command for ripgrep
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)


let g:fzf_preview_window = 'right:50%'
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_tags_command = 'ctags -R'




" +++++++++++++++++++++++
" Documentation and notes
" +++++++++++++++++++++++
let g:nv_search_paths = ['~/GIT/private/vimwiki/', '~/GIT/private/vimwiki-work/']
let g:vimwiki_list = [{'path': '~/GIT/private/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}, 
                      \ {'path': '~/GIT/private/vimwiki-work/', 
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" +++++++++++++++++++++
" Vim Airline
" +++++++++++++++++++++
let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif


let g:airline_powerline_fonts = 1

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif



" ============
" KEY BINDINGS
" ============

" WindowManagement
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wj :wincmd j<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>wl :wincmd l<CR>

nnoremap <leader>wd :q<CR>
tnoremap <leader>wr <C-W><C-R><CR>


nnoremap <leader>ws :split<CR>
nnoremap <leader>wv :vsplit<CR>

" Buffers
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bb :Buffers <CR>

" Files
nnoremap <leader>ff :Files<CR>
nnoremap <leader>ft :NERDTreeToggle<CR>

"  Grep *
nnoremap <leader>* :Rg <CR>

" Commandhistory
nnoremap <leader>ch :History:<CR>

" COC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition) nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Tags
" nnoremap <leader>tt :Tags<CR>

" " Undotree
nnoremap <leader>u :UndotreeShow<CRq

" GIT
" setup mapping to call :LazyGit
nnoremap <silent> <leader>gg :LazyGit<CR>

" Terminal 
nnoremap <leader>sh :terminal<CR>

" make escape key work in Terminal
" tnoremap <Esc> <C-\><C-n><CR>
