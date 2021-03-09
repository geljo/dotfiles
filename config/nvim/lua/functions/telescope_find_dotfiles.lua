-- custom function to quickly edit dotfiles

local M = {}

function M.edit_dotfiles()
  require('telescope.builtin').find_files {
    shorten_path = false,
    cwd = "~/GIT/private/dotfiles",
    prompt = "~ dotfiles ~",
    height = 10,
    layout_strategy = 'horizontal'
  }
end
