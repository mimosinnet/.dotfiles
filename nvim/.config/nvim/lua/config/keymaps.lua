-- A FER: canviar els mapkey a vim.keymap.set

-- Eliminar aquesta línia quan s'hagi traduit a vim.keymap.set
local mapkey = require("util.keymapper").mapvimkey

-- Buffer Navigation
mapkey("<leader>bn", "bnext", "n") -- Next buffer
mapkey("<leader>bp", "bprevious", "n") -- Prev buffer
mapkey("<leader>bb", "e #", "n") -- Switch to Other Buffer
mapkey("<leader>`", "e #", "n") -- Switch to Other Buffer

-- Pane and Window Navigation 
-- Consider if this can be removed
-- See: tmux-navigator.lua
mapkey("<C-h>", "<C-w>h", "n") -- Navigate Left
mapkey("<C-j>", "<C-w>j", "n") -- Navigate Down
mapkey("<C-k>", "<C-w>k", "n") -- Navigate Up
mapkey("<C-l>", "<C-w>l", "n") -- Navigate Right
mapkey("<C-h>", "wincmd h", "t") -- Navigate Left
mapkey("<C-j>", "wincmd j", "t") -- Navigate Down
mapkey("<C-k>", "wincmd k", "t") -- Navigate Up
mapkey("<C-l>", "wincmd l", "t") -- Navigate Right
mapkey("<C-h>", "TmuxNavigateLeft", "n") -- Navigate Left
mapkey("<C-j>", "TmuxNavigateDown", "n") -- Navigate Down
mapkey("<C-k>", "TmuxNavigateUp", "n") -- Navigate Up
mapkey("<C-l>", "TmuxNavigateRight", "n") -- Navigate Right

-- Window size
vim.keymap.set("n", "<C-Up>",    "<cmd>resize +2<cr>",          { desc = "increase window size horizontal"})
vim.keymap.set("n", "<C-Down>",  "<cmd>resize -2<cr>",          { desc = "decrease window size horizontal"})
vim.keymap.set("n", "<C-Left>",  "<cmd>vertical resize +2<cr>", { desc = "increase window size vertical"})
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize -2<cr>", { desc = "decrease window size vertical"})

-- Show Full File-Path
vim.keymap.set("n", "<leader>pa", "<cmd>echo expand('%:p')<cr>", { desc = "echo file-path" })

-- Comments
-- Removed mapping gc because: WARNING In mode n, <gc> overlaps with <gcc>
-- See :checkhealth which-key
vim.keymap.del('n', 'gc')

