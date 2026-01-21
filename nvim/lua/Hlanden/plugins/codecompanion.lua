-- Spinner for fidget.nvim integration
local spinner = {
	completed = "󰗡 Completed",
	error = " Error",
	cancelled = "󰜺 Cancelled",
}

local function format_adapter(adapter)
	local parts = {}
	table.insert(parts, adapter.formatted_name)
	if adapter.model and adapter.model ~= "" then
		table.insert(parts, "(" .. adapter.model .. ")")
	end
	return table.concat(parts, " ")
end

local function setup_spinner()
	local ok, progress = pcall(require, "fidget.progress")
	if not ok then
		return
	end

	spinner.handles = {}

	local group = vim.api.nvim_create_augroup("codecompanion.spinner", { clear = true })

	vim.api.nvim_create_autocmd("User", {
		pattern = "CodeCompanionRequestStarted",
		group = group,
		callback = function(args)
			local handle = progress.handle.create({
				title = "",
				message = "  Working...",
				lsp_client = {
					name = format_adapter(args.data.adapter),
				},
			})
			spinner.handles[args.data.id] = handle
		end,
	})

	vim.api.nvim_create_autocmd("User", {
		pattern = "CodeCompanionRequestFinished",
		group = group,
		callback = function(args)
			local handle = spinner.handles[args.data.id]
			spinner.handles[args.data.id] = nil
			if handle then
				if args.data.status == "success" then
					handle.message = spinner.completed
				elseif args.data.status == "error" then
					handle.message = spinner.error
				else
					handle.message = spinner.cancelled
				end
				handle:finish()
			end
		end,
	})
end

return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"ravitemer/mcphub.nvim",
		"j-hui/fidget.nvim",
	},
	opts = {
		ignore_warnings = true, -- test
		interactions = {
			inline = {
				keymaps = {
					accept_change = {
						modes = { n = "ga" },
						description = "Accept the suggested change",
					},
					reject_change = {
						modes = { n = "gr" },
						opts = { nowait = true },
						description = "Reject the suggested change",
					},
					always_accept = {
						modes = { n = "NEVER_USE_THIS" },
						description = "Always accept changes (YOLO mode)",
					},
				},
			},
			chat = {
				adapter = {
					name = "copilot",
					model = "claude-opus-4.5",
				},
				-- Tools configuration
				tools = {
					["insert_edit_into_file"] = {
						opts = {
							requires_approval_before = {
								buffer = false,
								file = false,
							},
							requires_approval_after = true,
						},
					},
					["create_file"] = {
						opts = {
							requires_approval_before = true,
						},
					},
					["delete_file"] = {
						opts = {
							requires_approval_before = true,
						},
					},
					["cmd_runner"] = {
						opts = {
							requires_approval_before = false,
							requires_approval_after = false,
						},
					},
				},
				keymaps = {
					send = {
						modes = {
							n = { "<CR>", "<C-s>" },
							i = "<C-s>",
						},
						index = 2,
						callback = "keymaps.send",
						description = "Send response",
					},
					close = {
						modes = { n = "q" },
						index = 5,
						callback = "keymaps.stop",
						description = "Stop request",
					},
					clear = {
						modes = { n = "<C-l>" },
						index = 6,
						callback = function(chat)
							chat:clear()
							vim.b.cc_auto_pinned = false
							-- Re-trigger filetype autocmd
							vim.defer_fn(function()
								vim.bo.filetype = "codecompanion"
							end, 100)
						end,
						description = "Clear chat",
					},
					codeblock = {
						modes = { n = "gc" },
						index = 7,
						callback = "keymaps.codeblock",
						description = "Insert codeblock",
					},
					yank_code = {
						modes = { n = "gy" },
						index = 8,
						callback = "keymaps.yank_code",
						description = "Yank code",
					},
					stop = false,
					next_chat = {
						modes = { n = "}" },
						index = 11,
						callback = "keymaps.next_chat",
						description = "Next chat",
					},
					previous_chat = {
						modes = { n = "{" },
						index = 12,
						callback = "keymaps.previous_chat",
						description = "Previous chat",
					},
					change_adapter = {
						modes = { n = "ga" },
						index = 15,
						callback = "keymaps.change_adapter",
						description = "Change adapter",
					},
					-- Add further custom keymaps here
				},
			},
		},
		extensions = {
			mcphub = {
				callback = "mcphub.extensions.codecompanion",
				opts = {
					make_vars = true,
					make_slash_commands = true,
					show_result_in_chat = true,
				},
			},
		},
	},
	keys = {
		{
			"<Leader>ac",
			"<cmd>CodeCompanionActions<CR>",
			desc = "Open the action palette",
			mode = { "n", "v" },
		},
		{
			"<Leader>aa",
			"<cmd>CodeCompanionChat Toggle<CR>",
			desc = "Toggle a chat buffer",
			mode = { "n", "v" },
		},
		{
			"<Leader>an",
			"<cmd>CodeCompanionChat<CR>",
			desc = "New chat",
			mode = { "n", "v" },
		},
		{
			"<Leader>ai",
			"<cmd>'<,'>CodeCompanion<CR>",
			desc = "New chat",
			mode = { "n", "v" },
		},
		{
			"<LocalLeader>a",
			"<cmd>CodeCompanionChat Add<CR>",
			desc = "Add code to a chat buffer",
			mode = { "v" },
		},
	},
	config = function(_, opts)
		require("codecompanion").setup(opts)
		setup_spinner()
	end,
}
