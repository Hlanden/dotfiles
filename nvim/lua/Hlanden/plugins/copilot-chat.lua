return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
        enabled = false,
		dependencies = {
			{ "github/copilot.vim" },
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		branch = "main",
		build = "make tiktoken",
		init = function()
			vim.g.copilot_no_tab_map = true
			vim.g.copilot_hide_during_completion = false
			vim.g.copilot_proxy_strict_ssl = false
			vim.g.copilot_settings = { selectedCompletionModel = "gpt-4.1-copilot" }
			vim.g.copilot_enabled = false
			vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
				expr = true,
				replace_keycodes = false,
			})
			vim.keymap.set("n", "<leader>ct", function()
				vim.g.copilot_enabled = not vim.g.copilot_enabled
				print("Copilot enabled: " .. tostring(vim.g.copilot_enabled))
			end, { desc = "Toggle Copilot" })
			-- Enable Copilot only in CopilotChat buffer
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "copilot-chat",
				callback = function()
					vim.g.copilot_enabled = true
				end,
			})
			vim.api.nvim_create_autocmd("BufLeave", {
				pattern = "*",
				callback = function()
					if vim.bo.filetype == "copilot-chat" then
						vim.g.copilot_enabled = false
					end
				end,
			})
		end,
		event = "VeryLazy",
		opts = {
			model = "gpt-4o",
			debug = false,
			temperature = 0,
			question_header = "Question",
			answer_header = "Answer",
			error_header = "> Error",
			log_level = "info",
			sticky = { "#neovim_Buffer", "/SystemPrompt", "$claude-opus-4.5" },
			tools = { "neovim", "copilot" },
			mappings = {
				complete = {
					insert = "<Tab>",
				},
				close = {
					normal = "q",
					insert = "",
				},
				reset = {
					normal = "<C-l>",
					insert = "<C-l>",
				},
				submit_prompt = {
					normal = "<CR>",
					insert = "<C-s>",
				},
				toggle_sticky = {
					normal = "grr",
				},
				clear_stickies = {
					normal = "grx",
				},
				accept_diff = {
					normal = "<C-y>",
					insert = "<C-y>",
				},
				jump_to_diff = {
					normal = "gj",
				},
				quickfix_answers = {
					normal = "gqa",
				},
				quickfix_diffs = {
					normal = "<leader>al",
				},
				yank_diff = {
					normal = "gy",
					register = '"', -- Default register to use for yanking
				},
				show_diff = {
					normal = "gd",
					full_diff = false, -- Show full diff instead of unified diff when showing diff window
				},
				show_info = {
					normal = "gi",
				},
				show_context = {
					normal = "gc",
				},
				show_help = {
					normal = "g?",
				},
			},
			contexts = {
				keymaps = {
					description = "Show all globally defined keymaps",
					resolve = function()
						local maps = vim.api.nvim_get_keymap("n")
						local lines = {}

						for _, map in ipairs(maps) do
							table.insert(
								lines,
								string.format("%-10s -> %s [%s]", map.lhs, map.rhs or "", map.desc or "")
							)
						end

						return {
							{
								content = table.concat(lines, "\n"),
								filename = "keymaps.txt",
								filetype = "text",
							},
						}
					end,
				},
			},
		},
		keys = {
			{ "<leader>aa", "<cmd>CopilotChatToggle<cr>", mode = { "n", "v" }, desc = "AI Toggle" },
			{ "<leader>ae", "<cmd>CopilotChatExplain<cr>", desc = "AI Explain" },
			{ "<leader>ar", "<cmd>CopilotChatReview<cr>", desc = "AI Review" },
			{ "<leader>at", "<cmd>CopilotChatTests<cr>", desc = "AI Tests" },
			{ "<leader>af", "<cmd>CopilotChatFix<cr>", desc = "AI Fix" },
			{ "<leader>ao", "<cmd>CopilotChatOptimize<cr>", desc = "AI Optimize" },
			{ "<leader>ad", "<cmd>CopilotChatDocs<cr>", desc = "AI Documentation" },
			{ "<leader>ac", "<cmd>CopilotChatCommit<cr>", desc = "AI Generate Commit" },
			{ "<leader>ap", "<cmd>CopilotChatPlan<cr>", desc = "AI Development Plan" },
		},
		config = function(_, opts)
			require("CopilotChat").setup(opts)
			require("CopilotChat.config").functions.plan = require("Hlanden.copilotchat.tools.plan")
			require("CopilotChat.config").prompts.Plan = require("Hlanden.copilotchat.prompts.plan")
			require("CopilotChat.config").prompts.AdoTicketReview = require("Hlanden.copilotchat.prompts.ado_ticket_review")
			require("CopilotChat.config").prompts.PrAdoReview = require("Hlanden.copilotchat.prompts.pr_ado_review")
			require("CopilotChat.config").prompts.PrPlaywrightTests = require("Hlanden.copilotchat.prompts.test_frontend")
			require("CopilotChat.config").prompts.CreateStory = require("Hlanden.copilotchat.prompts.create_story")
			require("CopilotChat.config").prompts.SystemPrompt = require("Hlanden.copilotchat.prompts.system_prompt")
		end,
	},
}
