" Map leader to space
nnoremap <SPACE> <nop>
let mapleader = " "

:let cwd = getcwd()
source $XDG_CONFIG_HOME/nvim/Plugin/plug_config.vim
source $XDG_CONFIG_HOME/nvim/Plugin/treesitter.vim
source $XDG_CONFIG_HOME/nvim/Plugin/vim_test_config.vim
source $XDG_CONFIG_HOME/nvim/Plugin/cocvim_config.vim
source $XDG_CONFIG_HOME/nvim/Plugin/fzf_config.vim
" source $XDG_CONFIG_HOME/nvim/Plugin/vim_config.vim
source $XDG_CONFIG_HOME/nvim/Plugin/ntree_config.vim
source $XDG_CONFIG_HOME/nvim/Plugin/rainbow_config.vim
source $XDG_CONFIG_HOME/nvim/Plugin/vim_airline.vim
source $XDG_CONFIG_HOME/nvim/Plugin/vimspector.vim
source $XDG_CONFIG_HOME/nvim/Plugin/vimtex.vim
source $XDG_CONFIG_HOME/nvim/Plugin/ultisnippets.vim
source $XDG_CONFIG_HOME/nvim/Plugin/indent-line.vim
source $XDG_CONFIG_HOME/nvim/Plugin/markdown-preview.vim

" source ~/.vim/plugged/vim-unimpaired/plugin/unimpaired.vim
set termguicolors

" colorscheme gruvbox
let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

" Example config in Vim-Script
let g:solarized_italic_comments = v:true
let g:solarized_italic_keywords = v:true
let g:solarized_italic_functions = v:true
let g:solarized_italic_variables = v:false
let g:solarized_contrast = v:true
let g:solarized_borders = v:false
let g:solarized_disable_background = v:false

" Change the "hint" color to the "orange" color, and make the "error" color bright red
let g:tokyonight_colors = {
  \ 'hint': 'orange',
  \ 'error': '#ff0000',
\ }

" Load the colorscheme
autocmd BufEnter * colorscheme tokyonight
autocmd BufEnter * highlight CursorLineNR guifg=#ffcc00 ctermfg=yellow
autocmd BufEnter * highlight LineNr guifg=#1ac949 ctermfg=none
autocmd BufEnter * set bg=dark
autocmd BufEnter * AirlineTheme violet
autocmd BufEnter * ColorizerAttachToBuffer

autocmd BufEnter *.tex colorscheme gruvbox
autocmd BufEnter *.tex set bg=light
" autocmd BufEnter *.tex set bg=dark
autocmd BufEnter *.tex AirlineTheme solarized

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

nnoremap yp :let @" = expand("%") <cr>
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

if has('win32') || has('win64')
	let g:python3_host_prog='C:/Python310/python.exe'
	hi Normal guibg=NONE ctermbg=NONE
endif

nnoremap <silent> <Leader>- 5<C-W>< <CR>
nnoremap <silent> <Leader>+ 5<C-W>> <CR>
" nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>


" Search for visual selection
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Markdown preview
nmap <leader>mp <Plug>MarkdownPreview
nmap <leader>ms <Plug>MarkdownPreviewStop

" Python specifip
nmap <leader>rp :w <CR> :!python %<CR>

" Cpp and c
autocmd FileType c,cpp,h,hpp,objc map <buffer> = <Plug>(coc-format-selected)

" Python
autocmd FileType python set colorcolumn=82

