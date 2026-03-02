return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = { "codecompanion", "watson" },
	opts = {
		render_modes = true, -- Render in ALL modes
		file_types = { "markdown", "codecompanion", "watson" },
		sign = {
			enabled = false,
		},
		latex = { enabled = false },
		overrides = {
			filetype = {
				codecompanion = {
					html = {
						tag = {
							buf     = { icon = " ",  highlight = "CodeCompanionChatIcon" },
							file    = { icon = " ",  highlight = "CodeCompanionChatIcon" },
							group   = { icon = " ",  highlight = "CodeCompanionChatIcon" },
							help    = { icon = "󰘥 ", highlight = "CodeCompanionChatIcon" },
							image   = { icon = " ",  highlight = "CodeCompanionChatIcon" },
							symbols = { icon = " ",  highlight = "CodeCompanionChatIcon" },
							tool    = { icon = "󰯠 ", highlight = "CodeCompanionChatIcon" },
							url     = { icon = "󰌹 ", highlight = "CodeCompanionChatIcon" },
						},
					},
				},
				watson = {
					-- Watson uses standard markdown headings and code blocks
					-- No custom html tags needed
				},
			},
		},
	},
}
