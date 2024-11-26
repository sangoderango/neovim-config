local plugin = { "nvim-treesitter/nvim-treesitter" }

plugin.config = function()
    require("nvim-treesitter.configs").setup({
        auto_install = true,
        highlight = {
            enable = true,
        },
    })

    local parsers = require("nvim-treesitter.parsers")

    vim.api.nvim_create_user_command("TSInstalled", function()
        for _, parser in ipairs(parsers.available_parsers()) do
            if parsers.has_parser(parser) then
                vim.api.nvim_out_write(parser .. "\n")
            end
        end
    end, {})
end

return plugin
