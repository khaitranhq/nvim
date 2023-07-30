vim.cmd [[packadd packer.nvim]]

return require("packer").startup(
    function(use)
        -- Packer can manage itself
        use "wbthomason/packer.nvim"

        -- Files explorer
        use {
            "nvim-tree/nvim-tree.lua",
            requires = {
                "nvim-tree/nvim-web-devicons" -- optional
            }
        }

        -- Theme
        use "folke/tokyonight.nvim"

        -- Status line
        use {
            "nvim-lualine/lualine.nvim",
            requires = {
                "nvim-tree/nvim-web-devicons",
                opt = true
            }
        }

        -- Git manager
        use "tpope/vim-fugitive"

        -- File finders
        use {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.1",
            requires = {{"nvim-lua/plenary.nvim"}}
        }

        -- Install neccessary packages
        use "williamboman/mason.nvim"
        use "williamboman/mason-lspconfig.nvim"

        -- Configs for LSP
        use "neovim/nvim-lspconfig" -- Collection of configurations for built-in LSP client
        use "hrsh7th/nvim-cmp" -- Autocompletion plugin
        use "hrsh7th/cmp-buffer" -- Buffer words suggest
        use "hrsh7th/cmp-path" -- Path source for nvim-cmp
        use "hrsh7th/cmp-nvim-lsp" -- LSP source for nvim-cmp
        use "saadparwaiz1/cmp_luasnip" -- Snippets source for nvim-cmp
        use "L3MON4D3/LuaSnip" -- Snippets plugin

        -- Syntax
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate"
        }

        -- Tag/pairs
        use {
            "windwp/nvim-autopairs",
            config = function()
                require("nvim-autopairs").setup {}
            end
        }
        use "windwp/nvim-ts-autotag"

        -- Comment code
        use "numToStr/Comment.nvim"

        -- Outline
        use "simrat39/symbols-outline.nvim"

        -- Markdown Preview
        use(
            {
                "iamcco/markdown-preview.nvim",
                run = function()
                    vim.fn["mkdp#util#install"]()
                end
            }
        )

        -- Indent blank line
        use "lukas-reineke/indent-blankline.nvim"

        -- Some utilize short keys
        use "tpope/vim-surround"

        -- Bufferline
        use {"akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons"}

        -- Format code
        use {
            "phaazon/hop.nvim",
            branch = "v2", -- optional but strongly recommended
            config = function()
                -- you can configure Hop the way you like here; see :h hop-config
                require "hop".setup {}
            end
        }

        use {
            "beauwilliams/focus.nvim",
            config = function()
                require("focus").setup()
            end
        }

        use {
            "SmiteshP/nvim-navbuddy",
            requires = {
                "neovim/nvim-lspconfig",
                "SmiteshP/nvim-navic",
                "MunifTanjim/nui.nvim",
                "numToStr/Comment.nvim", -- Optional
                "nvim-telescope/telescope.nvim" -- Optional
            }
        }

        use {
            "folke/trouble.nvim",
            requires = {
                "nvim-tree/nvim-web-devicons"
            }
        }

        use {
            "nvim-pack/nvim-spectre",
            requires = {
                "nvim-lua/plenary.nvim"
            }
        }

        use {
            "rmagatti/goto-preview",
            opts = {}
        }

        use {
            "folke/todo-comments.nvim",
            requires = {
                "nvim-lua/plenary.nvim"
            }
        }

        use {
            "olexsmir/gopher.nvim",
            requires = {
                "nvim-lua/plenary.nvim",
                "nvim-treesitter/nvim-treesitter"
            }
        }

        use {"mhartington/formatter.nvim"}

        use "mfussenegger/nvim-dap"
        use {"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}}
        use "jay-babu/mason-nvim-dap.nvim"
    end
)
