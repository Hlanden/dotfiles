local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Fix * (Keep the cursor position, don't move to next match)
map('n', '*', '*N')

-- Fix n and N. Keeping cursor in center
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map('n', '<C-j>', '<CMD>move .+1<CR>')
map('n', '<C-k>', '<CMD>move .-2<CR>')
map('x', '<C-j>', ":move '>+1<CR>gv=gv")
map('x', '<C-k>', ":move '<-2<CR>gv=gv")

-- Window movement
map('n', '<leader>j', ':wincmd j<CR>')
map('n', '<leader>h', ':wincmd h<CR>')
map('n', '<leader>k', ':wincmd k<CR>')
map('n', '<leader>l', ':wincmd l<CR>')

-- Vimrc
map('n', '<leader>ev', ":execute 'edit' resolve($MYVIMRC)<cr>")
map('n', '<leader>xv', ':source $MYVIMRC<CR>')
map('n', '<leader>es', ':CocCommand snippets.editSnippets<CR>')

-- Map mark-command to other key
-- map(n, '<leader><', '`')

-- Movement in insert mode
map('i', '<C-e>', '<C-o>$')
map('i', '<C-a>', '<C-o>0')

-- Copy/paste/delete
map('x', '<leader>p', '"_dP')
map('n', '<leader>p', '"+p')
map('v', '<leader>p', '"+p')

map('n', 'yp', ':let,@",=,expand("%"),<cr>')
map('n', '<leader>y', '"+y')
map('v', '<leader>y', '"+y')
map('n', '<leader>Y', 'gg"+yG')
map('n', 'Y', 'y$')

-- Delete without saving to register
map('n', '<leader>d', '"_d')
map('v', '<leader>d', '"_d')

-- KEY-BINDINGS:
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', 'J', 'mzJ`z,')

map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', '!', '!<c-g>u')
map('i', '?', '?<c-g>u')

map('v', 'J', ":m,'>+1<CR>gv=gv")
map('v', 'K', ":m,'>-2<CR>gv=gv")

-- Make ctrl-c work as esc
map('i', '<ESC>', '<C-C>')

-- Remap add because of tmux
map('n', '<C-a><C-a>', '<C-a>')

-- Window sizing
map('n', '<Leader>-', '5<C-W><,<CR>')
map('n', '<Leader>+', '5<C-W>>,<CR>')

-- Search for visual selection
-- TODO: This is invalid...
-- map('v','//','y/\V<C-R>=escape(@","/\")<CR><CR>')

-- Markdown preview
map('n', '<leader>mp', '<Plug>MarkdownPreview')
map('n', '<leader>ms', '<Plug>MarkdownPreviewStop')

-- Python specifip
map('n', '<leader>rp', ':w,<CR>,:!python,%<CR>')

-- FZF Fuzzyfinder
-- map('n','<leader>f',':Files<CR>')
-- map('n','<leader>a',':Ag<CR>')
-- map('n','<leader>b',':Buffer<CR>')
-- map('n','<leader>m',':Marks<CR>')
-- map('n','<leader>c',':Commits<CR>')
-- map('n','<leader>w',':Windows<CR>')

-- Telescope Fuzzyfinder
local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fc', builtin.git_commits, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fq', builtin.quickfix, {})
vim.keymap.set('n', 'fr', builtin.registers, {})
vim.keymap.set('n', 'fm', builtin.marks, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})

vim.keymap.set('n', 'gd', builtin.lsp_definitions, bufopts)
vim.keymap.set('n', 'gr', builtin.lsp_references, bufopts)
vim.keymap.set('n', 'gi', builtin.lsp_implementations, bufopts)
vim.keymap.set('n', 'gt', builtin.lsp_type_definitions, bufopts)
vim.keymap.set('n', 'gs', builtin.lsp_document_symbols, bufopts)

-- NeoTree file explorer
map('n', '<leader>nn', ':NvimTreeToggle<CR>')
map('n', '<leader>nf', ':NvimTreeFindFile<CR>')
map('n', '<leader>nc', ':NvimTreeCollapse<CR>')

-- Debugger
-- TODO: Check the plugins below, do you need them?
map('n', 't<C-n>', ':TestNearest<CR>')
map('n', 't<C-f>', ':TestFile<CR>')
map('n', 't<C-t>', ':TestSuite<CR>')
map('n', 't<C-l>', ':TestLast<CR>')
map('n', 't<C-g>', ':TestVisit<CR>')
-- for normal mode - the word under the cursor
map('n', '<Leader>di', '<Plug>VimspectorBalloonEval')
-- for visual mode, the visually selected text
map('x', '<Leader>di', '<Plug>VimspectorBalloonEval')
-- nmap <Leader>dd <Plug>Vimspector

-- Catkin make ros workspace
function _G.build_current_catkin_ws()
    path = vim.api.nvim_buf_get_name(0)
    print("Current path", path)
    pattern = '.*/catkin_ws/'
    catkin_ws_path = string.match(path, pattern)
    if (catkin_ws_path ~= nil) then
        command = string.format("!cd %s && catkin_make -DCMAKE_EXPORT_COMPILE_COMMANDS=1", catkin_ws_path)
        print('Running command ', command)
        -- local handle = io.popen(command)
        -- local result = handle:read("*a")
        -- handle:close()
        vim.api.nvim_command(command)
        return results
    end
    print.format('Unable to build workspace %s', catkin_ws_path)
    return false
end

vim.keymap.set('n', '<leader>bc', ':lua build_current_catkin_ws()<CR>', { silent = false })

map('t', '<ESC>', '<C-\\><C-n>')

function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<leader>h', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<leader>j', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<leader>k', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<leader>l', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
