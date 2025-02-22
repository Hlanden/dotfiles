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
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
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
map('n', '<Leader><', '5<C-W><,<CR>')
map('n', '<Leader>>', '5<C-W>>,<CR>')
map('n', '<Leader>+', '5<C-W>+,<CR>')
map('n', '<Leader>-', '5<C-W>-,<CR>')

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
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>fc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fq', builtin.quickfix, {})
vim.keymap.set('n', '<leader>fr', builtin.registers, {})
vim.keymap.set('n', '<leader>fm', builtin.marks, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n', 'gd', builtin.lsp_definitions)
vim.keymap.set('n', 'gr', builtin.lsp_references)
vim.keymap.set('n', 'gi', builtin.lsp_implementations)
vim.keymap.set('n', 'gt', builtin.lsp_type_definitions)
vim.keymap.set('n', 'gs', builtin.lsp_document_symbols)
vim.keymap.set('n', 'gS', builtin.lsp_workspace_symbols)

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


-- Clangd
map('n', '<leader><leader>h', "<C-w>v<leader>l :ClangdSwitchSourceHeader<CR>")

-- UndoTree
map('n', '<leader>u', ":UndotreeToggle<CR>")

-- ChatGPT
map('n', '<leader>cc', ":ChatGPT<CR>")
map('v', '<leader>cc', ":ChatGPTEditWithInstructions<CR>")


-- Command center
require("telescope").load_extension("commander")

local commander = require("commander")
local noremap = {noremap = true}

commander.add({
    {
        desc = "Open command center",
        cmd = "<CMD>Telescope commander<CR>",
        keys = {
            {"n", "<leader>fc", noremap},
            {"v", "<leader>fc", noremap},
        }
    },

    -- Pane navigation
    {
        desc = "Navigate to pane below",
        cmd = "<CMD>wincmd j<CR>",
        keys = {
            {"n", "<leader>j", noremap},
        }
    },
    {
        desc = "Navigate to pane above",
        cmd = "<CMD>wincmd k<CR>",
        keys = {
            {"n", "<leader>k", noremap},
        }
    },
    {
        desc = "Navigate to pane left",
        cmd = "<CMD>wincmd h<CR>",
        keys = {
            {"n", "<leader>h", noremap},
        }
    },
    {
        desc = "Navigate to pane right",
        cmd = "<CMD>wincmd l<CR>",
        keys = {
            {"n", "<leader>l", noremap},
        }
    },

    -- Telescope stuff
    {
        desc = "Find files",
        cmd = "<CMD>Telescope find_files<CR>",
        keys = {"n", "<leader>ff", noremap}
    },
    {
        desc = "Find hidden files",
        cmd = "<CMD>Telescope find_files hidden=true<CR>",
        keys = {"n", "<leader>fhf", noremap}
    },
    {
        desc = "Search inside all files",
        cmd = "<CMD>Telescope live_grep<CR>",
        keys = {"n", "<leader>fg", noremap}
    },
    {
        desc = "Search (grep) current word in all files",
        cmd = "<CMD>Telescope grep_string<CR>",
        keys = {"n", "<leader>faw", noremap},
    },
    {
        desc  = "Search inside current buffer",
        cmd = "<CMD>Telescope current_buffer_fuzzy_find<CR>",
        keys = { "n", "<leader>fl", noremap },
    },
    {
        desc = "Search in all vim-commands",
        cmd = "<CMD>Telescope commands<CR>",
        keys = { "n", "<leader>f:", noremap },
    },
    {
        desc = "Search in vim-command-history",
        cmd = "<CMD>Telescope command_history<CR>",
        keys = { "n", "<leader>fh:", noremap },
    },
    {
        desc = "Telescope LSP definitions",
        cmd = "<CMD>Telescope lsp_definitions<CR>",
        keys = { "n", "gd", noremap },
    },
    {
        desc = "Telescope LSP references",
        cmd = "<CMD>Telescope lsp_references<CR>",
        keys = { "n", "gr", noremap},
    },
    {
        desc = "Telescope LSP implmentations",
        cmd = "<CMD>Telescope lsp_implementations<CR>",
        keys = {"n", "gi", noremap},
    },
    {
        desc = "Telescope document symbols",
        cmd = "<CMD>Telescope lsp_document_symbols<CR>",
        keys = {"n", "gs", noremap},
    },
    {
        desc = "Telescope workspace symbols",
        cmd = "<CMD>Telescope lsp_workspace_symbols<CR>",
        keys = {"n", "gS", noremap},
    },
    {
        desc = "Toggle term",
        cmd = "<CMD>ToggleTerm<CR>",
        keys = { "n" , "<leader>tt", noremap },
    },

    -- Keys to resize the window size. This calls Hydra to make resizing easier
    {
        desc = "Resize (increase) buffer height",
        cmd = "zk",
        keys = { "n", "zk", noremap },
    },
    {
        desc = "Show DAP UI",
        cmd = "",
        keys = { "n", "<leader>dv", noremap },
    },

    {
        desc = "DAP continue",
        cmd = "<CMD>lua require('dap').continue()<CR>",
        keys = { "n", "<F5>", noremap },
    },

    {
        desc = "Toggle zen mode",
        cmd = "<CMD>lua require('zen-mode').toggle()<CR>",
        keys = { "n" , "<leader>zz", noremap },
    },
    -- DAP (debugging)
    { 
        desc = "DAP UI open",
        cmd = "<CMD>lua require('dapui').toggle()<CR>", 
        keys = {"n", "<F1>", noremap}
    }, 
    { 
        desc = "DAP UI Toggle View 1",
        cmd = "<CMD>lua require('dapui').toggle()<CR>", 
        keys = {"n", "<leader>1", noremap}
    }, 
    { 
        desc = "DAP UI Toggle View 2",
        cmd = "<CMD>lua require('dapui').toggle()<CR>", 
        keys = {"n", "<leader>2", noremap}
    }, 
    { 
        desc = "DAP continue",
        cmd = "<CMD>lua require('dap').continue()<CR>", 
        keys = {"n", "<F5>", noremap}
    }, 
    {
        desc = "DAP Step Over", 
        cmd = "<CMD>lua require('dap').step_over()<CR>",
        keys = {'n','<F10>', noremap}
    },
    {
        desc = "DAP Step Into", 
        cmd = "<CMD>lua require('dap').step_into()<CR>",
        keys = {'n','<F11>', noremap}
    },
    {
        desc = "DAP Step out", 
        cmd = "<CMD>lua require('dap').step_out()<CR>",
        keys = {'n','<F12>', noremap}
    },
    {
        desc = "DAP Toggle Breakpoint", 
        cmd = "<CMD>lua require('dap').toggle_breakpoint()<CR>",
        keys = {'n','<leader>b', noremap}
    },
    {
        desc = "DAP Toggle Breakpoint w. condition", 
        cmd = "<CMD>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
        keys = {'n','<leader>B', noremap}
    },  
    { 
        desc = "DAP Toggle Breakpoint w. log point message", 
        cmd = "<CMD>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
        keys = {'n','<leader>lp', noremap}
    }, 
    { 
        desc = "DAP Repl Open", 
        cmd = "<CMD>lua require('dap').repl.open()<CR>",
        keys = {'n','<leader>dr', noremap}
    }, 
    { 
        desc = "DAP run last", 
        cmd = "<CMD>lua require('dap').run_last()<CR>",
        keys = {'n','<leader>dl', noremap}
    }
})

-- Window resizer with hydra
-- local Hydra = require('hydra')
-- Hydra({
--     name = 'Resizer',
--     mode = 'n',
--     body = 'z',
--     heads = {
--         { 'k', '<CMD>:res +1<CR>' , {desc = "" }},
--         { 'j', '<CMD>:res -1<CR>' , {desc = "" }},
--         { 'h', '<CMD>:vertical resize -1<CR>', {desc = "" }},
--         { 'l', '<CMD>:vertical resize +1<CR>', {desc = "" }},
--     }
-- })

-- local dap = require('dap')
-- Hydra({
--     name = "Debugger",
--     mode = "n",
--     body = "<leader>d",
--     config = {
--         -- Using the 'pink' color is important! Wihout it DAP commands don't quite work
--         color="pink",
--         hint = {
--             type = "window",
--             border = "rounded"
--         }
--     },
--     heads = {
--         { 'C', dap.continue, silent=true, {desc = "Continue"}},
--         { 'B', "<CMD>lua require('dap').toggle_breakpoint()<CR>", {desc = "Toggle Breakpoint"}},
--         { 'J', "<CMD>lua require('dap').step_over()<CR>", {desc = "Over"}},
--         { 'L', "<CMD>lua require('dap').step_into()<CR>", {desc = "Into"}},
--         { 'e', "<CMD>lua require('dapui').eval()<CR>", exit=true, {desc = "Eval"}},
--         { 't', ":lua require('neotest').run.run({strategy = 'dap'})<CR>", {desc="Run nearest test with DAP"}},
--         { 's', ":lua require('neotest').summary.toggle()<CR>", {desc="Toggle test summary"}},
--         { 'v', "<CMD>lua require('dapui').toggle()<CR>", {desc = "Toggle View"}},
--         { '1', "<CMD>lua require('dapui').toggle(1)<CR>"},
--         { '2', "<CMD>lua require('dapui').toggle(2)<CR>"},
--         { 'j', "j" },
--         { 'k', "k" },
--     }
-- })
