-- About options:
-- https://www.youtube.com/watch?v=Cp0iap9u29c

-- Tab / Indentation {{{
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- Enable break indent
vim.opt.breakindent = true

-- }}}

-- Search {{{
vim.opt.incsearch = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- }}}

-- Appearance {{{

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

vim.opt.termguicolors = true
vim.opt.colorcolumn = "100"

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

vim.opt.cmdheight = 1

-- Minimal number of screen lines to keep above and below the cursor.
-- 999: cursor line always in the middle of the window, but no text selectin with mouse
vim.opt.scrolloff = 999

vim.opt.completeopt = "menuone,noinsert,noselect"

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- When a new window automatically splits, split below or right
-- (not above or left)
vim.opt.splitbelow = true
vim.opt.splitright = true
-- }}}

-- Behaviour {{{

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")

-- Save undo history
vim.opt.undofile = true

vim.opt.backspace = "indent,eol,start"

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.autochdir = false
vim.opt.iskeyword:append("-")
vim.opt.selection = "exclusive"

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard:append("unnamedplus")

vim.opt.modifiable = true
vim.opt.guicursor =
	"n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.opt.encoding = "UTF-8"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- folds
vim.opt.foldmethod = "marker"

-- Virtual Editing (useful in visual block, not limited to the end of line)
vim.opt.virtualedit = "block"

-- }}}

-- Spellling {{{
vim.opt.spelllang = "en,es,ca"
-- }}}

-- Backup {{{
vim.opt.backup = true
vim.opt.writebackup = true
vim.opt.backupdir = "/home/mimosinnet/.config/nvim/backup"
vim.opt.undodir = "/home/mimosinnet/.config/nvim/undodir"
-- }}}
