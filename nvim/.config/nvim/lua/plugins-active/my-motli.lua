--- map esborra Posició{{{
local map_g_pos = {
	{ "<leader>M", group = "Motli" },
	{ "<leader>Mb", group = "Borra" },
	{ "<leader>Mg", group = "Guarda" },
	{
		"<leader>Mbp",
		function()
			require("motli").g_pos("global")
		end,
		desc = "Posició",
		mode = "n",
	},
	{
		"<leader>Mgp",
		function()
			require("motli").g_pos("vglobal")
		end,
		desc = "Posició",
		mode = "n",
	},
	{
		"<leader>Mbl",
		function()
			require("motli").g_lletra("global")
		end,
		desc = "Lletra",
		mode = "n",
	},
	{
		"<leader>Mgl",
		function()
			require("motli").g_lletra("vglobal")
		end,
		desc = "Lletra",
		mode = "n",
	},
	{
		"<leader>Mbd",
		function()
			require("motli").g_dos("global")
		end,
		desc = "Dos Lletres",
		mode = "n",
	},
	{
		"<leader>Mgd",
		function()
			require("motli").g_dos("vglobal")
		end,
		desc = "Dos Lletres",
		mode = "n",
	},
	{
		"<leader>Mbt",
		function()
			require("motli").g_tres("global")
		end,
		desc = "Tres Lletres",
		mode = "n",
	},
	{
		"<leader>Mgt",
		function()
			require("motli").g_tres("vglobal")
		end,
		desc = "Tres Lletres",
		mode = "n",
	},
}
--- }}}

return {
	name = "motli",
	cmd = "Motli",
	dir = "~/.config/nvim/lua/plugins-my/motli.nvim",
	config = function()
		vim.api.nvim_create_user_command("Motli", 'echo "Motli plugin loaded"', {})
		local wk = require("which-key")
		wk.add(map_g_pos)
	end,
}
