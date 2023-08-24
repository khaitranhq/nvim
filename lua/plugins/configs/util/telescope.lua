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
            hidden = true,
            no_ignore = true
        }
    }
}
