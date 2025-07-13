require("tabline").setup({
	-- Defaults configuration options
	enable = true,
	options = {
		-- If lualine is installed tabline will use separators configured in lualine by default.
		-- These options can be used to override those settings.
		section_separators = { "", "" },
		component_separators = { "", "" },
		max_bufferline_percent = 66, -- set to nil by default, and it uses vim.
		show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
		show_devicons = true, -- this shows devicons in buffer section
		show_bufnr = false, -- this appends [bufnr] to buffer section,
		show_filename_only = true, -- shows base filename only instead of relative path in filename
		modified_icon = "+ ", -- change the default modified icon
		modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
		show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
	},
})

require("nvim-tree").setup({
  view = {
    adaptive_size = true,
    width = {
      min = 20,
      max = 50,
    },
  },
})

vim.notify = require("notify")

require("toggleterm").setup({
})

local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
		},
	},
})
require("telescope").load_extension("ui-select")

-- Hex editor
require("hex").setup()

require("lualine").setup({
	options = {
		globalstatus = true,
		theme = "gruvbox_dark",
	},
	tabline = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { require("tabline").tabline_buffers },
		lualine_x = { require("tabline").tabline_tabs },
		lualine_y = {},
		lualine_z = {},
	},
})

require("whitespace-nvim").setup({
	highlight = "Substitute",
	ignored_filetypes = { "TelescopePrompt", "Trouble", "help", "dashboard" },
	ignore_terminal = true,
})

require("octo").setup()

require("ibl").setup({
	exclude = { filetypes = { "json", "jsonc", "markdown", "help", "dashboard" } },
})
