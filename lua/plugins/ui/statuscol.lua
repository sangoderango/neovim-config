local statuscol = { "luukvbaal/statuscol.nvim" }

statuscol.config = function()
	local builtin = require("statuscol.builtin")

	vim.o.number = true
	vim.o.relativenumber = true

	require("statuscol").setup({
		relculright = true,
		ft_ignore = { "neo-tree" },
		segments = {
			{
				sign = {
					namespace = { "diagnostic/signs" },
					maxwidth = 1,
					colwidth = 2,
					auto = false,
				},
			},
			{ text = { builtin.lnumfunc, " " } },
		},
	})
end

return statuscol
