local plugin = { "catppuccin/nvim" }

plugin.priority = 1000

plugin.config = function()
    require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        custom_highlights = function(colors)
            return {
                LazyNormal = { bg = colors.mantle, fg = colors.text },
                MasonNormal = { bg = colors.mantle, fg = colors.text },
                NormalFloat = { bg = colors.mantle, fg = colors.text },
                LineNrAbove = { fg = colors.surface2, bold = true },
                LineNr = { fg = colors.peach, bold = true },
                LineNrBelow = { fg = colors.surface2, bold = true },
                PMenu = { bg = colors.mantle, fg = colors.text },
            }
        end,
    })

    vim.cmd.colorscheme("catppuccin")
end

return plugin
