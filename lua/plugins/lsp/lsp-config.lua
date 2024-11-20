local plugin = { "neovim/nvim-lspconfig" }

plugin.event = { "BufReadPre", "BufNewFile" }

plugin.config = function()
	local lspconfig = require("lspconfig")

	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	for _, language in ipairs(_G.languages) do
		lspconfig[language.lsp].setup(language.lsp_config(capabilities))
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
