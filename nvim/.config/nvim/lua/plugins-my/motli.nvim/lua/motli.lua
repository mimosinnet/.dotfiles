local M = {}

local accio = require("motli.accions")

-- a motli.actions:
-- Demanem si borrem o guardem

-- :g/^.{posicio}[lletra].*\n/d
-- :v/^.{posicio}[lletra].*\n/d
function M.g_pos(command)
	accio.g_pos(command)
end

-- :g/^.*[lletra].*\n/d
-- :v/^.*[lletra].*\n/d
function M.g_lletra(command)
	accio.g_lletra(command)
end

-- :g/^.*[lletra].*[lletra].*\n/d
-- :v/^.*[lletra].*[lletra].*\n/d
function M.g_dos(command)
	accio.g_dos(command)
end

-- :g/^.*[lletra].*[lletra].*[lletra].*\n/d
-- :v/^.*[lletra].*[lletra].*[lletra].*\n/d
function M.g_tres(command)
	accio.g_tres(command)
end

return M
