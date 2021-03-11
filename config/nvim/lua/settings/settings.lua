
-- vim.o = global options
-- vim.bo = buffer-scoped options
-- vim.wo = window-scoped options

local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

local cmd = vim.cmd
local indent = 2

cmd('syntax on')
cmd 'colorscheme palenight'
cmd "set clipboard=unnamed,unnamedplus"
cmd "set undodir=~/.config/nvim/undodir"

opt('b', 'expandtab', true)
opt('b', 'shiftwidth', indent)
opt('b', 'smartindent', true)
opt('b', 'tabstop', indent)
opt('b', 'autoread', true)
opt('o', 'hidden', true)
opt('o', 'undodir', '~/.config/nvim/undodir')
opt('o', 'smartcase', true)
opt('o', 'ignorecase', true)
opt('o', 'scrolloff', 8)
opt('o', 'splitbelow', true)
opt('o', 'splitright', true)
opt('w', 'list', true)
opt('w', 'number', true)
opt('w', 'relativenumber', true)
opt('w', 'wrap', false)

cmd("highlight LineNr ctermfg=lightblue ctermbg=none")
cmd("highlight Normal ctermbg=none")
