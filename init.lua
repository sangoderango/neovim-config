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

local function load_languages()
    local require_directory = require("utility.require_directory")

    _G.languages = require_directory("plugins.lsp.languages")

    local plugins = {}

    for _, language in ipairs(_G.languages) do
        if language.plugin then
            table.insert(plugins, language.plugin())
        end
    end

    return plugins
end

local function setup_lazy()
    require("lazy").setup({
        spec = {
            { import = "plugins.lsp" },
            { import = "plugins.ui" },
            unpack(load_languages()),
        },
        install = {
            colorscheme = { "catppuccin" },
        },
        change_detection = {
            notify = false,
        },
    })
end

local function set_indentation(width, use_tabs)
    assert(width > 0, "Width must be a positive number!")

    vim.opt.expandtab = not use_tabs
    vim.opt.tabstop = width
    vim.opt.softtabstop = width
    vim.opt.shiftwidth = width
end

local function set_visual_markers(rules)
    vim.opt.list = true

    vim.opt.listchars = rules
end

local function disable_autocommenting_newlines()
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "*",
        callback = function()
            vim.opt_local.formatoptions:remove({ "r", "o" })
        end,
    })
end

local function set_vim_options()
    set_indentation(4, false)

    set_visual_markers({ trail = "·" })

    disable_autocommenting_newlines()

    vim.opt.wrap = false
end

local function start()
    install_lazy()

    setup_lazy()

    set_vim_options()
end

start()
