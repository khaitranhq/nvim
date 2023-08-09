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
		"tpope/vim-fugitive"
	}
}

require("lazy").setup(plugins)
