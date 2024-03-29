-- luasnip setup
local luasnip = require "luasnip"

require("luasnip.loaders.from_vscode").lazy_load()

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
        {name = "nvim_lua"},
        {name = "luasnip"},
        {
            name = "buffer",
            option = {
                get_bufnrs = function()
                    return vim.api.nvim_list_bufs()
                end
            }
        },
        {name = "path"}
    }
}

require("luasnip.loaders.from_vscode").lazy_load()
