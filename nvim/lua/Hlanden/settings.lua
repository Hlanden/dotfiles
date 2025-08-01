local g = vim.g
local o = vim.o

o.termguicolors = true

vim.cmd("colorscheme catppuccin-macchiato")

-- Decrease update time
o.timeoutlen = 500
o.ttimeoutlen = 10
o.updatetime = 200

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 8

-- Better editor UI
o.number = true
o.relativenumber = true
o.signcolumn = "auto"
o.cursorline = true

vim.cmd([[
highlight CursorLine guibg=#404040 guifg=NONE
]])
-- Better editing experience
o.expandtab = true
-- o.smarttab = true
o.cindent = true
-- o.autoindent = true
o.wrap = true
o.textwidth = 300
o.tabstop = 4
o.shiftwidth = 0
o.softtabstop = -1 -- If negative, shiftwidth value is used

-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard = "unnamedplus"

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false

-- Remember 50 items in commandline history
o.history = 50

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- Preserve view while jumping
o.jumpoptions = "view"

-- Lua tree default setup
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
