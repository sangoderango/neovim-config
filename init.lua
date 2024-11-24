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

local function load_plugins()
    local require_directory = require("utility.require_directory")

    _G.languages = require_directory("plugins.lsp.languages")

    require("lazy").setup({
        spec = {
            { import = "plugins.lsp" },
            { import = "plugins.ui" },
        },
        install = {
            colorscheme = { "catppuccin" },
        },
        change_detection = {
            notify = false,
        },
    })
end

local function set_vim_options()
    vim.opt.expandtab = true
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4

    vim.opt.wrap = false

    vim.opt.list = true
    vim.opt.listchars = {
        trail = "·",
        tab = "  ",
    }
end

local function start()
    install_lazy()

    load_plugins()

    set_vim_options()
end

start()
