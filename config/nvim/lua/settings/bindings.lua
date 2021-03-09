local configs = { dotfiles = '~/GIT/private/dotfiles'}

--- helper function to create bindings
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- set leader key to <space>
vim.g.mapleader = " "

-- Windows

map('n', '<leader>wv', '<C-w>v')
map('n', '<leader>ws', '<C-w>s')
map('n', '<leader>wd', '<C-w>c')

map('n', '<leader>wh', '<C-w>h')
map('n', '<leader>wj', '<C-w>j')
map('n', '<leader>wk', '<C-w>k')
map('n', '<leader>wl', '<C-w>l')

--  buffers
map('n', '<leader>bd', '<cmd>bd<CR>')

-- copy pasting for mac
map('v', '<C-x>', "<cmd>:!pbcopy<cr>")
map('v', '<C-c>', "<cmd>:w !pbcopy<cr><cr>")

-- git
map('n', '<leader>gg', '<cmd>Git <cr>')
map('n', '<leader>gl', "<cmd>Git log<cr>")

-- telescope
map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files({ hidden=true})<cr>")
map('n', '<leader>bb', "<cmd>lua require('telescope.builtin').buffers()<cr>")
map('n', '<leader>*', "<cmd>lua require('telescope.builtin').live_grep()<cr>")
map('n', '<leader>ch', "<cmd>lua require('telescope.builtin').command_history()<cr>")
map('n', '<leader>y', "<cmd>lua require('telescope.builtin').registers()<cr>")
map('n', '<leader>/', "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>")
map('n', '<leader>gb', "<cmd>lua require('telescope.builtin').git_branches()<cr>")
map('n', '<leader>gc', "<cmd>lua require('telescope.builtin').git_commits()<cr>")
map('n', '<leader>tl', "<cmd>lua require('telescope.builtin').treesitter()<cr>")
map('n', '<leader>ec', "<cmd>lua require('telescope.builtin').find_files({ search_dirs = configs })<cr>")


-- lsp
map('n', '<space>,', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', '<space>;', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
--  map('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<space>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<space>K', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<space>gr', '<cmd>lua vim.lsp.buf.references()<CR>')
-- map('n', '<space>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')

-- terminal
map('n', '<space>sh', '<cmd>term<cr>')
map('t', '<esc>', '<C-\\><C-n>')

