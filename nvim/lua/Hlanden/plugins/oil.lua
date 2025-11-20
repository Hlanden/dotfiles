return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
		config = function()
			require("oil").setup({
				columns = {
					"icon",
					--"permissions",
					--"size",
					--"mtime",
				},
				preview_win = {
					update_on_curson_moved = true,
					preview_method = "load",
					win_options = {},
				},
			})
		end,
		keys = {
			{ "<leader>nn", "<cmd>Oil<cr>", mode = { "n" }, desc = "Open oil" },
		},
	},
}
