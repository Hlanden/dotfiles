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

local sticky_list = {
	"#{buffer}",
	"@{insert_edit_into_file}",
	"@{cmd_runner}",
	"@{create_file}",
	"@{delete_file}",
	"@{file_search}",
	"@{files}",
	"@{get_changed_files}",
	"@{grep_search}",
}

-- Function to insert all stickies below "## Me"
local function insert_stickies()
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local me_idx = nil
	for i, line in ipairs(lines) do
		if line:match("^## Me$") then
			me_idx = i - 1
			break
		end
	end

	if not me_idx then
		me_idx = #lines
	end

	vim.api.nvim_buf_set_lines(0, me_idx + 2, me_idx + 2, false, sticky_list)
end

-- Example usage inside an autocmd callback
autocmd("FileType", {
	pattern = "codecompanion",
	callback = function()
		if vim.b.cc_auto_pinned then
			return
		end
		vim.b.cc_auto_pinned = true
		vim.defer_fn(insert_stickies, 50)
	end,
})
