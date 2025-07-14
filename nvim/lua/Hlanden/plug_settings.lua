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

require("whitespace-nvim").setup({
	highlight = "Substitute",
	ignored_filetypes = { "TelescopePrompt", "Trouble", "help", "dashboard" },
	ignore_terminal = true,
})

require("octo").setup()

require("ibl").setup({
	exclude = { filetypes = { "json", "jsonc", "markdown", "help", "dashboard" } },
})
