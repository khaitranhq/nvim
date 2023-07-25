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
    },
    sections = {
        lualine_b = {"diagnostics"}
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
        file_ignore_patterns = {".git", "node_modules", "dist", "venv", ".venv"}
    },
    pickers = {
        find_files = {
            hidden = true
        }
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

local opts = {noremap = true, silent = true}

keymap("n", "<c-f>", builtin.find_files, {})
keymap("n", "<c-g>", builtin.live_grep, {})
keymap("n", "<leader>b", builtin.buffers, {})
keymap("n", "<leader>gf", builtin.current_buffer_fuzzy_find, opts)
keymap(
    "v",
    "<space>g",
    function()
        local text = vim.getVisualSelection()
        builtin.current_buffer_fuzzy_find({default_text = text})
    end,
    opts
)
keymap(
    "v",
    "<space>G",
    function()
        local text = vim.getVisualSelection()
        builtin.live_grep({default_text = text})
    end,
    opts
)

-----------------------------------------------
------------------- MASON ---------------------
-----------------------------------------------
require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {"lua_ls", "tsserver", "pyright"}
}

-----------------------------------------------
------------------- LSP -----------------------
-----------------------------------------------
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")
local navbuddy = require("nvim-navbuddy")

lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = {"vim"}
            }
        }
    },
    capabilities = capabilities
}
lspconfig.pyright.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navbuddy.attach(client, bufnr)
    end
}
lspconfig.tsserver.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navbuddy.attach(client, bufnr)
    end
}
lspconfig.gopls.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navbuddy.attach(client, bufnr)
    end
}

-- Rename variables
keymap("n", "<leader>rn", vim.lsp.buf.rename, {noremap = true})

-- Move between diagnostic messages
keymap("n", "[d", vim.diagnostic.goto_prev)
keymap("n", "]d", vim.diagnostic.goto_next)

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
                {"i", "s"}
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
                {"i", "s"}
            )
        }
    ),
    sources = {
        {name = "nvim_lsp"},
        {name = "luasnip"},
        {name = "buffer"},
        {name = "path"}
    }
}

keymap("n", "<leader>e", vim.diagnostic.open_float, {})
keymap("n", "<leader>d", vim.lsp.buf.hover)

-----------------------------------------------
--------------- TREESITTER --------------------
-----------------------------------------------
require "nvim-treesitter.configs".setup {
    -- A list of parser names, or "all"
    ensure_installed = {"python", "typescript", "javascript", "html", "tsx"},
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
require "nvim-treesitter.install".compilers = {"clang"}

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
        disable_filetype = {"TelescopePrompt", "vim"}
    }
)

-----------------------------------------------
------------- INDENT BLANK LINE ---------------
-----------------------------------------------
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true
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

-----------------------------------------------
------------------ MOTION ---------------------
-----------------------------------------------
local hop = require("hop")
hop.setup {}
keymap("n", "<leader>hl", hop.hint_lines, {})
keymap("n", "<leader>hp", hop.hint_patterns, {})
keymap("n", "<leader>hw", hop.hint_words, {})
keymap("n", "<leader>hv", hop.hint_vertical, {})

-----------------------------------------------
------------------- FOCUS ---------------------
-----------------------------------------------
require("focus").setup()

-----------------------------------------------
------------------- SPECTRE ---------------------
-----------------------------------------------
local spectre = require("spectre")
vim.keymap.set("n", "<leader>S", spectre.toggle, {desc = "Toggle Spectre"})
vim.keymap.set(
    "n",
    "<leader>sw",
    '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
    {
        desc = "Search current word"
    }
)
vim.keymap.set(
    "v",
    "<leader>sw",
    '<esc><cmd>lua require("spectre").open_visual()<CR>',
    {
        desc = "Search current word"
    }
)
vim.keymap.set(
    "n",
    "<leader>sp",
    '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
    {
        desc = "Search on current file"
    }
)

-----------------------------------------------
--------------- GOTO_PREVIEW ------------------
-----------------------------------------------
require("goto-preview").setup()
vim.keymap.set("n", "<leader>gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", {noremap = true})
vim.keymap.set(
    "n",
    "<leader>gpt",
    "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
    {noremap = true}
)
vim.keymap.set(
    "n",
    "<leader>gpi",
    "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
    {noremap = true}
)
vim.keymap.set("n", "<leader>gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", {noremap = true})

-----------------------------------------------
--------------- TODO_COMMENTS -----------------
-----------------------------------------------

require("todo-comments").setup()
