vim.cmd('let $SHELL = "' .. vim.env.SHELL .. '"')

-- Map <leader> to space
local g = vim.g
local o = vim.o
g.mapleader = " "
g.maplocalleader = " "

require("Hlanden.lazy")
require("Hlanden.vim_settings")
require("Hlanden.plug_settings")
require("Hlanden.key_bindings")
require("Hlanden.lsp_and_cmp")
require("Hlanden.mason")
require("Hlanden.treesitter")
require("Hlanden.autocmd")
require("Hlanden.copilot")

---Pretty print lua table
function _G.dump(...)
	local objects = vim.tbl_map(vim.inspect, { ... })
	print(unpack(objects))
end

function ReloadConfig()
	-- Clear the package cache
	for name, _ in pairs(package.loaded) do
		if name:match("^Hlanden") then
			package.loaded[name] = nil
		end
	end

	-- Re-source init.lua
	dofile(vim.env.MYVIMRC)
	vim.notify("Neovim configuration reloaded!", vim.log.levels.INFO)
end
