return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	priority = 990,
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {},
}
