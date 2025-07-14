local api = vim.api
local augroup = api.nvim_create_augroup
local autocmd = api.nvim_create_autocmd

-- Highlight on yank
local yankGrp = augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
	command = "silent! lua vim.highlight.on_yank()",
	group = yankGrp,
})

autocmd("FileType", {
	pattern = { "markdown", "json", "jsonc", "yaml", "html", "xml" },
	callback = function()
		vim.g.indentline_setconceal = 0
	end,
})
autocmd("FileType", {
	pattern = { "json", "jsonc" },
	command = "setlocal conceallevel=0",
})

autocmd("FileType", {
	pattern = "*.tf",
	callback = function()
		vim.bo.filetype = "terraform"
	end,
})
