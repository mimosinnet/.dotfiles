-- map background PB<opacity> {{{
local map_background = {
	["<leader>PB"] = {
		name = "Background",
		["1"] = {
			function()
				require("presenta").background(1)
			end,
			"Background 1",
		},
		["2"] = {
			function()
				require("presenta").background(0.2)
			end,
			"Background 0,2",
		},
		["4"] = {
			function()
				require("presenta").background(0.4)
			end,
			"Background 0,4",
		},
		["6"] = {
			function()
				require("presenta").background(0.6)
			end,
			"Background 0,6",
		},
		["8"] = {
			function()
				require("presenta").background(0.8)
			end,
			"Background 0,8",
		},
	},
}
-- }}}

-- map Comment PC Before/After {{{
local map_comment = {
	["<leader>PC"] = {
		name = "Comment",
		C = {
			function()
				require("presenta").comment()
			end,
			"Comment",
		},
		B = {
			function()
				require("presenta").cbefore()
			end,
			"Before",
		},
		A = {
			function()
				require("presenta").cafter()
			end,
			"After",
		},
	},
}
-- }}}

-- map Down {{{
local map_down = {
	["<leader>PP"] = {
		name = "Presentacions",
		mode = { "n", "v" },
		D = {
			function()
				require("presenta").down()
			end,
			"slide Down",
		},
	},
}
-- }}}

-- map Font PF Small / Green {{{
local map_font = {
	["<leader>PF"] = {
		name = "Font",
		G = {
			function()
				require("presenta").fgreen()
			end,
			"Green",
		},
		S = {
			function()
				require("presenta").fsmall()
			end,
			"Small",
		},
	},
}

-- }}}

-- map Test: P Line P Position {{{
local map_test = {
	["<leader>P"] = {
		mode = { "n", "v" },
		L = {
			function()
				require("presenta").line()
			end,
			"Line",
		},
		P = {
			function()
				require("presenta").position()
			end,
			"Position",
		},
	},
}
-- }}}

return {
	name = "presenta",
	cmd = "Presenta",
	dir = "~/.config/nvim/lua/plugins-my/presenta.nvim",
	event = "BufRead /home/mimosinnet/Dades/IntercanviWin/Presentacions/*/*.md",
	config = function()
		local wk = require("which-key")
		wk.register(map_background)
		wk.register(map_comment)
		wk.register(map_down)
		wk.register(map_font)
		wk.register(map_test)
	end,
}
