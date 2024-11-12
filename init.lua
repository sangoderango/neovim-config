local function install_lazy()
	local path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

	if not vim.uv.fs_stat(path) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable",
			path,
		})
	end

	vim.opt.rtp:prepend(path)
end

local function set_vim_options()
	vim.opt.expandtab = true
	vim.opt.tabstop = 4
	vim.opt.softtabstop = 4
	vim.opt.shiftwidth = 4
end

local function start()
	install_lazy()

	require("lazy").setup({
		spec = {
			{ import = "plugins.ui" },
			{ import = "plugins.lsp" },
		},
	})

	set_vim_options()
end

start()
