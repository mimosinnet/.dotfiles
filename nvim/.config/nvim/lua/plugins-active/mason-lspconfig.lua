-- bridges mason.nvim with the lspconfig plugin - making it easier to use both plugins together.
local opts = {
	ensure_installed = {
		"bashls",
		"efm",
		"jsonls",
		"lua_ls",
		"marksman", -- JPT afegit, s'ha de posar en més llocs
		"pyright",
	},

	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",
}
