-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
vim._update_package_paths()

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}
  
  -- EDITOR
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-commentary' }
  use { 'mbbill/undotree' }
  use { 'tpope/vim-fugitive' }
  
  -- UTILS
  use { 'neoclide/coc.nvim', branch: 'release'}
  use { 'zenbro/mirror.vim' }
  use { 'lambdalisue/vim-gista' }
  use { 'vim-pandoc/vim-pandoc' }
  use { 'vim-pandoc/vim-pandoc-syntax' }
  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-telescope/telescope.nvim' }

  -- THEME
  use { 'gruvbox-community/gruvbox' }

  -- syntax
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }




end)
