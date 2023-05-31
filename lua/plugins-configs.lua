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
            ignore = false
        }
    }
)
keymap("", "<c-b>", ":NvimTreeToggle<CR>", {})

-----------------------------------------------
--------------- TOKYONIGHT --------------------
-----------------------------------------------
vim.cmd[[colorscheme tokyonight-moon]]

-----------------------------------------------
----------------- LUALINE ---------------------
-----------------------------------------------
require('lualine').setup {
	options = {
		theme = 'tokyonight'
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
    }
}

local builtin = require('telescope.builtin')

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

keymap('n', '<c-f>', builtin.find_files, {})
keymap('n', '<c-g>', builtin.live_grep, {})
keymap('n', '<leader>f', builtin.buffers, {})
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
keymap("n", "<space>G", ":Telescope live_grep<cr>", opts)
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
    ensure_installed = { "lua_ls", "tsserver", "pyright" },
}


-----------------------------------------------
------------------- LSP -----------------------
-----------------------------------------------
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = {"vim"}
            }
        }
    },
		capabilities = capabilities,
}
lspconfig.pyright.setup {
    capabilities = capabilities,
	}
lspconfig.tsserver.setup {
    capabilities = capabilities,
	}

-- Rename variables
keymap("n", "<leader>rn", vim.lsp.buf.rename, {noremap = true})


-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
