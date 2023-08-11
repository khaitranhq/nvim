require("telescope").setup {
    defaults = {
        file_ignore_patterns = {".git", "node_modules", "dist", "venv", ".venv"}
    },
    pickers = {
        find_files = {
            find_command = {
                "fd",
                "--type",
                "file",
                "-I",
                "--type",
                "symlink",
                "--hidden",
                "--exclude",
                ".git"
                -- put your other patterns here
            },
            hidden = true
        }
    }
}
