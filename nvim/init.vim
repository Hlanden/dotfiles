" Map leader to space
nnoremap <SPACE> <nop>
let mapleader = " "

:let cwd = getcwd()
source $XDG_CONFIG_HOME/nvim/Plugin/plug_config.vim
source $XDG_CONFIG_HOME/nvim/Plugin/treesitter.vim
source $XDG_CONFIG_HOME/nvim/Plugin/vim_test_config.vim
source $XDG_CONFIG_HOME/nvim/Plugin/cocvim_config.vim
source $XDG_CONFIG_HOME/nvim/Plugin/fzf_config.vim
source $XDG_CONFIG_HOME/nvim/Plugin/gruvbox_config.vim
" source $XDG_CONFIG_HOME/nvim/Plugin/vim_config.vim
source $XDG_CONFIG_HOME/nvim/Plugin/ntree_config.vim
source $XDG_CONFIG_HOME/nvim/Plugin/rainbow_config.vim
source $XDG_CONFIG_HOME/nvim/Plugin/vim_airline.vim
source $XDG_CONFIG_HOME/nvim/Plugin/vimspector.vim
source $XDG_CONFIG_HOME/nvim/Plugin/vimtex.vim
source $XDG_CONFIG_HOME/nvim/Plugin/ultisnippets.vim

" source ~/.vim/plugged/vim-unimpaired/plugin/unimpaired.vim

if has('win32')
	let g:python3_host_prog='C:/Python310/python.exe' endif
endif

" setlocal spell
set spelllang=en_us

" Map window movement
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

nnoremap <silent> <leader>ev :execute 'edit' resolve($MYVIMRC)<cr>
nnoremap <silent> <leader>xv :source $MYVIMRC<CR>
nnoremap <silent> <leader>es :CocCommand snippets.editSnippets<CR>

" Highligthing and numbering
syntax on
set relativenumber
highlight LineNr ctermfg=cyan
set number
set tags=./tags;/
set linebreak

" Map mark-command to other key
nnoremap <leader>< `

" Movement in insert mode
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0

" Copy/paste/delete
xnoremap <leader>p "_dP
nnoremap <leader>p "+p
vnoremap <leader>p "+p

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
nnoremap Y y$

" Delete without saving to register
nnoremap <leader>d "_d
vnoremap <leader>d "_d

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48:2;%lu;%lu;%lum"
if &term == "alacritty"        
  let &term = "xterm-256color"
endif

let g:SignatureMarkTextHL = "DiagnosticError"

" KEY-BINDINGS:
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z 

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv
" inoremap <C-j> <esc>:m .+1<CR>==i
" inoremap <C-k> <esc>:m .-2<CR>==i
" nnoremap <leader>j :m .+1<CR>==
" nnoremap <leader>k :m .-2<CR>==

" Disable arrow keys
" Disable Arrow keys in Normal mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Make ctrl-c work as esc
inoremap <ESC> <C-C>

" Remap add because of tmux
nnoremap <C-j> <C-a>
