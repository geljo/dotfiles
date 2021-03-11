local dotfiles_dir = "$HOME/GIT/private/dotfiles"
local notes_dir = "$HOME/GIT/private/org/"
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

local M = {}

M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "~ Dotfiles ~",
        cwd = dotfiles_dir,
    })
end

local function open_note(content)
    vim.cmd("e notes_dir\"'" .. content .. "\'")
end

local function create_note(prompt_bufnr, map )
    local function edit_note(close)
        local content = 
        require('telescope.actions.state').get_selected_entry(prompt_bufnr)
        open_note(content.cwd .. "/" .. content.value)
        if close then
            require('telescope.actions').close(prompt_bufnr)
        end
    end

    map('i', '<C-x>', function()
        open_note()
    end)
end

M.search_notes = function()
    require("telescope.builtin").live_grep({
        prompt_title = "~ Notes ~",
        cwd = notes_dir,
    })
end

return M
