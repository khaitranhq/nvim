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
        ["<C-b>"] = {"<cmd>NvimTreeToggle<CR>", "Toggle nvim tree"},
				["<leader>b"] = {change_nvim_tree_view_type, "Toggle nvim tree"}
    }
}

local telescope_builtin = require("telescope.builtin")
M.telescope = {
    plugin = true,
    n = {
        ["<C-f>"] = {telescope_builtin.find_files, "Find files"},
        ["<C-g>"] = {telescope_builtin.live_grep, "Search text globally"},
        ["<leader>fb"] = {telescope_builtin.buffers, "Search buffers"},
        ["<leader>fg"] = {telescope_builtin.current_buffer_fuzzy_find, "Search text in current buffer"}
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

local goto_preview = require("goto-preview")
M.goto_preview = {
    plugin = true,
    n = {
        ["<leader>dpf"] = {goto_preview.goto_preview_definition, "Show preview definition in float window"},
        ["<leader>dpt"] = {goto_preview.goto_preview_type_definition, "Show preview type definition in float window"},
        ["<leader>dpi"] = {
            goto_preview.goto_preview_implementation,
            "Show preview implementation definition in float window"
        },
        ["<leader>dpr"] = {
            goto_preview.goto_preview_references,
            "Show preview references definition in float window"
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
        ["<leader>gc"] = {_aicommits_toggle, "Git commit"}
    }
}

M.term = {
    plugin = true,
    n = {
        ["<leader>lg"] = {_lazygit_toggle, "Open lazygit"}
    }
}

return M
