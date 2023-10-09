local show_current_buffer_directory = function()
    print("Current directory: " .. vim.api.nvim_buf_get_name(0))
end

vim.api.nvim_create_user_command("BufDir", show_current_buffer_directory, {})
