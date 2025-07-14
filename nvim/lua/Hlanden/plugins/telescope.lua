return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
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
		end,
        keys = {
            { "<leader>ff", "<CMD>Telescope find_files<CR>", mode = { "n" }, desc = "Telescope: Find files" },
            { "<leader>fg", "<CMD>Telescope live_grep<CR>", mode = { "n" }, desc = "Telescope: Search inside all files" },
            { "<leader>fb", "<CMD>Telescope buffers<CR>", mode = { "n" }, desc = "Telescope: List buffers" },
            { "<leader>fq", "<CMD>Telescope quickfix<CR>", mode = { "n" }, desc = "Telescope: Search quickfix list" },
            { "<leader>fr", "<CMD>Telescope registers<CR>", mode = { "n" }, desc = "Telescope: Search registers" },
            { "<leader>fm", "<CMD>Telescope marks<CR>", mode = { "n" }, desc = "Telescope: Search marks" },
            { "<leader>fh", "<CMD>Telescope help_tags<CR>", mode = { "n" }, desc = "Telescope: Search help tags" },
            { "<leader>fhf", "<CMD>Telescope find_files hidden=true<CR>", mode = { "n" }, desc = "Telescope: Find hidden files" },
            { "<leader>faw", "<CMD>Telescope grep_string<CR>", mode = { "n" }, desc = "Telescope: Search current word in all files" },
            { "<leader>fl", "<CMD>Telescope current_buffer_fuzzy_find<CR>", mode = { "n" }, desc = "Telescope: Search inside current buffer" },
            { "<leader>f:", "<CMD>Telescope commands<CR>", mode = { "n" }, desc = "Telescope: Search vim commands" },
            { "<leader>fh:", "<CMD>Telescope command_history<CR>", mode = { "n" }, desc = "Telescope: Search command history" },
            { "<leader>gc", "<CMD>Telescope git_commits<CR>", mode = { "n" }, desc = "Telescope: Git commits" },
            { "<leader>gbc", "<CMD>Telescope git_bcommits<CR>", mode = { "n" }, desc = "Telescope: Git buffer commits" },
            { "<leader>gb", "<CMD>Telescope git_branches<CR>", mode = { "n" }, desc = "Telescope: Git branches" },
            { "<leader>gs", "<CMD>Telescope git_status<CR>", mode = { "n" }, desc = "Telescope: Git status" },
            { "<leader>gst", "<CMD>Telescope git_stash<CR>", mode = { "n" }, desc = "Telescope: Git stash" },
            { "gd", "<CMD>Telescope lsp_definitions<CR>",  desc = "LSP: Definitions" },
            { "gr", "<CMD>Telescope lsp_references<CR>",  desc = "LSP: References" },
            { "gi", "<CMD>Telescope lsp_implementations<CR>",  desc = "LSP: Implementations" },
            { "gs", "<CMD>Telescope lsp_document_symbols<CR>",  desc = "LSP: Document symbols" },
            { "gS", "<CMD>Telescope lsp_workspace_symbols<CR>",  desc = "LSP: Workspace symbols" },
        },
	},
	{ "nvim-telescope/telescope-ui-select.nvim" },
}
