local opt = vim.opt

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
opt.foldlevel=20


-- Move between splitted tabs
vim.api.nvim_set_keymap("", "<c-k>", ":wincmd k<cr>", {noremap = true})
vim.api.nvim_set_keymap("", "<c-j>", ":wincmd j<cr>", {noremap = true})
vim.api.nvim_set_keymap("", "<c-h>", ":wincmd h<cr>", {noremap = true})
vim.api.nvim_set_keymap("", "<c-l>", ":wincmd l<cr>", {noremap = true})

-- Short key to quit
vim.api.nvim_set_keymap("", "qq", ":qa<cr>", {noremap = true})

-- Change leader key
vim.g.mapleader = " "

-- Short key to run commands
vim.api.nvim_set_keymap("n", ";", ":", {noremap = true})

-- Resize buffer
vim.api.nvim_set_keymap('', '<leader>.', '<C-W>>',{noremap=true})
vim.api.nvim_set_keymap('', '<leader>,', '<C-W><',{noremap=true})
vim.api.nvim_set_keymap('', '<leader>-', '<C-W>-',{noremap=true})
vim.api.nvim_set_keymap('', '<leader>=', '<C-W>+',{noremap=true})

-- Search with current select text
vim.api.nvim_set_keymap("v", "//", "y/\\V<C-R>=escape(@\",'/\')<CR><CR>", {noremap = true})

-- Get path of current file
vim.api.nvim_create_user_command('Cwd', 'echo @%', {})

-- Convert file from win to unix style 
vim.api.nvim_set_keymap('n', '<leader>du', ':!dos2unix %<CR>', {silent = true})
