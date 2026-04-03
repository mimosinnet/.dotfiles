-- https://github.com/folke/which-key.nvim

return {
	"folke/which-key.nvim",
  dependencies = {
    "nvim-mini/mini.icons",
    'nvim-tree/nvim-web-devicons'
  },
	event = "VeryLazy",
	priority = 990,
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {},
}
