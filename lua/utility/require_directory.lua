local function require_directory(relative_path)
    local directory_path = vim.fn.stdpath("config") .. "/lua/" .. relative_path:gsub("%.", "/")

    if vim.fn.isdirectory(directory_path) == 0 then
        error("The path \"" .. directory_path .. "\" is not a directory!")
    end

    local module_paths = vim.fn.glob(directory_path .. "/*.lua", true, true)

    local modules = {}

    for index, path in ipairs(module_paths) do
        local module_name = vim.fn.fnamemodify(path, ":t:r")

        modules[index] = require(relative_path .. "." .. module_name)
    end

    return modules
end

return require_directory
