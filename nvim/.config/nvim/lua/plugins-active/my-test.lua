--- map test {{{
local map_test = {
	["<leader>T"] = {
		mode = { "n" },
		name = "Test",
		["t"] = {
			function()
				require("test").test()
			end,
			"Test",
		},
	},
}
--- }}}

return {
	name = "test",
	cmd = "Test",
	dir = "~/.config/nvim/lua/plugins-my/test.nvim",
	config = function()
		vim.api.nvim_create_user_command("Test", 'echo "Test plugin loaded"', {})
		local wk = require("which-key")
		wk.register(map_test)
	end,
}
