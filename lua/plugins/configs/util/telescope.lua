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
local function getVisualSelection()
    vim.cmd('noau normal! "vy"')
    local text = vim.fn.getreg("v")
    vim.fn.setreg("v", {})

    text = string.gsub(text, "\n", "")
    if #text > 0 then
        return text
    else
        return ""
    end
end

function vim.search_with_selected_text()
    local text = getVisualSelection()
    telescope_builtin.live_grep({default_text = text})
end
