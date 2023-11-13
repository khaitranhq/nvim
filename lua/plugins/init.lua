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
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({})
            vim.cmd.colorscheme "catppuccin"
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
                    theme = "catppuccin"
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
        after = "catppuccin",
        config = function()
            require("plugins.configs.editor.bufferline")
        end
    },
    -- {
    --     "tpope/vim-fugitive"
    -- },
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
            require("mason").setup {
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
                "L3MON4D3/LuaSnip",
                -- follow latest release.
                version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
                -- install jsregexp (optional!).
                build = "make install_jsregexp"
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
        dependencies = {
            "windwp/nvim-ts-autotag"
        },
        config = function()
            require("plugins.configs.lsp.tresitter")
        end
    },
    -- {
    --     "folke/which-key.nvim",
    --     config = function()
    --         require("which-key").setup()
    --     end
    -- },
    {
        "numToStr/Comment.nvim",
        opts = {},
        config = function()
            require("Comment").setup()
        end,
        lazy = false
    },
    -- Blank line for Indent
    {"lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {}},
    -- Surround actions
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end
    },
    -- Fast motions
    {
        "phaazon/hop.nvim",
        branch = "v2", -- optional but strongly recommended
        config = function()
            require("hop").setup()
        end
    },
    -- Focus on the buffer that you're working
    {
        "nvim-focus/focus.nvim",
        version = "*",
        config = function()
            require("focus").setup()
        end
    },
    -- Search in entire project
    {
        "nvim-pack/nvim-spectre",
        dependencies = {
            "nvim-lua/plenary.nvim"
        }
    },
    -- Preview definition using LSP
    {
        "rmagatti/goto-preview",
        config = function()
            require("goto-preview").setup {}
        end
    },
    -- Preview markdown
    {
        "iamcco/markdown-preview.nvim",
        config = function()
            vim.fn["mkdp#util#install"]()
        end
    },
    -- Debug
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
    -- Toggle terminal
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("plugins.configs.editor.term")
        end
    },
    -- Show underline same words
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
    -- Close buffers after 1 minute of inactivity
    {
        "chrisgrieser/nvim-early-retirement",
        config = true,
        opts = {
            retirementAgeMins = 1
        },
        event = "VeryLazy"
    },
    -- Replace message, cmdliine, popupmenu
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            lsp = {
                signature = {
                    enabled = false
                }
            }
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify"
        }
    },
    -- Show function signature when you type
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {},
        config = function(_, opts)
            require "lsp_signature".setup(opts)
        end
    },
    --- Show Color of hex,...
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require "colorizer".setup()
        end
    }
}

require("lazy").setup(plugins)
