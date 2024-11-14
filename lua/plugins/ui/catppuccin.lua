local catppuccin = { "catppuccin/nvim" }

catppuccin.priority = 1000

catppuccin.config = function()
	require("catppuccin").setup({
		flavour = "mocha",
	})

	vim.cmd.colorscheme("catppuccin")
end

return catppuccin
