local M = {}

-- local parameters {{{
-- https://neovim.discourse.group/t/function-that-return-visually-selected-text/1601
local param = function()
	local P = {}
	local dir = vim.fn.expand("%:p:h")
	local _, _, slide = string.find(dir, ".*(%d%d%d)$")
	P.slide = slide
	P.buffer = vim.api.nvim_get_current_buf()
	-- start and end of visual area
	P.row = vim.fn.line(".") -- cursor position or end of visual block
	P.vrow = vim.fn.line("v") -- beginning of visual block
	if P.row == P.vrow then
		P.text = vim.api.nvim_get_current_line()
		--[[ Not used by now
	  elseif P.row ~= P.vrow then
		    P.text = vim.api.nvim_buf_get_lines(P.buffer, P.vrow - 1, P.row, false)
		    P.text = table.concat(lines, " ")
    --]]
	end
	return P
end
-- }}}

function M.position()
	local P = param()
	local message = "vrow: " .. P.vrow .. ", row: " .. P.row .. ", P.slide: " .. P.slide
	print(message)
end

function M.line()
	local P = param()
	print("line: " .. P.text)
end

return M
