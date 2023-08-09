require("formatter").setup {
    -- Enable or disable logging
    logging = true,
    -- Set the log level
    log_level = vim.log.levels.WARN,
    -- All formatter configurations are opt-in
    filetype = {
        -- Formatter configurations for filetype "lua" go here
        -- and will be executed in order
        lua = {
            -- "formatter.filetypes.lua" defines default configurations for the
            -- "lua" filetype
            require("formatter.filetypes.lua").luafmt
        },
        go = {
            require("formatter.filetypes.go").golines
        },
        html = {
            require("formatter.filetypes.html").prettier
        },
        javascript = {
            require("formatter.filetypes.javascript").prettier
        },
        json = {
            require("formatter.filetypes.json").prettier
        },
        python = {
            require("formatter.filetypes.python").yapf
        },
        sh = {
            require("formatter.filetypes.sh").shfmt
        },
        typescript = {
            require("formatter.filetypes.typescript").prettier
        },
        markdown = {
            require("formatter.filetypes.markdown").prettier
        },
        cpp = {
            require("formatter.filetypes.cpp").clangformat
        }
    }
}
vim.cmd [[autocmd BufWritePost * FormatWrite]]
