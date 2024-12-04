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

    local plugins = {
        { import = "plugins.lsp" },
        { import = "plugins.ui" },
    }

    for _, language in ipairs(_G.languages) do
        if language.plugin then
            table.insert(plugins, language.plugin())
        end
    end

    require("lazy").setup({
        spec = plugins,
        install = {
            colorscheme = { "catppuccin" },
        },
        change_detection = {
            notify = false,
        },
    })
end

local function start()
    install_lazy()

    load_plugins()

    require("vim-options")
end

start()
