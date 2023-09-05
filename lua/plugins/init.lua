local plugins = {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("plugins.configs.editor.nvim-tree")
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
                    style = "night",
                    on_colors = function(colors)
                        colors.border = "#565f89"
                    end
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
                    theme = "nightfly"
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
        dependencies = {"nvim-lua/plenary.nvim"},
        config = function()
            require("plugins.configs.util.telescope")
        end
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
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup {
                -- for example, context is off by default, use this to turn it on
                show_current_context = true,
                show_current_context_start = true
            }
        end
    },
    {
        "tpope/vim-surround"
    },
    {
        "phaazon/hop.nvim",
        branch = "v2", -- optional but strongly recommended
        config = function()
            require("hop").setup()
        end
    },
    {
        "nvim-focus/focus.nvim",
        version = "*",
        config = function()
            require("focus").setup()
        end
    },
    {
        "folke/trouble.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        opts = {}
    },
    {
        "nvim-pack/nvim-spectre",
        dependencies = {
            "nvim-lua/plenary.nvim"
        }
    },
    {
        "rmagatti/goto-preview",
        config = function()
            require("goto-preview").setup {}
        end
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify"
        }
    },
    {
        "iamcco/markdown-preview.nvim",
        config = function()
            vim.fn["mkdp#util#install"]()
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap"
        },
        config = function()
            require("plugins.configs.lsp.nvim-dap")
        end
    },
    {
        "folke/todo-comments.nvim",
        dependencies = {"nvim-lua/plenary.nvim"},
        config = function()
            require("todo-comments").setup()
        end
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("plugins.configs.editor.term")
        end
    },
    {
        "yamatsum/nvim-cursorline",
        config = function()
            require("nvim-cursorline").setup {
                cursorline = {
                    enable = true,
                    timeout = 1000,
                    number = false
                },
                cursorword = {
                    enable = true,
                    min_length = 3,
                    hl = {underline = true}
                }
            }
        end
    },
    {
        "code-biscuits/nvim-biscuits",
        config = function()
            require("nvim-biscuits").setup(
                {
                    cursor_line_only = true
                }
            )
        end
    },
    {
        "chrisgrieser/nvim-early-retirement",
        config = true,
        opts = {
            retirementAgeMins = 1
        },
        event = "VeryLazy"
    },
    {
        "folke/twilight.nvim",
        config = function()
            require("twilight").setup()
            -- require("twilight").enable()
        end
    }
}

require("lazy").setup(plugins)
