local plugin = { "nvim-lualine/lualine.nvim" }

plugin.dependencies = { "nvim-tree/nvim-web-devicons" }

local function add_default_right(extension)
    extension.sections = vim.tbl_extend("force", extension.sections, {
        lualine_x = { "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    })

    return extension
end

local function lazy_extension()
    return add_default_right(require("lualine.extensions.lazy"))
end

local function mason_extension()
    return add_default_right(require("lualine.extensions.mason"))
end

local function neo_tree_extension()
    return add_default_right({
        sections = {
            lualine_a = {
                function()
                    return "NeoTree  "
                end,
            },
            lualine_b = {
                function()
                    return vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
                end,
            },
        },
        filetypes = { "neo-tree" },
    })
end

local function telescope_extension()
    local state = require("telescope.actions.state")

    return add_default_right({
        sections = {
            lualine_a = {
                function()
                    return "Telescope"
                end,
            },
            lualine_b = {
                function()
                    local picker = state.get_current_picker(vim.api.nvim_get_current_buf())

                    return "Results: " .. tostring(picker.manager.linked_states.size)
                end,
            },
        },
        filetypes = { "TelescopePrompt" },
    })
end

plugin.config = function()
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
        extensions = {
            lazy_extension(),
            mason_extension(),
            neo_tree_extension(),
            telescope_extension(),
        },
    })
end

return plugin
