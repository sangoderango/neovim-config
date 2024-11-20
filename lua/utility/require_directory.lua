local function require_directory(directory)
	local directory_path = "lua/" .. directory:gsub("%.", "/")

	if vim.fn.isdirectory(directory_path) ~= 1 then
		error("The path \"" .. directory_path .. "\" is not a directory!")
	end

	local module_paths = vim.fn.glob(directory_path .. "/*.lua", true, true)

	local modules = {}

	for _, path in ipairs(module_paths) do
		table.insert(modules, require(path:gsub("%.lua$", "")))
	end

	return modules
end

return require_directory
