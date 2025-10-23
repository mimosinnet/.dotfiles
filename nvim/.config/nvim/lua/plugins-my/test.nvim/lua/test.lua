local M = {}

function M.test()
	local variable = vim.ui.input({ prompt = "Enter value: " }, function(str)
		return str
	end)
	print(variable)
end

return M
