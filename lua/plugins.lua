vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Files explorer
  use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional
		},
  }

	-- Theme
	use 'folke/tokyonight.nvim'

	-- Status line
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 
			'nvim-tree/nvim-web-devicons', opt = true 
		}
	}

	-- Git manager
	use "tpope/vim-fugitive"

end)
