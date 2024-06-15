-- https://github.com/roobert/tailwindcss-colorizer-cmp.nvim
-- add vs-code-style TailwindCSS color hints to the nvim-cmp completion menu
return {
	"roobert/tailwindcss-colorizer-cmp.nvim",
	-- optionally, override the default options:
	config = function()
		require("tailwindcss-colorizer-cmp").setup({
			color_square_width = 2,
		})
	end,
}
