local plugin = { "neovim/nvim-lspconfig" }

plugin.event = { "BufReadPre", "BufNewFile" }

plugin.config = function()
	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	require("lspconfig").lua_ls.setup({
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
	})

	vim.api.nvim_create_autocmd("BufWritePost", {
		pattern = { "*lua" },
		callback = function()
			local view = vim.fn.winsaveview()

			vim.fn.system("stylua " .. vim.fn.shellescape(vim.api.nvim_buf_get_name(0)))

			vim.cmd("edit")

			vim.fn.winrestview(view)
		end,
	})

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
