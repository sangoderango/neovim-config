local language = {}

language.plugin = function()
    local plugin = { "lopi-py/luau-lsp.nvim" }

    plugin.dependencies = { "nvim-lua/plenary.nvim" }

    plugin.config = function()
        local capabilities = _G.make_capabilities()
        capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

        require("luau-lsp").setup({
            plugin = {
                enabled = false,
            },
            server = {
                capabilities = capabilities,
            },
        })
    end

    return plugin
end

language.setup = function()
    local format_on_save = require("utility.format_on_save")

    format_on_save({ "*luau" }, { "stylua" })
end

return language
