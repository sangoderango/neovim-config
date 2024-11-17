local plugin = { "williamboman/mason-lspconfig.nvim" }

plugin.config = function()
	require("mason-lspconfig").setup({
		ensure_installed = {
			"lua_ls",
		},
		automatic_installation = true,
	})
end

return plugin
