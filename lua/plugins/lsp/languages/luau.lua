local language = {}

language.plugin = function()
    local plugin = { "lopi-py/luau-lsp.nvim" }

    plugin.dependencies = { "nvim-lua/plenary.nvim" }

    return plugin
end

language.setup = function()
    local format_on_save = require("utility.format_on_save")

    format_on_save({ "*luau" }, { "stylua" })
end

return language
