local plugin = { "catppuccin/nvim" }

plugin.priority = 1000

plugin.config = function()
    require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        custom_highlights = function(colors)
            local background = colors.mantle
            local relative_line = colors.surface2
            local absolute_line = colors.peach

            return {
                LazyNormal = { bg = background },
                MasonNormal = { bg = background },
                NormalFloat = { bg = background },
                PMenu = { bg = background },
                LineNrAbove = { fg = relative_line },
                LineNr = { fg = absolute_line },
                LineNrBelow = { fg = relative_line },
            }
        end,
        integrations = {
            mason = true,
            neotree = true,
            cmp = true,
        },
    })

    vim.cmd.colorscheme("catppuccin")
end

return plugin
