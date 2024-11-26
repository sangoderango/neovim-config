local language = {}

language.lsp = "jdtls"

language.lsp_config = function(capabilities)
    local config = {}

    config.capabilities = capabilities

    return config
end

return language
