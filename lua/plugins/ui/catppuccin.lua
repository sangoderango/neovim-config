local plugin = { "catppuccin/nvim" }

plugin.priority = 1000

plugin.config = function()
    require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        custom_highlights = function(colors)
            local text = colors.text
            local background = colors.mantle
            local light_background = colors.surface0
            local relative_line = colors.surface2
            local absolute_line = colors.peach

            return {
                LazyNormal = { bg = background },
                MasonNormal = { bg = background },
                NormalFloat = { bg = background },
                Pmenu = { bg = background },
                CmpItemMenu = { bg = background },
                LineNrAbove = { fg = relative_line },
                LineNr = { fg = absolute_line },
                LineNrBelow = { fg = relative_line },
                TelescopeNormal = { bg = background },
                TelescopeBorder = { fg = background, bg = background },
                TelescopeSelection = { fg = text, bg = light_background },
                TelescopePromptNormal = { bg = light_background },
                TelescopePromptBorder = { fg = light_background, bg = light_background },
                TelescopePromptTitle = { fg = colors.base, bg = colors.red },
                TelescopePreviewTitle = { fg = colors.base, bg = colors.green },
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
