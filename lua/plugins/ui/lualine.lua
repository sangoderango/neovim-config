local plugin = { "nvim-lualine/lualine.nvim" }

plugin.dependencies = { "nvim-tree/nvim-web-devicons" }

local function add_right(extension)
    extension.sections = vim.tbl_extend("force", extension.sections, {
        lualine_x = { "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    })

    return extension
end

plugin.config = function()
    local lazy_extension = add_right(require("lualine.extensions.lazy"))

    local neo_tree_extension = {
        sections = {
            lualine_a = {
                function()
                    return "neo-tree  "
                end,
            },
            lualine_b = {
                function()
                    return vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
                end,
            },
            lualine_x = { "filetype" },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
        filetypes = { "neo-tree" },
    }

    local mason_extension = add_right(require("lualine.extensions.mason"))

    require("lualine").setup({
        options = {
            theme = "catppuccin",
            globalstatus = true,
            component_separators = "",
            refresh = {
                statusline = 20,
            },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "filename" },
            lualine_c = { "diagnostics" },
            lualine_x = { "filetype" },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
        },
        extensions = {
            lazy_extension,
            neo_tree_extension,
            mason_extension,
        },
    })
end

return plugin
