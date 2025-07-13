local api = vim.api
local augroup = api.nvim_create_augroup
local autocmd = api.nvim_create_autocmd

-- Highlight on yank
local yankGrp = augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
    command = "silent! lua vim.highlight.on_yank()",
    group = yankGrp,
})

autocmd("filetype", {
    pattern = { "markdown", "json", "jsonc", "yaml", "html", "xml" },
    callback = function()
        vim.g.indentline_setconceal = 0
    end,
})
autocmd("FileType", {
    pattern = { "json", "jsonc" },
    command = "setlocal conceallevel=0",
})

autocmd("filetype", {
    pattern = "*.tf",
    callback = function()
        vim.bo.filetype = "terraform"
    end,
})

local function open_nvim_tree(data)
    -- Only run if started with no files and only one listed buffer exists
    if vim.fn.argc() == 0 and #vim.fn.getbufinfo({ buflisted = 1 }) == 1 then
        require("nvim-tree.api").tree.toggle({ focus = true, find_file = false, path = nil, current_window = true })
    end
end

-- autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- augroup("__formatter__", { clear = true })
-- autocmd("BufWritePost", {
-- 	group = "__formatter__",
-- 	command = ":FormatWrite",
-- })
