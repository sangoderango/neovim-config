local lsp_config = { "neovim/nvim-lspconfig" }

lsp_config.config = function()
	vim.api.nvim_create_autocmd("BufWritePost", {
		pattern = { "*lua" },
		callback = function()
			local view = vim.fn.winsaveview()

			vim.fn.system("stylua " .. vim.fn.shellescape(vim.api.nvim_buf_get_name(0)))

			vim.cmd("edit")

			vim.fn.winrestview(view)
		end,
	})
end

return lsp_config
