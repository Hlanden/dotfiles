-- autocmd BufEnter * colorscheme tokyonight
-- autocmd BufEnter * highlight CursorLineNR guifg=#ffcc00 ctermfg=yellow
-- autocmd BufEnter * highlight LineNr guifg=#1ac949 ctermfg=none
-- autocmd BufEnter * set bg=dark
-- autocmd BufEnter * AirlineTheme violet
-- autocmd BufEnter * ColorizerAttachToBuffer
-- autocmd BufEnter *.tex colorscheme gruvbox
-- autocmd BufEnter *.tex set bg=light
-- autocmd BufEnter *.tex AirlineTheme solarized
-- autocmd FileType c,cpp,h,hpp,objc map <buffer> = <Plug>(coc-format-selected)
-- au Filetype c,cpp,json,objc,objccp,py,js call rainbow#load()

local api = vim.api

-- Highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
    command = "silent! lua vim.highlight.on_yank()",
    group = yankGrp,
})

-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
