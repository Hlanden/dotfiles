return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			view = {
				adaptive_size = true,
				width = {
					min = 20,
					max = 50,
				},
			},
		},
		keys = {
			{ "<leader>nn", "<cmd>NvimTreeToggle<cr>", mode = { "n" }, desc = "Toggle NvimTree" },
			{ "<leader>nf", "<cmd>NvimTreeFindFile<cr>", mode = { "n" }, desc = "Find File in NvimTree" },
		},
	},
}
