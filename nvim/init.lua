vim.cmd('let $SHELL = "' .. vim.env.SHELL .. '"')

-- Map <leader> to space
local g = vim.g
local o = vim.o
g.mapleader = " "
g.maplocalleader = " "

require("Hlanden.lazy")
require("Hlanden.vim_settings")
require("Hlanden.key_bindings")
require("Hlanden.autocmd")
