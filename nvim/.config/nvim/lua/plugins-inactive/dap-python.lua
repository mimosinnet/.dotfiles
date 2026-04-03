-- ATENCIÓ: canviar a aquest i ajuntar configuracions:
-- https://github.com/NeuralNine/config-files/blob/master/arch_config/.config/nvim/lua/plugins/nvim-dap.luaº
-- https://github.com/rcarriga/nvim-dap-ui
return {
	"mfussenegger/nvim-dap-python",
	ft = "python", -- filetype
	config = function()
		require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
	end,
	dependencies = {
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
	},
}
