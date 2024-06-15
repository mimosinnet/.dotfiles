-- auto-format on save
local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	group = lsp_fmt_group,
	callback = function()
		local efm = vim.lsp.get_active_clients({ name = "efm" })

		if vim.tbl_isempty(efm) then
			return
		end

		vim.lsp.buf.format({ name = "efm", async = true })
	end,
})

-- highlight on yank
local highlight_yank_group = vim.api.nvim_create_augroup("HighlightYankGroup", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = highlight_yank_group,
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- backup files with tiemstamp
-- https://www.reddit.com/r/neovim/comments/wlkq0e/neovim_configuration_to_backup_files_with/
-- Add timestamp as extension for backup files
local timestamp_backupext = vim.api.nvim_create_augroup("timestamp_backupext", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Add timestamp to backup extension",
	group = timestamp_backupext,
	pattern = "*",
	callback = function()
		vim.opt.backupext = "-" .. vim.fn.strftime("%Y.%m.%d-%H.%M.%S") .. ".backup"
	end,
})
