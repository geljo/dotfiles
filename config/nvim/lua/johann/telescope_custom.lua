-- custom function to quickly edit dotfiles



local actions = require('telescope.actions')

require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

require('telescope').load_extension('fzy_native')

local M = {}

M.search_dotfiles = function() 
    require("telescope.builtin").find_files({
        prompt_title = "~ Dotfiles ~",
        cwd = '$HOME/GIT/private/dotfiles',
    })
end


M.grep_notes = function() 
    require("telescope.builtin").live_grep({
        prompt_title = "~ Notes ~",
        cwd = '$HOME/GIT/private/org',
    })
end




-- function edit_dotfiles()
--   require('telescope.builtin').find_files {
--     search_dirs = { dotfiles },
--     shorten_path = false,
--     cwd = "~/GIT/private/dotfiles",
--     prompt = "~ dotfiles ~",
--     height = 10,
--     layout_strategy = 'horizontal'
--   }
-- end


-- function find_notes()
--   require('telescope.builtin').live_grep {
--     search_dirs = { notes},
--     shorten_path = false,
--     cwd = "~/GIT/private/org",
--     prompt = "~ Notes ~",
--     height = 10,
--     layout_strategy = 'horizontal'
--   }
-- end
