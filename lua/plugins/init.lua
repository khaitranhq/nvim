local plugins = {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("nvim-tree").setup {}
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require("tokyonight").setup(
                {
                    style = "night"
                }
            )

            vim.cmd [[colorscheme tokyonight]]
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
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
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("plugins.configs.editor.bufferline")
        end
    },
    {
        "tpope/vim-fugitive"
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",
        dependencies = {"nvim-lua/plenary.nvim"}
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup {
                ensure_installed = {"lua_ls", "tsserver", "pyright"}
            }
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("plugins.configs.lsp.nvim-lspconfig")
        end
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            {
                -- snippet plugin
                "L3MON4D3/LuaSnip",
                dependencies = "rafamadriz/friendly-snippets",
                opts = {history = true, updateevents = "TextChanged,TextChangedI"}
            },
            -- autopairing of (){}[] etc
            {
                "windwp/nvim-autopairs",
                opts = {
                    fast_wrap = {},
                    disable_filetype = {"TelescopePrompt", "vim"}
                },
                config = function(_, opts)
                    require("nvim-autopairs").setup(opts)

                    -- setup cmp for autopairs
                    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
                    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
                end
            },
            -- cmp sources plugins
            {
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path"
            },
            {
                "SmiteshP/nvim-navbuddy",
                dependencies = {
                    "SmiteshP/nvim-navic",
                    "MunifTanjim/nui.nvim"
                },
                opts = {lsp = {auto_attach = true}}
            }
        },
        config = function(_, _)
            require("plugins.configs.lsp.nvim-cmp")
        end
    },
    {
        "mhartington/formatter.nvim",
        config = function()
            require("plugins.configs.lsp.formatter")
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("plugins.configs.lsp.tresitter")
        end
    },
    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup()
        end
    },
    {
        "numToStr/Comment.nvim",
        opts = {},
        config = function()
            require("Comment").setup()
        end,
        lazy = false
    }
}

require("lazy").setup(plugins)
