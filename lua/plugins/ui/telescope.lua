local plugin = { "nvim-telescope/telescope.nvim" }

plugin.dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
}

plugin.config = function()
    local actions = require("telescope.actions")

    require("telescope").setup({
        defaults = {
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--trim",
            },
            scroll_strategy = "limit",
            sorting_strategy = "ascending",
            mappings = {
                i = {
                    ["<Esc>"] = actions.close,
                    ["<C-k>"] = actions.move_selection_previous,
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
                },
            },
            preview = {
                hide_on_startup = true,
            },
            layout_config = {
                width = 0.8,
                height = 0.9,
                prompt_position = "top",
            },
            prompt_prefix = "   ",
            selection_caret = "  ",
            entry_prefix = "  ",
        },
    })

    local builtin = require("telescope.builtin")
    local settings = { silent = true, noremap = true }

    vim.keymap.set("n", "ff", builtin.find_files, settings)
    vim.keymap.set("n", "fg", builtin.live_grep, settings)
    vim.keymap.set("n", "fh", builtin.highlights, settings)
end

return plugin
