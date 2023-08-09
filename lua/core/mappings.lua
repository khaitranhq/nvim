-- n, v, i, t = mode names

local M = {}

M.general = {
    i = {},
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
    t = {},
    v = {
        ["//"] = {'y/\\V<C-R>=escape(@",\'/\')<CR><CR>', "Search with selected text"}
    },
    x = {}
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

return M
