require("bufferline").setup {
    highlights = require("catppuccin.groups.integrations.bufferline").get(),
    options = {
        numbers = "buffer_id",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return "(" .. count .. ")"
        end
    }
}
