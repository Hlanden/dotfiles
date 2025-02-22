vim.cmd('let $SHELL = "' .. vim.env.SHELL .. '"')

require('Hlanden.plugins')
require('Hlanden.mason')
require('Hlanden.vim_settings')
require('Hlanden.treesitter')
require('Hlanden.plug_settings')
require('Hlanden.autocmd')
require('Hlanden.key_bindings')
require('Hlanden.lsp_and_cmp')

---Pretty print lua table
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print(unpack(objects))
end

function ReloadConfig()
    -- Clear the package cache
    for name, _ in pairs(package.loaded) do
        if name:match('^Hlanden') then
            package.loaded[name] = nil
        end
    end

    -- Re-source init.lua
    dofile(vim.env.MYVIMRC)
    vim.notify("Neovim configuration reloaded!", vim.log.levels.INFO)
end

