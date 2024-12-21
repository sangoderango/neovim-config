local function require_directory(relative_path)
    local directory_path = vim.fn.stdpath("config") .. "/lua/" .. relative_path:gsub("%.", "/")

    assert(vim.fn.isdirectory(directory_path) == 1)

    local module_paths = vim.fn.glob(directory_path .. "/*.lua", true, true)

    local modules = {}

    for index, path in next, module_paths do
        local module_name = vim.fn.fnamemodify(path, ":t:r")

        modules[index] = require(relative_path .. "." .. module_name)
    end

    return modules
end

return require_directory
