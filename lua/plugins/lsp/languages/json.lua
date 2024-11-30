local language = {}

language.lsp = "jsonls"

language.lsp_config = function(capabilities)
    local config = {}

    config.capabilities = capabilities

    config.settings = {
        json = {
            validate = { enable = true },
        },
    }

    return config
end

language.setup = function()
    vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = { "*json" },
        callback = function()
            local view = vim.fn.winsaveview()

            vim.fn.system({
                "prettier",
                "--write",
                "--tab-width=4",
                vim.api.nvim_buf_get_name(0),
            })

            vim.api.nvim_command("edit!")

            vim.fn.winrestview(view)
        end,
    })
end

return language
