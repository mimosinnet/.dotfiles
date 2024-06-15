--[[
  Get positional parameters from buffer and insert text before/after TEXT
  one: insert text
  two: insert textBefore / TEXT / textAfter
  five: insert textA / SLIDE / textB / TEXT / textC / textD / textE
  before_after_line: insert text before and after line
--]]

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

-- Insert Text {{{
function M.one(text)
	local P = param()
	vim.api.nvim_buf_set_lines(P.buffer, P.vrow, P.row, false, { text })
end

function M.two(before, after)
	local P = param()
	local text = before .. P.text .. after
	vim.api.nvim_buf_set_lines(P.buffer, P.vrow, P.row, false, { text })
end

function M.five(A, B, C, D, E)
	local P = param()
	local text = A .. P.slide .. B .. P.text .. C .. D .. E
	vim.api.nvim_buf_set_lines(P.buffer, P.vrow, P.row, false, { text })
end

-- https://www.youtube.com/watch?v=AAx2pDCokj8
function M.before_after_line(before, after)
	local P = param()
	vim.api.nvim_buf_set_lines(P.buffer, P.vrow - 1, P.vrow - 1, false, { before })
	vim.api.nvim_buf_set_lines(P.buffer, P.row + 1, P.row + 1, false, { after })
end
-- }}}

-- test {{{
function M.position()
	local P = param()
	local message = "vrow: " .. P.vrow .. ", row: " .. P.row .. ", P.slide: " .. P.slide
	print(message)
end

function M.line()
	local P = param()
	print("line: " .. P.text)
end
-- }}}

return M
