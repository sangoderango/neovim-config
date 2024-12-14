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
    local format_on_save = require("utility.format_on_save")

    format_on_save({ "*json" }, {
        "prettier",
        "--write",
        "--tab-width=4",
        vim.api.nvim_buf_get_name(0),
    })
end

return language
