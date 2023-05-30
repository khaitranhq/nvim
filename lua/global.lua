local opt = vim.opt

-- tab indent
opt.tabstop = 2
opt.shiftwidth = 2

-- show relative line number
opt.number = true
opt.relativenumber = true

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Move between splitted tabs
vim.api.nvim_set_keymap("", "<c-k>", ":wincmd k<cr>", {noremap = true})
vim.api.nvim_set_keymap("", "<c-j>", ":wincmd j<cr>", {noremap = true})
vim.api.nvim_set_keymap("", "<c-h>", ":wincmd h<cr>", {noremap = true})
vim.api.nvim_set_keymap("", "<c-l>", ":wincmd l<cr>", {noremap = true})

-- Short key to quit
vim.api.nvim_set_keymap("", "qq", ":qa<cr>", {noremap = true})

-- Change leader key
vim.g.mapleader = " "
