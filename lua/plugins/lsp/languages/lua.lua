local language = {}

language.lsp = "lua_ls"

language.lsp_config = function(capabilities)
	vim.api.nvim_create_autocmd("BufWritePost", {
		pattern = { "*lua" },
		callback = function()
			local view = vim.fn.winsaveview()

			vim.fn.system("stylua " .. vim.fn.shellescape(vim.api.nvim_buf_get_name(0)))

			vim.cmd("edit")

			vim.fn.winrestview(view)
		end,
	})

	return {
		capabilities = capabilities,
		on_init = function(client)
			if client.workspace_folders then
				local path = client.workspace_folders[1].name
				if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
					return
				end
			end

			client.config.settings.Lua = {
				runtime = {
					version = "LuaJIT",
				},
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME,
						"${3rd}/luv/library",
					},
				},
			}
		end,
		settings = {},
	}
end

return language
