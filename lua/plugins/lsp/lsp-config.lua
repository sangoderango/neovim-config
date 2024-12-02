local plugin = { "neovim/nvim-lspconfig" }

plugin.event = { "BufReadPre", "BufNewFile" }

plugin.dependencies = { "hrsh7th/cmp-nvim-lsp" }

plugin.config = function()
    local lspconfig = require("lspconfig")

    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    for _, language in ipairs(_G.languages) do
        if language.lsp_config then
            assert(language.lsp, "Cannot configure lsp without an lsp set!")

            lspconfig[language.lsp].setup(language.lsp_config(capabilities))
        end

        if language.setup then
            language.setup()
        end
    end

    vim.diagnostic.config({
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = "󰅚 ",
                [vim.diagnostic.severity.WARN] = "󰀪 ",
                [vim.diagnostic.severity.HINT] = "󰌶 ",
                [vim.diagnostic.severity.INFO] = " ",
            },
        },
    })

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {})
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {})

    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
end

return plugin
