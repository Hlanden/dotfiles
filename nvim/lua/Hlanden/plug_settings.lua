require("colorizer").setup()

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
	-- size can be a number or function which is passed the current terminal
	size = 14,
	open_mapping = [[<leader>t]],
	hide_numbers = true, -- hide the number column in toggleterm buffers
	shade_filetypes = { "none", "fzf" },
	autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
	shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
	shading_factor = "1", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
	start_in_insert = false,
	insert_mappings = false, -- whether or not the open mapping applies in insert mode
	terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
	persist_size = true,
	persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
	direction = "horizontal",
	close_on_exit = true, -- close the terminal window when the process exits
	shell = vim.o.shell, -- change the default shell
	auto_scroll = true, -- automatically scroll to the bottom on terminal output
	-- This field is only relevant if direction is set to 'float'
	float_opts = {
		-- The border key is *almost* the same as 'nvim_open_win'
		-- see :h nvim_open_win for details on borders however
		-- the 'curved' border is a custom border type
		-- not natively supported but implemented in this plugin.
		-- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
		border = "curved",
		-- like `size`, width and height can be a number or function which is passed the current terminal
		-- width = <value>,
		-- height = <value>,
		winblend = 3,
	},
	winbar = {
		enabled = false,
		name_formatter = function(term) --  term: Terminal
			return term.name
		end,
	},
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

require("dapui").setup()
require("neotest").setup({
	adapters = {
		require("neotest-python")({
			dap = { console = "integratedTerminal" },
		}),
	},
	quickfix = {
		enabled = false,
		open = false,
	},
	output = {
		enabled = true,
		open_on_run = false,
		enter = true,
		auto_close = true,
		short = false,
	},
})

-- Hex editor
require("hex").setup()

-- Debugger visuals
vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939", bg = "#31353f" })
vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef", bg = "#31353f" })
vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "#31353f" })

vim.fn.sign_define(
	"DapBreakpoint",
	{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
	"DapBreakpointCondition",
	{ text = "ﳁ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
	"DapBreakpointRejected",
	{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
	"DapLogPoint",
	{ text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
)
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })

-- Parrot: AI implementation
-- require("parrot").setup({
-- 	-- Providers must be explicitly added to make them available.
--     providers = {
--         pplx = {
--             name = "pplx",
--             api_key = os.getenv("PERPLEXITY_API_KEY"),
--             endpoint = "https://api.perplexity.ai/chat/completions",
--             params = {
--                 chat = { temperature = 1.1, top_p = 1 },
--                 command = { temperature = 1.1, top_p = 1 },
--             },
--             topic = {
--                 model = "sonar",
--                 params = { max_tokens = 64 },
--             },
--             models = {
--                 "sonar",
--                 "sonar-pro",
--                 "sonar-reasoning",
--                 "sonar-reasoning-pro",
--                 "sonar-deep-research",
--                 "r1-1776",
--             },
--         },
-- 	},
-- 	hooks = {
-- 		UnitTest = function(prt, params)
-- 			local chat_prompt = [[
--              I have the following code from {{filename}}:
--
--             ```
--             {{filecontent}}
--             ```
--
--             Please look at the following section specifically and write suitable unit tests:
--             ```
--             {{selection}}
--             ```
--
--             Do not add comments to the code.
--         ]]
-- 			local model_obj = prt.get_model("command")
-- 			prt.ChatNew(params, chat_prompt)
-- 			-- prt.Prompt(params, prt.ui.Target.rewrite, model_obj, "🤖 Ask ~ ", chat_prompt)
-- 		end,
-- 	},
-- })
--
local function parrot_status()
	local status_info = require("parrot.config").get_status_info()
	local status = ""
	if status_info.is_chat then
		status = status_info.prov.chat.name
	else
		status = status_info.prov.command.name
	end
	return string.format("%s(%s)", status, status_info.model)
end

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

require("nvim-lightbulb").setup({
	autocmd = { enabled = true },
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
