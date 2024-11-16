local mason_lspconfig = { "williamboman/mason-lspconfig.nvim" }

mason_lspconfig.config = function()
	require("mason-lspconfig").setup({
		ensure_installed = {
			"lua_ls",
		},
		automatic_installation = true,
	})
end

return mason_lspconfig
