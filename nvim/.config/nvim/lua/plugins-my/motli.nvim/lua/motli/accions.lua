local M = {}

local strings = { a = "aàä", e = "eéèë", i = "iíï", o = "oóòö", u = "uúü" }

-- get_char(prompt) {{{
local get_char = function(prompt)
	local char = "error"
	while string.len(char) ~= 1 do
		vim.ui.input({ prompt = prompt }, function(str)
			char = str
			if char == nil then
				char = "error"
			end
		end)
	end
	return char
end
-- }}}

local get_lletra = function()
	local lletra = get_char("Lletra: ")
	if string.match("aeiou", lletra) then
		lletra = strings[lletra]
	end
	return lletra
end

-- command = [ global | vglobal ]
function M.g_pos(command)
	local posicio = get_char("Posició: ") - 1
	local lletra = get_lletra()
	local pattern = "/^.\\{" .. posicio .. "}[" .. lletra .. "].*\\n/d"
	vim.api.nvim_cmd({ cmd = command, args = { pattern } }, { output = false })
end

function M.g_lletra(command)
	local lletra = get_lletra()
	local chars = ".*[" .. lletra .. "]"
	local pattern = "/^" .. chars .. ".*\\n/d"
	vim.api.nvim_cmd({ cmd = command, args = { pattern } }, { output = false })
end

function M.g_dos(command)
	local lletra = get_lletra()
	local chars = ".*[" .. lletra .. "]"
	local pattern = "/^" .. chars .. chars .. ".*\\n/d"
	vim.api.nvim_cmd({ cmd = command, args = { pattern } }, { output = false })
end

function M.g_tres(command)
	local lletra = get_lletra()
	local chars = ".*[" .. lletra .. "]"
	local pattern = "/^" .. chars .. chars .. chars .. ".*\\n/d"
	print(pattern)
	vim.api.nvim_cmd({ cmd = command, args = { pattern } }, { output = false })
end

return M
