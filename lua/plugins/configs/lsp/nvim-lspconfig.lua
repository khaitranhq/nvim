local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")
local navbuddy = require("nvim-navbuddy")
local util = require "lspconfig/util"

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
    end,
    cmd = {"gopls"},
    filetypes = {"go", "gomod", "gowork", "gotmpl"},
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            completeUnimported = true
        }
    }
}
lspconfig.clangd.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navbuddy.attach(client, bufnr)
    end
}

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd(
    "LspAttach",
    {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
            -- Enable completion triggered by <c-x><c-o>
            vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

            -- Buffer local mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            local opt = {buffer = ev.buf}
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opt)
        end
    }
)
