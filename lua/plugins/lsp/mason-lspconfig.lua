local plugin = { "williamboman/mason-lspconfig.nvim" }

plugin.config = function()
    local lsps = {}

    for index, language in ipairs(_G.languages) do
        if language.lsp then
            lsps[index] = languages.lsp
        end
    end

    require("mason-lspconfig").setup({
        ensure_installed = lsps,
        automatic_installation = true,
    })
end

return plugin
