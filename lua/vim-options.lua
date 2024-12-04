local function set_indentation(width, use_tabs)
    assert(width >= 0, "Width must be a positive number!")

    vim.opt.expandtab = not use_tabs
    vim.opt.tabstop = width
    vim.opt.softtabstop = width
    vim.opt.shiftwidth = width
end

local function set_visual_markers(markers)
    vim.opt.list = true

    vim.opt.listchars = markers
end

local function disable_autocommenting_newlines()
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "*",
        callback = function()
            vim.opt_local.formatoptions:remove({ "r", "o" })
        end,
    })
end

local function disable_netrw()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
end

local function Setup()
    vim.opt.wrap = false

    set_indentation(4, false)

    set_visual_markers({ trail = "·" })

    disable_autocommenting_newlines()

    disable_netrw()
end

Setup()
