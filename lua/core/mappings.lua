-- n, v, i, t = mode names

local M = {}

M.general = {
    n = {
        -- switch between windows
        ["<C-h>"] = {"<C-w>h", "Window left"},
        ["<C-l>"] = {"<C-w>l", "Window right"},
        ["<C-j>"] = {"<C-w>j", "Window down"},
        ["<C-k>"] = {"<C-w>k", "Window up"},
        -- quit
        ["qq"] = {"<cmd>qa<CR>", "Quit Neovim"},
        -- short key to run commands
        [";"] = {":", "Short key to run commands"}
    },
    v = {
        ["//"] = {'y/\\V<C-R>=escape(@",\'/\')<CR><CR>', "Search with selected text"}
    }
}

M.nvimtree = {
    plugin = true,
    n = {
        ["<C-b>"] = {"<cmd>NvimTreeToggle<CR>", "Toggle nvim tree"}
    }
}

M.git = {
    plugin = true,
    n = {
        ["<leader>gs"] = {":G<CR>", "Toggle git status"},
        ["<leader>gd"] = {"<cmd>Gdiffsplit<CR>", "Split buffer and show Git differences"},
        ["<leader>gc"] = {"<cmd>Git commit<CR>", "Commit git"},
        ["<leader>gb"] = {"<cmd>Gblame<CR>", "Show Git blame"}
    }
}

local telescope_builtin = require("telescope.builtin")
M.telescope = {
    plugin = true,
    n = {
        ["<C-f>"] = {telescope_builtin.find_files, "Find files"},
        ["<C-g>"] = {telescope_builtin.live_grep, "Search text globally"},
        ["<leader>b"] = {telescope_builtin.buffers, "Search buffers"},
        ["<leader>gf"] = {telescope_builtin.current_buffer_fuzzy_find, "Search text in current buffer"}
    }
}

return M
