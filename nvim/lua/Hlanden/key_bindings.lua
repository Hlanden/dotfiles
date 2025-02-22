local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

-- Fix * (Keep the cursor position, don't move to next match)
map("n", "*", "*N")

-- Move line up and down in NORMAL and VISUAL modes
map("n", "<C-j>", "<CMD>move .+1<CR>")
map("n", "<C-k>", "<CMD>move .-2<CR>")
map("x", "<C-j>", ":move '>+1<CR>gv=gv")
map("x", "<C-k>", ":move '<-2<CR>gv=gv")

-- Window movement
map("n", "<leader>j", ":wincmd j<CR>")
map("n", "<leader>h", ":wincmd h<CR>")
map("n", "<leader>k", ":wincmd k<CR>")
map("n", "<leader>l", ":wincmd l<CR>")

-- Vimrc
map("n", "<leader>ev", ":execute 'edit' resolve($MYVIMRC)<cr>")
map("n", "<leader>xv", "<cmd>lua ReloadConfig()<CR>")

-- Movement in insert mode
map("i", "<C-e>", "<C-o>$")
map("i", "<C-a>", "<C-o>0")

-- Copy/paste/delete
map("x", "<leader>p", '"_dP')
map("n", "<leader>p", '"+p')
map("v", "<leader>p", '"+p')

map("n", "yp", ':let @+ = expand("%:p")<CR>')
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>Y", 'gg"+yG')
map("n", "Y", "y$")

-- Delete without saving to register
map("n", "<leader>d", '"_d')
map("v", "<leader>d", '"_d')

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z,")

map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", "!", "!<c-g>u")
map("i", "?", "?<c-g>u")

map("v", "J", ":m,'>+1<CR>gv=gv")
map("v", "K", ":m,'>-2<CR>gv=gv")

-- Make ctrl-c work as esc
map("i", "<ESC>", "<C-C>")

-- Remap add because of tmux
map("n", "<C-a><C-a>", "<C-a>")

-- Window sizing
map("n", "<Leader><", "5<C-W><,<CR>")
map("n", "<Leader>>", "5<C-W>>,<CR>")
map("n", "<Leader>+", "5<C-W>+,<CR>")
map("n", "<Leader>-", "5<C-W>-,<CR>")

-- Markdown preview
map("n", "<leader>mp", "<Plug>MarkdownPreview")

-- Python specifip
map("n", "<leader>rp", ":w,<CR>,:!python,%<CR>")

-- NeoTree file explorer
map("n", "<leader>nn", ":NvimTreeToggle<CR>")
map("n", "<leader>nf", ":NvimTreeFindFile<CR>")
map("n", "<leader>nc", ":NvimTreeCollapse<CR>")

-- Terminal key bindings
map("t", "<ESC>", "<C-\\><C-n>")
function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<leader>h", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<leader>j", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<leader>k", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<leader>l", [[<Cmd>wincmd l<CR>]], opts)
end
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- UndoTree
map("n", "<leader>u", ":UndotreeToggle<CR>")

-- Command center
local commander = require("commander")
require("telescope").load_extension("commander")

local noremap = { noremap = true }

commander.add({
	{
		desc = "Open command center",
		cmd = "<CMD>Telescope commander<CR>",
		keys = {
			{ "n", "<leader>fc", noremap },
			{ "v", "<leader>fc", noremap },
		},
	},

	-- MISC START
	{
		desc = "Navigate to pane below",
		cmd = "<CMD>wincmd j<CR>",
		keys = {
			{ "n", "<leader>j", noremap },
		},
	},
	{
		desc = "Navigate to pane above",
		cmd = "<CMD>wincmd k<CR>",
			{ "n", "<leader>k", noremap },
		keys = {
		},
	},
	{
		desc = "Navigate to pane left",
		cmd = "<CMD>wincmd h<CR>",
		keys = {
			{ "n", "<leader>h", noremap },
		},
	},
	{
		desc = "Navigate to pane right",
		cmd = "<CMD>wincmd l<CR>",
		keys = {
			{ "n", "<leader>l", noremap },
		},
	},
	{
		desc = "Toggle term",
		cmd = "<CMD>ToggleTerm<CR>",
		keys = { "n", "<leader>tt", noremap },
	},
	{
		desc = "Toggle zen mode",
		cmd = "<CMD>lua require('zen-mode').toggle()<CR>",
		keys = { "n", "<leader>zz", noremap },
	},
	-- MISC END
	-- TELESCOPE START
	{
		desc = "Telescope: Find files",
		cmd = "<CMD>Telescope find_files<CR>",
		keys = { "n", "<leader>ff", noremap },
	},
	{
		desc = "Telescope: Search inside all files",
		cmd = "<CMD>Telescope live_grep<CR>",
		keys = { "n", "<leader>fg", noremap },
	},
	{
		desc = "Telescope: List buffers",
		cmd = "<CMD>Telescope buffers<CR>",
		keys = { "n", "<leader>fb", noremap },
	},
	{
		desc = "Telescope: Search quickfix list",
		cmd = "<CMD>Telescope quickfix<CR>",
		keys = { "n", "<leader>fq", noremap },
	},
	{
		desc = "Telescope: Search registers",
		cmd = "<CMD>Telescope registers<CR>",
		keys = { "n", "<leader>fr", noremap },
	},
	{
		desc = "Telescope: Search marks",
		cmd = "<CMD>Telescope marks<CR>",
		keys = { "n", "<leader>fm", noremap },
	},
	{
		desc = "Telescope: Search help tags",
		cmd = "<CMD>Telescope help_tags<CR>",
		keys = { "n", "<leader>fh", noremap },
	},
	{
		desc = "Telescope: Find hidden files",
		cmd = "<CMD>Telescope find_files hidden=true<CR>",
		keys = { "n", "<leader>fhf", noremap },
	},
	{
		desc = "Telescope: Search current word in all files",
		cmd = "<CMD>Telescope grep_string<CR>",
		keys = { "n", "<leader>faw", noremap },
	},
	{
		desc = "Telescope: Search inside current buffer",
		cmd = "<CMD>Telescope current_buffer_fuzzy_find<CR>",
		keys = { "n", "<leader>fl", noremap },
	},
	{
		desc = "Telescope: Search vim commands",
		cmd = "<CMD>Telescope commands<CR>",
		keys = { "n", "<leader>f:", noremap },
	},
	{
		desc = "Telescope: Search command history",
		cmd = "<CMD>Telescope command_history<CR>",
		keys = { "n", "<leader>fh:", noremap },
	},
	{
		desc = "Telescope: Git commits",
		cmd = "<CMD>Telescope git_commits<CR>",
		keys = { "n", "<leader>gc", noremap },
	},
	{
		desc = "Telescope: Git buffer commits",
		cmd = "<CMD>Telescope git_bcommits<CR>",
		keys = { "n", "<leader>gbc", noremap },
	},
	{
		desc = "Telescope: Git branches",
		cmd = "<CMD>Telescope git_branches<CR>",
		keys = { "n", "<leader>gb", noremap },
	},
	{
		desc = "Telescope: Git status",
		cmd = "<CMD>Telescope git_status<CR>",
		keys = { "n", "<leader>gs", noremap },
	},
	{
		desc = "Telescope: Git stash",
		cmd = "<CMD>Telescope git_stash<CR>",
		keys = { "n", "<leader>gst", noremap },
	},

	-- TELESCOPE END
	-- LSP START
	{
		desc = "LSP: Definitions",
		cmd = "<CMD>Telescope lsp_definitions<CR>",
		keys = { "n", "gd", noremap },
	},
	{
		desc = "LSP: References",
		cmd = "<CMD>Telescope lsp_references<CR>",
		keys = { "n", "gr", noremap },
	},
	{
		desc = "LSP: Implementations",
		cmd = "<CMD>Telescope lsp_implementations<CR>",
		keys = { "n", "gi", noremap },
	},
	{
		desc = "LSP: Document symbols",
		cmd = "<CMD>Telescope lsp_document_symbols<CR>",
		keys = { "n", "gs", noremap },
	},
	{
		desc = "LSP: Workspace symbols",
		cmd = "<CMD>Telescope lsp_workspace_symbols<CR>",
		keys = { "n", "gS", noremap },
	},
	{
		desc = "LSP: Open float diagnostic",
		cmd = "<CMD>Telescope lsp_diagnostics<CR>",
		keys = { "n", "<leader>e", noremap },
	},
	{
		desc = "LSP: Go to previous diagnostic",
		cmd = vim.diagnostic.goto_prev,
		keys = { "n", "[g", noremap },
	},
	{
		desc = "LSP: Go to next diagnostic",
		cmd = vim.diagnostic.goto_next,
		keys = { "n", "]g", noremap },
	},
	{
		desc = "LSP: Add diagnostics to location list",
		cmd = vim.diagnostic.setloclist,
		keys = { "n", "<leader>q", noremap },
	},
	{
		desc = "LSP: Go to declaration",
		cmd = vim.lsp.buf.declaration,
		keys = { "n", "gD", noremap },
	},
	{
		desc = "LSP: Show hover information",
		cmd = vim.lsp.buf.hover,
		keys = { "n", "K", noremap },
	},
	{
		desc = "LSP: Show signature help",
		cmd = vim.lsp.buf.signature_help,
		keys = { "n", "gs", noremap },
	},
	{
		desc = "LSP: Add workspace folder",
		cmd = vim.lsp.buf.add_workspace_folder,
		keys = { "n", "<leader>wa", noremap },
	},
	{
		desc = "LSP: Remove workspace folder",
		cmd = vim.lsp.buf.remove_workspace_folder,
		keys = { "n", "<leader>wr", noremap },
	},
	{
		desc = "LSP: List workspace folders",
		cmd = function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end,
		keys = { "n", "<leader>wl", noremap },
	},
	{
		desc = "LSP: Rename symbol",
		cmd = vim.lsp.buf.rename,
		keys = { "n", "<leader>rn", noremap },
	},
	{
		desc = "LSP: Code action",
		cmd = vim.lsp.buf.code_action,
		keys = { "n", "<leader>ca", noremap },
	},
	{
		desc = "LSP: Format buffer",
		cmd = function()
			vim.lsp.buf.format({ async = true })
		end,
		keys = { "n", "<leader>=", noremap },
	},
	{
		desc = "LSP: Show incoming calls",
		cmd = vim.lsp.buf.incoming_calls,
		keys = { "n", "<leader>ci", noremap },
	},
	{
		desc = "LSP: Show outgoing calls",
		cmd = vim.lsp.buf.outgoing_calls,
		keys = { "n", "<leader>co", noremap },
	},
	{
		desc = "LSP: Show incoming calls",
		cmd = vim.lsp.codelens.run,
		keys = { "n", "<leader>cl", noremap },
	},
	-- LSP END
	-- DAP (debugging)
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
		desc = "DAP UI open",
		cmd = "<CMD>lua require('dapui').toggle()<CR>",
		keys = { "n", "<F1>", noremap },
	},
	{
		desc = "DAP UI Toggle View 1",
		cmd = "<CMD>lua require('dapui').toggle()<CR>",
		keys = { "n", "<leader>1", noremap },
	},
	{
		desc = "DAP UI Toggle View 2",
		cmd = "<CMD>lua require('dapui').toggle()<CR>",
		keys = { "n", "<leader>2", noremap },
	},
	{
		desc = "DAP continue",
		cmd = "<CMD>lua require('dap').continue()<CR>",
		keys = { "n", "<F5>", noremap },
	},
	{
		desc = "DAP Step Over",
		cmd = "<CMD>lua require('dap').step_over()<CR>",
		keys = { "n", "<F10>", noremap },
	},
	{
		desc = "DAP Step Into",
		cmd = "<CMD>lua require('dap').step_into()<CR>",
		keys = { "n", "<F11>", noremap },
	},
	{
		desc = "DAP Step out",
		cmd = "<CMD>lua require('dap').step_out()<CR>",
		keys = { "n", "<F12>", noremap },
	},
	{
		desc = "DAP Toggle Breakpoint",
		cmd = "<CMD>lua require('dap').toggle_breakpoint()<CR>",
		keys = { "n", "<leader>b", noremap },
	},
	{
		desc = "DAP Toggle Breakpoint w. condition",
		cmd = "<CMD>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
		keys = { "n", "<leader>B", noremap },
	},
	{
		desc = "DAP Toggle Breakpoint w. log point message",
		cmd = "<CMD>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
		keys = { "n", "<leader>lp", noremap },
	},
	{
		desc = "DAP Repl Open",
		cmd = "<CMD>lua require('dap').repl.open()<CR>",
		keys = { "n", "<leader>dr", noremap },
	},
	{
		desc = "DAP run last",
		cmd = "<CMD>lua require('dap').run_last()<CR>",
		keys = { "n", "<leader>dl", noremap },
	},
     {
        desc = "Test: Run nearest test",
        cmd = ":TestNearest<CR>",
        keys = {"n", "t<C-n>", noremap}
    },
    {
        desc = "Test: Run file tests",
        cmd = ":TestFile<CR>",
        keys = {"n", "t<C-f>", noremap}
    },
    {
        desc = "Test: Run test suite",
        cmd = ":TestSuite<CR>",
        keys = {"n", "t<C-t>", noremap}
    },
    {
        desc = "Test: Run last test",
        cmd = ":TestLast<CR>",
        keys = {"n", "t<C-l>", noremap}
    },
    {
        desc = "Test: Visit test file",
        cmd = ":TestVisit<CR>",
        keys = {"n", "t<C-g>", noremap}
    },
	-- DAP END
})
