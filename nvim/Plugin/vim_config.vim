let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48:2;%lu;%lu;%lum"
if &term == "alacritty"        
  let &term = "xterm-256color"
endif

let g:SignatureMarkTextHL = "DiagnosticError"

set hlsearch
syntax on
set relativenumber
highlight LineNr ctermfg=cyan
set number
set tags=./tags;/

" KEY-BINDINGS:
nnoremap Y y$

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z 

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" vnoremap J :m '>+1<CR>gv=gv
" vnoremap K :m '>-2<CR>gv=gv
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
