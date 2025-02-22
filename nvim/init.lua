require('Hlanden.plugins')
require('Hlanden.mason')
require('Hlanden.settings')
require('Hlanden.autocmd')
require('Hlanden.key_bindings')
require('Hlanden.lsp_and_cmp')

---Pretty print lua table
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print(unpack(objects))
end
