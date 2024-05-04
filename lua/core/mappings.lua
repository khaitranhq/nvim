-- n, v, i, t = mode names

local M = {}

M.general = {
    n = {
        -- switch between windows
        ["<C-h>"] = {"<C-w>h", "Window left"},
        ["<C-l>"] = {"<C-w>l", "Window right"},
        ["<C-j>"] = {"<C-w>j", "Window down"},
        ["<C-k>"] = {"<C-w>k", "Window up"},
        -- quit
        ["qq"] = {"<cmd>qa<CR>", "Quit Neovim"},
        -- short key to run commands
        [";"] = {":", "Short key to run commands"},
        ["<leader>pwd"] = {vim.cmd.BufDir, "Show directory of current buffer"}
    },
    v = {
        ["//"] = {'y/\\V<C-R>=escape(@",\'/\')<CR><CR>', "Search with selected text"}
    }
}

M.nvimtree = {
    plugin = true,
    n = {
        ["<leader>b"] = {"<cmd>NvimTreeToggle<CR>", "Toggle nvim tree"},
        ["<leader>cbv"] = {change_nvim_tree_view_type, "Toggle nvim tree"}
    }
}

local telescope_builtin = require("telescope.builtin")
M.telescope = {
    plugin = true,
    n = {
        ["<leader>ff"] = {telescope_builtin.find_files, "Find files"},
        ["<leader>fg"] = {telescope_builtin.live_grep, "Search text globally"},
        ["<leader>fb"] = {telescope_builtin.buffers, "Search buffers"},
        ["<leader>fc"] = {telescope_builtin.current_buffer_fuzzy_find, "Search text in current buffer"}
    },
    v = {
        ["<leader>fs"] = {search_with_selected_text, "Search with selected text"}
    }
}

M.lsp = {
    plugin = true,
    n = {
        ["<leader>rn"] = {vim.lsp.buf.rename, "Rename variable at cursor"},
        ["[d"] = {vim.diagnostic.goto_prev, "Previous diagnostic position"},
        ["]d"] = {vim.diagnostic.goto_next, "Next diagnostic position"},
        ["<leader>e"] = {vim.diagnostic.open_float, "Show diagnostic message in a float window"},
        ["<leader>de"] = {vim.lsp.buf.hover, "Show definition"}
    }
}

local hop = require("hop")
M.hop = {
    plugin = true,
    n = {
        ["<leader>hp"] = {hop.hint_patterns, "Move cursor from searching pattern result"},
        ["<leader>hw"] = {hop.hint_words, "Move cursor to specific words"}
    }
}

local spectre = require("spectre")
M.spectre = {
    plugin = true,
    n = {
        ["<leader>S"] = {spectre.toggle, "Toggle Spectre"},
        ["<leader>sw"] = {
            function()
                spectre.open_visual({select_word = true})
            end,
            "Search with word in cursor position"
        },
        ["<leader>sc"] = {
            function()
                spectre.open_file_search({select_word = true})
            end,
            "Search on current file"
        }
    },
    v = {
        ["<leader>sw"] = {
            spectre.open_visual,
            "Search with current selected word"
        }
    }
}

-- local dap = require("dap")
-- M.dap = {
--     plugin = true,
--     n = {
--         ["<leader>dn"] = {dap.step_over, "Debug: next step"},
--         ["<leader>db"] = {dap.step_back, "Debug: previous step"},
--         ["<leader>dk"] = {dap.toggle_breakpoint, "Debug: toggle a breakpoint"},
--         ["<leader>dt"] = {dap.terminate, "Debug: Terminate"},
--         ["<leader>dr"] = {dap.restart, "Debug: restart"},
--         ["<leader>ds"] = {dap.continue, "Debug: continue"}
--     }
-- }

local notify = require("notify")
M.notify = {
    plugin = true,
    n = {
        ["<leader>nh"] = {notify.dismiss, "Dismiss all notifications"}
    }
}

M.git = {
    plugin = true,
    n = {
        ["<leader>gs"] = {"<cmd>Git<CR>", "Open Git"},
        ["<leader>gb"] = {"<cmd>Git blame<CR>", "Git blame"},
        ["<leader>gd"] = {"<cmd>Gdiffsplit<CR>", "Git diff split"},
        ["<leader>gcm"] = {_aicommits_toggle, "Git commit"},
        ["<leader>gcc"] = {"<cmd>GitConflictChooseOurs<CR>", "Git conflict: select current change"},
        ["<leader>gci"] = {"<cmd>GitConflictChooseTheirs<CR>", "Git conflict: select incomming change"},
        ["<leader>gcb"] = {"<cmd>GitConflictChooseBoth<CR>", "Git conflict: select both changes"},
        ["<leader>gcx"] = {"<cmd>GitConflictChooseNone<CR>", "Git conflict: select none of the changes"},
        ["<leader>gcn"] = {"<cmd>GitConflictNextConflict<CR>", "Git conflict: select next conflict"},
        ["<leader>gcp"] = {"<cmd>GitConflictPrevConflict<CR>", "Git conflict: select previous conflict"}
    }
}

M.term = {
    plugin = true,
    n = {
        ["<leader>tg"] = {_lazygit_toggle, "Open lazygit"}
    }
}

M.format = {
    plugin = true,
    n = {
        ["<leader>fm"] = {format, "Format file"}
    }
}

M.lspsaga = {
    plugin = true,
    n = {
        ["<leader>lci"] = {"<cmd>Lspsaga incoming_calls<CR>", "Incoming call"},
        ["<leader>lco"] = {"<cmd>Lspsaga outgoing_calls<CR>", "Outgoing call"},
        ["<leader>lca"] = {"<cmd>Lspsaga code_action<CR>", "Call action"},
        ["<leader>lgd"] = {"<cmd>Lspsaga peek_definition<CR>", "Peek definition"}
    }
}

return M
