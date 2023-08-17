require("telescope").setup {
    defaults = {
        file_ignore_patterns = {
            "^node_modules/",
            "^dist/",
            "^venv/",
            "^.venv/",
            "^.git/",
            "!^.github/"
        }
    },
    pickers = {
        find_files = {
            -- find_command = {
            --     "fd",
            --     "--type",
            --     "file",
            --     "-I",
            --     "--type",
            --     "symlink",
            --     "--hidden",
            --     "--exclude",
            --     ".git/*"
            --     -- put your other patterns here
            -- },
            hidden = true
        }
    }
}
