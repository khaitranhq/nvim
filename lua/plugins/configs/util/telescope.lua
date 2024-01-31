require("telescope").setup {
    defaults = {
        file_ignore_patterns = {
            "node_modules/",
            "/dist/",
            "^venv/",
            "^.venv/",
            "^.git/",
            "!^.github/"
        }
    },
    pickers = {
        find_files = {
            hidden = true,
            no_ignore = true
        }
    }
}

local telescope_builtin = require("telescope.builtin")
function search_with_selected_text()
    local text = vim.getVisualSelection()
    telescope_builtin.live_grep({default_text = text})
end
