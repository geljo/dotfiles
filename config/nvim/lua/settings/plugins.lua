vim.cmd 'packadd paq-nvim'

local paq = require('paq-nvim').paq

paq {'savq/paq-nvim', opt = true}

-- Editor
paq {'tpope/vim-fugitive'}
paq {'tpope/vim-commentary'}
paq {'tpope/vim-surround'}
paq {'mbbill/undotree'}

-- utils
paq {'nvim-treesitter/nvim-treesitter', run='<cmd>TSUpdate<cr>'}
paq {'nvim-telescope/telescope.nvim'}
paq {'nvim-telescope/telescope-fzy-native.nvim'}
paq {'nvim-lua/popup.nvim'}
paq {'nvim-lua/plenary.nvim'}
paq {'neovim/nvim-lspconfig'}
paq {'neoclide/coc.nvim', branch='release'}
paq {'nvim-telescope/telescope-project.nvim'}

-- some beautification
paq {'rafi/awesome-vim-colorschemes'}
paq {'drewtempelmeyer/palenight.vim'}
