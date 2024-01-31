local show_current_buffer_directory = function()
    print("Current directory: " .. vim.api.nvim_buf_get_name(0))
end

vim.api.nvim_create_user_command("BufDir", show_current_buffer_directory, {})

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
