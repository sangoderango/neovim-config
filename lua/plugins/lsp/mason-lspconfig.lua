local plugin = { "williamboman/mason-lspconfig.nvim" }

plugin.config = function()
    local lsps = {}

    for _, language in ipairs(_G.languages) do
        table.insert(lsps, language.lsp)
    end

    require("mason-lspconfig").setup({
        ensure_installed = lsps,
        automatic_installation = true,
    })
end

return plugin
