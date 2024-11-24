local language = {}

language.lsp = "lua_ls"

language.lsp_config = function(capabilities)
    local config = {}

    config.capabilities = capabilities

    config.on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name

            if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
                return
            end
        end

        client.config.settings.Lua = {
            runtime = {
                version = "LuaJIT",
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    "${3rd}/luv/library",
                },
            },
        }
    end

    config.settings = {}

    return config
end

language.setup = function()
    vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = { "*lua" },
        callback = function()
            local view = vim.fn.winsaveview()

            vim.fn.system({ "stylua", vim.api.nvim_buf_get_name(0) })

            vim.api.nvim_command("edit!")

            vim.fn.winrestview(view)
        end,
    })
end

return language
