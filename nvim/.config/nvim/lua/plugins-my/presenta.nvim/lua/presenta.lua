local M = {}

local parameters = require("presenta.parameters")

-- test {{{
function M.position()
	parameters.position()
end

function M.line()
	parameters.line()
end
-- }}}

-- Image / background {{{

function M.image()
	local A = "!"
end

-- background PB(opacity) {{{
function M.background(opacity)
	local A = '<!-- slide bg="[['
	local B = "/media/P/"
	local C = ']]" data-background-opacity="'
	local D = opacity
	local E = '" data-background-size="contain"  -->'
	parameters.five(A, B, C, D, E)
end
-- }}}

-- }}}

-- Comments Comment / Before / After {{{
function M.comment()
	local before = "[comment]: # ( "
	local after = " )"
	parameters.two(before, after)
end

function M.cbefore()
	local before = "[comment]: # ( "
	local after = " {{{ )"
	parameters.two(before, after)
end

function M.cafter()
	local text = "[comment]: # ( }}} )"
	parameters.one(text)
end
-- }}}

-- Dow PD {{{
function M.down()
	local before = '<div style="position: absolute; bottom: 0.1em;"><p style="background-color: black; font-size: 75%">'
	local after = "</p></div>"
	parameters.before_after_line(before, after)
	-- https://www.youtube.com/watch?v=AAx2pDCokj8
end
-- }}}

-- Font Small/Green {{{
function M.fsmall()
	local before = '<p style="font-size: 80%";>'
	local after = "</p>"
	parameters.two(before, after)
end

function M.fgreen()
	local before = '<span style="color:green">'
	local after = "</span>"
	parameters.two(before, after)
end
-- }}}

function M.setup(opts)
	opts = opts or {}
end

return M
