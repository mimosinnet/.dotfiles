-- map Presentacio {{{
local map_presenta = {
  {"<leader>P", name = "Presenta" },
  -- Multimedia
  {"<leader>PI", function() require("presenta").image() end, desc = "Image" },
  {"<leader>PS", function() require("presenta").sound() end, desc = "Sound" },
  {"<leader>PV", function() require("presenta").video() end, desc = "Video" },
  -- Slide Down 
	{"<leader>PPD", function() require("presenta").down() end, desc = "slide Down", mode = { "n", "v" } },
  -- Comment 
  {"<leader>PC",  name = "Comment" },
	{"<leader>PCA", function() require("presenta").cafter()  end, desc = "After"   },
	{"<leader>PCB", function() require("presenta").cbefore() end, desc = "Before"  },
	{"<leader>PCC", function() require("presenta").comment() end, desc = "Comment" },
  -- Background
  {"<leader>PB", name = "Background"},
  {"<leader>PB1", function() require("presenta").background(1)   end, desc = "Background 1"   },
  {"<leader>PB2", function() require("presenta").background(0.2) end, desc = "Background 0,2" },
  {"<leader>PB4", function() require("presenta").background(0.4) end, desc = "Background 0,4" }, 
  {"<leader>PB6", function() require("presenta").background(0.6) end, desc = "Background 0,6" }, 
  {"<leader>PB8", function() require("presenta").background(0.8) end, desc = "Background 0,8" },
  -- Font
	{"<leader>PG", function() require("presenta").fgreen() end, desc = "Green" },
	{"<leader>PS", function() require("presenta").fsmall() end, desc = "Small" },
  -- Test
  {"<leader>PL", function() require("presenta").line()     end, desc = "Test Line",     mode = { "n", "v" } }, 
  {"<leader>PP", function() require("presenta").position() end, desc = "Test Position", mode = { "n", "v" } },
}
-- }}}

return {
	name = "presenta",
	cmd = "Presenta",
	dir = "~/.config/nvim/lua/plugins-my/presenta.nvim",
	event = "BufRead /home/mimosinnet/Dades/IntercanviWin/Presentacions/*/*.md",
	config = function()
		local wk = require("which-key")
		wk.add(map_presenta)
	end,
}
