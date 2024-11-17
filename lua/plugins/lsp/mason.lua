local plugin = { "williamboman/mason.nvim" }

plugin.config = function()
	require("mason").setup({})
end

return plugin
