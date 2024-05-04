require("neodev").setup({
  -- add any options here, or leave empty to use the default settings
})
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")
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
    capabilities = capabilities
}
lspconfig.tsserver.setup {
    capabilities = capabilities,
    init_options = {
        preferences = {
            disableSuggestions = true
        }
    }
}
lspconfig.gopls.setup {
    capabilities = capabilities,
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
    capabilities = capabilities
}
lspconfig.bashls.setup {
    capabilities = capabilities
}
lspconfig.cssls.setup {
    capabilities = capabilities
}
lspconfig.jsonls.setup {
    capabilities = capabilities
}
lspconfig.dockerls.setup {
    capabilities = capabilities
}
lspconfig.docker_compose_language_service.setup {
    capabilities = capabilities
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
            vim.keymap.set("n", "df", vim.lsp.buf.definition, opt)
        end
    }
)
