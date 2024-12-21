local function extend(array, value)
    array[#array + 1] = value

    return array
end

local function format_on_save(file_patterns, command)
    vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = file_patterns,
        callback = function()
            local view = vim.fn.winsaveview()

            vim.fn.system(extend(command, vim.api.nvim_buf_get_name(0)))

            vim.api.nvim_command("edit!")

            vim.fn.winrestview(view)
        end,
    })
end

return format_on_save
