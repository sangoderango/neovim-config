local language = {}

language.plugin = function()
    local plugin = { "lopi-py/luau-lsp.nvim" }

    plugin.dependencies = { "nvim-lua/plenary.nvim" }

    return plugin
end

language.setup = function()
    vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = { "*luau" },
        callback = function()
            local view = vim.fn.winsaveview()

            vim.fn.system({ "stylua", vim.api.nvim_buf_get_name(0) })

            vim.api.nvim_command("edit!")

            vim.fn.winrestview(view)
        end,
    })
end

return language
