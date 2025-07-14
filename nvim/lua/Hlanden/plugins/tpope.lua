local function toggle_fugitive()
	local fugitive_buf = nil
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(buf) then
			local name = vim.api.nvim_buf_get_name(buf)
			if name:match("fugitive://") then
				fugitive_buf = buf
				break
			end
		end
	end
	if fugitive_buf then
		-- Close the window showing the fugitive buffer
		for _, win in ipairs(vim.api.nvim_list_wins()) do
			if vim.api.nvim_win_get_buf(win) == fugitive_buf then
				vim.api.nvim_win_close(win, true)
				return
			end
		end
	else
		vim.cmd("Git")
	end
end

return {
	{ "tpope/vim-obsession" },
	{ "tpope/vim-commentary" },
	{ "tpope/vim-surround" },
	{
		"tpope/vim-fugitive",
		keys = {
			{ "<leader>gg", toggle_fugitive, mode = { "n" }, desc = "Toggle fugitive" },
			{ "<leader>gP", "<CMD>Git push<CR>", mode = { "n" }, desc = "Git: Push (Fugitive)" },
			{ "<leader>gp", "<CMD>Git pull --rebase<CR>", mode = { "n" }, desc = "Git: Pull --rebase (Fugitive)" },
		},
	},
	{ "tpope/vim-repeat" },
	{ "tpope/vim-unimpaired" },
	{ "tpope/vim-rhubarb" },
}
