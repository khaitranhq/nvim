local opt = vim.opt

------------------------options------------------------
-- tab indent
opt.tabstop = 2
opt.shiftwidth = 2

-- show relative line number
opt.number = true
opt.relativenumber = true

-- Set clipboard
opt.clipboard = "unnamed,unnamedplus"

-- set termguicolors to enable highlight groups
opt.termguicolors = true

-- set foldmethod
opt.foldmethod = "indent"
opt.foldlevel = 20

-- set border line for horizontal splitting
opt.laststatus = 3

-------------------------global-------------------------
vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
