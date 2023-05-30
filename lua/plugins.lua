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

	-- File finders
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
	-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}


end)
