local keymap = vim.keymap.set

-----------------------------------------------
---------------- NVIM TREE --------------------
-----------------------------------------------

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- enable nvim-tree
require("nvim-tree").setup(
	{
		view = {
			relativenumber = true
		},
		git = {
			ignore = false,
			enable = true,
			timeout = 3000
		}
	}
)
keymap("", "<c-b>", ":NvimTreeToggle<CR>", {})

-----------------------------------------------
--------------- TOKYONIGHT --------------------
-----------------------------------------------
vim.cmd [[colorscheme tokyonight-moon]]

-----------------------------------------------
----------------- LUALINE ---------------------
-----------------------------------------------
require("lualine").setup {
	options = {
		theme = "tokyonight"
	}
}

-----------------------------------------------
------------------- GIT -----------------------
-----------------------------------------------
vim.api.nvim_set_keymap("n", "<leader>gs", ":G<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gd", ":Gdiffsplit<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gc", ":Git commit<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gb", ":Gblame<cr>", {})

-----------------------------------------------
----------------- TELESCOPE -------------------
-----------------------------------------------
local telescope = require("telescope")

telescope.setup {
	defaults = {
		file_ignore_patterns = { ".git", "node_modules", "dist", "venv", ".venv" }
	}
}

local builtin = require("telescope.builtin")

function vim.getVisualSelection()
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

local opts = { noremap = true, silent = true }

keymap("n", "<c-f>", builtin.find_files, {})
keymap("n", "<c-g>", builtin.live_grep, {})
keymap("n", "<leader>b", builtin.buffers, {})
keymap("n", "<leader>gf", builtin.current_buffer_fuzzy_find, opts)
keymap(
	"v",
	"<space>g",
	function()
		local text = vim.getVisualSelection()
		builtin.current_buffer_fuzzy_find({ default_text = text })
	end,
	opts
)
keymap(
	"v",
	"<space>G",
	function()
		local text = vim.getVisualSelection()
		builtin.live_grep({ default_text = text })
	end,
	opts
)

-----------------------------------------------
------------------- MASON ---------------------
-----------------------------------------------
require("mason").setup()
require("mason-lspconfig").setup {
	ensure_installed = { "lua_ls", "tsserver", "pyright" }
}

-----------------------------------------------
------------------- LSP -----------------------
-----------------------------------------------
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" }
			}
		}
	},
	capabilities = capabilities
}
lspconfig.pyright.setup {
	capabilities = capabilities
}
lspconfig.tsserver.setup {
	capabilities = capabilities
}

-- Rename variables
keymap("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true })

-- luasnip setup
local luasnip = require "luasnip"

-- nvim-cmp setup
local cmp = require "cmp"
cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end
	},
	mapping = cmp.mapping.preset.insert(
		{
			["<CR>"] = cmp.mapping.confirm {
				behavior = cmp.ConfirmBehavior.Replace,
				select = true
			},
			["<Tab>"] = cmp.mapping(
				function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end,
				{ "i", "s" }
			),
			["<S-Tab>"] = cmp.mapping(
				function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end,
				{ "i", "s" }
			)
		}
	),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" }
	}
}

keymap("n", "<leader>e", vim.diagnostic.open_float, {})
keymap("n", "<leader>d", vim.lsp.buf.hover)


-----------------------------------------------
--------------- TREESITTER --------------------
-----------------------------------------------
require "nvim-treesitter.configs".setup {
	-- A list of parser names, or "all"
	ensure_installed = { "python", "typescript", "javascript", "html", "tsx" },
	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = true,
	-- Automatically install missing parsers when entering buffer
	auto_install = false,
	-- List of parsers to ignore installing (for "all")
	-- ignore_install = { "javascript" },

	highlight = {
		-- `false` will disable the whole extension
		enable = true,
		-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
		-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
		-- the name of the parser)
		-- list of language that will be disabled
		-- disable = { "sql" },

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false
	},
	autotag = {
		enable = true
	}
}
require 'nvim-treesitter.install'.compilers = { "clang" }

-----------------------------------------------
----------------- COMMENT ---------------------
-----------------------------------------------
require("Comment").setup()

-----------------------------------------------
----------------- OUTLINE ---------------------
-----------------------------------------------
require("symbols-outline").setup()

-----------------------------------------------
---------------- AUTOPAIR ---------------------
-----------------------------------------------
local status, autopairs = pcall(require, "nvim-autopairs")
if not status then
	return
end

autopairs.setup(
	{
		disable_filetype = { "TelescopePrompt", "vim" }
	}
)

-----------------------------------------------
------------- INDENT BLANK LINE ---------------
-----------------------------------------------
require("indent_blankline").setup {
	-- for example, context is off by default, use this to turn it on
	show_current_context = true,
	show_current_context_start = true,
}

-----------------------------------------------
----------------- BUFFERLINE-------------------
-----------------------------------------------
require("bufferline").setup {
	options = {
		numbers = "buffer_id",
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			return "(" .. count .. ")"
		end
	}
}

-----------------------------------------------
---------------- NEOFORMAT --------------------
-----------------------------------------------
vim.api.nvim_set_keymap("n", "<leader>fm", ":Neoformat<cr>", {})
