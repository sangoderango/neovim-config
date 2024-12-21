local language = {}

language.lsp = "lua_ls"

local function does_luarc_exist(client)
    if not client.workspace_folders then
        return false
    end

    local path = client.workspace_folders[1].name

    if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
        return true
    end

    return false
end

language.lsp_config = function()
    local config = {}

    config.capabilities = _G.make_capabilities()

    config.on_init = function(client)
        if does_luarc_exist(client) then
            return
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

    return config
end

language.setup = function()
    local format_on_save = require("utility.format_on_save")

    format_on_save({ "*lua" }, { "stylua" })
end

return language
