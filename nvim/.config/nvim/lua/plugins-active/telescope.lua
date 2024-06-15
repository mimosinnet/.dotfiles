--[[ https://github.com/nvim-telescope/telescope.nvim
 Telescope is a fuzzy finder that comes with a lot of different things that
 it can fuzzy find! It's more than just a "file finder", it can search
 many different aspects of Neovim, your workspace, LSP, and more!
 
 The easiest way to use Telescope, is to start by doing something like:
  :Telescope help_tags
 
 After running this command, a window will open up and you're able to
 type in the prompt window. You'll see a list of `help_tags` options and
 a corresponding preview of the help.
 
 Two important keymaps to use while in Telescope are:
  - Insert mode: <c-/>
  - Normal mode: ?
 
 This opens a window that shows you all of the keymaps for the current
 Telescope picker. This is really useful to discover what Telescope can
 do as well as how to actually do it!

See `:help telescope` and `:help telescope.setup()`

]]
--

local mapvimkey = require("util.keymapper").mapvimkey

local config = function()
	local telescope = require("telescope")
	telescope.setup({
		defaults = {
			mappings = {
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
				},
			},
		},
		pickers = {
			find_files = {
				theme = "dropdown",
				previewer = true,
				hidden = true,
			},
			live_grep = {
				theme = "dropdown",
				previewer = true,
			},
			buffers = {
				theme = "dropdown",
				previewer = true,
			},
		},
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown(),
			},
			"fzf",
		},
	})
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.3",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ -- If encountering errors, see telescope-fzf-native README for installation instructions
			"nvim-telescope/telescope-fzf-native.nvim",

			-- `build` is used to run some command when the plugin is installed/updated.
			-- This is only run then, not every time Neovim starts up.
			build = "make",

			-- `cond` is a condition used to determine whether this plugin should be
			-- installed and loaded.
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		-- Useful for getting pretty icons, but requires a Nerd Font.
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = config,
	keys = {
		mapvimkey("<leader>sh", "Telescope help_tags", "[S]earch [H]elp"),
		mapvimkey("<leader>sk", "Telescope keymaps", "[S]earch [K]eymaps"),
		mapvimkey("<leader>sf", "Telescope find_files", "[S]earch [F]iles"),
		mapvimkey("<leader>ss", "Telescope builtin", "[S]earch [S]elect Telescope"),
		mapvimkey("<leader>sw", "Telescope grep_string", "[S]earch current [W]ord"),
		mapvimkey("<leader>sg", "Telescope live_grep", "[S]earch by [G]rep"),
		mapvimkey("<leader>sd", "Telescope diagnostics", "[S]earch [D]iagnostics"),
		mapvimkey("<leader>sr", "Telescope resume", "[S]earch [R]esume"),
		mapvimkey("<leader>s.", "Telescope oldfiles", '[S]earch Recent Files ("." for repeat)'),
		mapvimkey("<leader><leader>", "Telescope buffers", "[ ] Find existing buffers"),
	},
}
