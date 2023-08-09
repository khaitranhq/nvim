local plugins = {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup {}
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function() 
			require("tokyonight").setup({
				style = "night",
			})

			vim.cmd[[colorscheme tokyonight]]
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function () 
			require("lualine").setup {
					options = {
							theme = "tokyonight"
					},
					sections = {
							lualine_b = {"diagnostics"}
					}
			}
		end
	},
	{
		'akinsho/bufferline.nvim', 
		version = "*", 
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function ()
			require("plugins.configs.editor.bufferline")
		end
	},
	{
		"tpope/vim-fugitive"
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.2',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		'williamboman/mason.nvim',
		config = function()
			require("plugins.configs.lsp.mason")
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup {
				ensure_installed = {"lua_ls", "tsserver", "pyright"}
			}
		end
	}
}

require("lazy").setup(plugins)
