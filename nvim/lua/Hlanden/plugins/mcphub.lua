return {
	{
		"ravitemer/mcphub.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"deathbeam/CopilotChat.nvim",
		},
		build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
		event = "VeryLazy",
		config = function()
			mcp = require("mcphub")
			mcp.setup({
				log = {
					level = vim.log.levels.DEBUG,
					to_file = true,
					file_path = vim.fn.expand("~/mcphub.log"),
				},
				extensions = {
					copilotchat = {
						enabled = true,

						convert_tools_to_functions = true, -- Convert MCP tools to CopilotChat functions
						convert_resources_to_functions = true, -- Convert MCP resources to CopilotChat functions
						add_mcp_prefix = false, -- Add "mcp_" prefix to function names
					},
				},
			})
		end,
	},
}
