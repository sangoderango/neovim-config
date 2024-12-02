local plugin = { "williamboman/mason-lspconfig.nvim" }

plugin.config = function()
    local lsps = {}

    for _, language in ipairs(_G.languages) do
        if language.lsp then
            table.insert(lsps, language.lsp)
        end
    end

    require("mason-lspconfig").setup({
        ensure_installed = lsps,
        automatic_installation = true,
    })
end

return plugin
