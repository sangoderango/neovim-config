local catppuccin = { "catppuccin/nvim" }

catppuccin.priority = 1000

catppuccin.config = function()
	require("catppuccin").setup({
		flavour = "mocha",
		transparent_background = true,
		custom_highlights = function(colors)
			return {
				LazyNormal = { bg = colors.mantle, fg = colors.text },
			}
		end,
	})

	vim.cmd.colorscheme("catppuccin")
end

return catppuccin
