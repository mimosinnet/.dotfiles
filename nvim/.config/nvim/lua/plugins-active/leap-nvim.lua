return {
  url = "https://codeberg.org/andyg/leap.nvim",
	event = "BufEnter",
	config = function()
		require("leap").leap { windows = { vim.fn.win_getid() } }
	end,
}
