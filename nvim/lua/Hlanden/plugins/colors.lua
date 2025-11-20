return {
	{ "morhetz/gruvbox" },
	{ "shaunsingh/solarized.nvim" },
	{ "folke/tokyonight.nvim", branch = "main" },
	{ "rebelot/kanagawa.nvim" },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup()
			vim.cmd("colorscheme rose-pine")
		end,
	},
	{ "EdenEast/nightfox.nvim" },
}
