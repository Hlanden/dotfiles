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
map('i','<C-e>','<C-o>$')
map('i','<C-a>','<C-o>0')

-- Copy/paste/delete
map('x','<leader>p','"_dP')
map('n','<leader>p','"+p')
map('v','<leader>p','"+p')

map('n','yp',':let,@",=,expand("%"),<cr>')
map('n','<leader>y','"+y')
map('v','<leader>y','"+y')
map('n','<leader>Y','gg"+yG')
map('n','Y','y$')

-- Delete without saving to register
map('n','<leader>d','"_d')
map('v','<leader>d','"_d')

-- KEY-BINDINGS:
map('n','n','nzzzv')
map('n','N','Nzzzv')
map('n','J','mzJ`z,')

map('i',',',',<c-g>u')
map('i','.','.<c-g>u')
map('i','!','!<c-g>u')
map('i','?','?<c-g>u')

map('v','J',":m,'>+1<CR>gv=gv")
map('v','K',":m,'>-2<CR>gv=gv")

-- Make ctrl-c work as esc
map('i','<ESC>','<C-C>')

-- Remap add because of tmux
map('n','<C-a>','<C-a><C-a>')

-- Window sizing
map('n','<Leader>-','5<C-W><,<CR>')
map('n','<Leader>+','5<C-W>>,<CR>')

-- Search for visual selection
-- TODO: This is invalid...
-- map('v','//','y/\V<C-R>=escape(@","/\")<CR><CR>')

-- Markdown preview
map('n','<leader>mp','<Plug>MarkdownPreview')
map('n','<leader>ms','<Plug>MarkdownPreviewStop')

-- Python specifip
map('n','<leader>rp',':w,<CR>,:!python,%<CR>')

-- FZF Fuzzyfinder
map('n','<leader>f',':Files<CR>')
map('n','<leader>t',':Ag<CR>')
map('n','<leader>b',':Buffer<CR>')
map('n','<leader>fm',':Marks<CR>')
map('n','<leader>fg',':Commits<CR>')
map('n','<leader>fw',':Windows<CR>')

-- Nerdtree
map('n','<leader>n',':NERDTreeFocus<CR>')
map('n','n<C-n>',':NERDTree<CR>')
map('n','n<C-t>',':NERDTreeToggle<CR>')
map('n','n<C-f>',':NERDTreeFind<CR>')

-- Debugger
-- TODO: Check the plugins below, do you need them?
map('n','t<C-n>',':TestNearest<CR>')
map('n','t<C-f>',':TestFile<CR>')
map('n','t<C-t>',':TestSuite<CR>')
map('n','t<C-l>',':TestLast<CR>')
map('n','t<C-g>',':TestVisit<CR>')
-- for normal mode - the word under the cursor
map('n','<Leader>di','<Plug>VimspectorBalloonEval')
-- for visual mode, the visually selected text
map('x','<Leader>di','<Plug>VimspectorBalloonEval')
-- nmap <Leader>dd <Plug>Vimspector


