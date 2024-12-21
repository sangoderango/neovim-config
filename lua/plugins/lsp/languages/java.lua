local language = {}

language.lsp = "jdtls"

language.lsp_config = function()
    local config = {}

    config.capabilities = _G.make_capabilities()

    return config
end

return language
