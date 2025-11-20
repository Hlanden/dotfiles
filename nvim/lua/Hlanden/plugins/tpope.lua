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
		config = function()
			vim.keymap.set("n", "<leader>gg", toggle_fugitive, { desc = "Toggle fugitive" })
			vim.keymap.set("n", "<leader>gP", "<CMD>Git push<CR>", { desc = "Git: Push (Fugitive)" })
			vim.keymap.set("n", "<leader>gp", "<CMD>Git pull --rebase<CR>", { desc = "Git: Pull --rebase (Fugitive)" })
			vim.api.nvim_create_user_command("DiffMain", function()
                vim.cmd("only")
                vim.cmd("diffoff!")
				vim.cmd("Gvdiffsplit! main")
			end, {})

			vim.keymap.set("n", "<leader>dm", ":DiffMain<CR>", { desc = "Diff with main branch", silent = true })
		end,
	},
	{ "tpope/vim-repeat" },
	{ "tpope/vim-unimpaired" },
	{ "tpope/vim-rhubarb" },
}
