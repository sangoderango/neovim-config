local plugin = { "luukvbaal/statuscol.nvim" }

plugin.config = function()
    local builtin = require("statuscol.builtin")

    vim.o.number = true
    vim.o.relativenumber = true

    require("statuscol").setup({
        relculright = true,
        ft_ignore = { "neo-tree" },
        segments = {
            {
                sign = {
                    namespace = { "diagnostic/signs" },
                    maxwidth = 1,
                    colwidth = 1,
                    auto = false,
                },
            },
            {
                text = { builtin.lnumfunc, " " },
            },
        },
    })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "TextChanged", "TextChangedI" }, {
        callback = function()
            local line_count = vim.api.nvim_buf_line_count(0)

            local digits = #tostring(line_count)

            vim.opt.numberwidth = digits + 1
        end,
    })
end

return plugin
