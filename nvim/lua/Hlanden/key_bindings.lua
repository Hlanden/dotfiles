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
map("v", "<leader>j", "y<Esc>:wincmd j<CR>")
map("v", "<leader>h", "y<Esc>:wincmd h<CR>")
map("v", "<leader>k", "y<Esc>:wincmd k<CR>")
map("v", "<leader>l", "y<Esc>:wincmd l<CR>")

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

-- Remove default bindings
map("n", "q:", "<Nop>")
map("n", "q/", "<Nop>")
map("n", "q?", "<Nop>")

-- Tmux navigation
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<M-h>", "<cmd>silent !tmux neww tmux-sessionizer -s 0<CR>")

function toggle_quickfix()
	if vim.fn.empty(vim.fn.getqflist()) == 1 then
		print("Quickfix list is empty")
	else
		local is_open = vim.fn.getwininfo(vim.fn.getqflist({ winid = 0 }).winid)[1] ~= nil
		if is_open then
			vim.cmd("cclose")
		else
			vim.cmd("copen")
		end
	end
end
map("n", "<leader>q", toggle_quickfix)
function toggle_loclist()
	if vim.fn.empty(vim.fn.getloclist(0)) == 1 then
		print("Location list is empty")
	else
		local winid = vim.fn.getloclist(0, { winid = 0 }).winid
		local is_open = winid ~= 0 and vim.fn.getwininfo(winid)[1] ~= nil
		if is_open then
			vim.cmd("lclose")
		else
			vim.cmd("lopen")
		end
	end
end
map("n", "<leader>ll", toggle_loclist)
