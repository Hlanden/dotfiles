-- Vanilla Config
require('Hlanden.settings')
require('Hlanden.autocmd')
require('Hlanden.plugins')
require('Hlanden.key_bindings')
require('Hlanden.cmp')

---Pretty print lua table
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print(unpack(objects))
end