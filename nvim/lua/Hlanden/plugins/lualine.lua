return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
		opts = {
			options = {
				globalstatus = true,
				theme = "gruvbox_dark",
			},
			tabline = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{
						"buffers",
						use_mode_colors = false,
						buffers_color = {
							-- Same values as the general color option can be used here.
							active = "lualine_b_normal", -- Color for active buffer.
							inactive = "lualine_c_inactive", -- Color for inactive buffer.
						},
					},
				},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		},
	},
}
