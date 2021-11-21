:let cwd = getcwd()
source $XDG_CONFIG_HOME/nvim/Plugin/plug_config.vim
source $XDG_CONFIG_HOME/nvim/Plugin/treesitter.vim
source $XDG_CONFIG_HOME/nvim/Plugin/vim_test_config.vim
source $XDG_CONFIG_HOME/nvim/Plugin/cocvim_config.vim
source $XDG_CONFIG_HOME/nvim/Plugin/no_to_us_config.vim
source $XDG_CONFIG_HOME/nvim/Plugin/fzf_config.vim
source $XDG_CONFIG_HOME/nvim/Plugin/gruvbox_config.vim
source $XDG_CONFIG_HOME/nvim/Plugin/vim_config.vim
source $XDG_CONFIG_HOME/nvim/Plugin/ntree_config.vim
source $XDG_CONFIG_HOME/nvim/Plugin/rainbow_config.vim
source $XDG_CONFIG_HOME/nvim/Plugin/vim_airline.vim
source $XDG_CONFIG_HOME/nvim/Plugin/vimspector.vim
source $XDG_CONFIG_HOME/nvim/Plugin/vimtex.vim
source $XDG_CONFIG_HOME/nvim/Plugin/ultisnippets.vim

if has('win32')
	let g:python3_host_prog='C:/Python310/python.exe'
endif

" setlocal spell
" set spelllang=en_us

:let maplocalleader = "\\"

nnoremap <silent> <leader>ev :execute 'edit' resolve($MYVIMRC)<cr>
nnoremap <silent> <leader>xv :source $MYVIMRC<cr>
nnoremap <leader>ez :edit ~/.zshrc<cr>
"
"   NORWEGIAN KEYBOARD MODS
"

"NORMAL
nnoremap ø (
nnoremap æ )
nnoremap Ø {
nnoremap Æ }
nnoremap å 0
nnoremap Å $

" nnoremap <A-æ> æ
" nnoremap <A-ø> ø
" nnoremap <A-Æ> Æ
" nnoremap <A-Ø> Ø

"VISUAL
vnoremap ø (
vnoremap æ )
vnoremap Ø {
vnoremap Æ }
vnoremap å \
vnoremap Å `

" vnoremap <A-æ> æ
" vnoremap <A-ø> ø
" vnoremap <A-Æ> Æ
" vnoremap <A-Ø> Ø
"REPLACE
lnoremap ø (
lnoremap æ )
lnoremap Ø [ 
lnoremap Æ ]
lnoremap å \
lnoremap Å `

"INSERT
inoremap ø (
inoremap æ )
inoremap Ø [
inoremap Æ ]
inoremap <A-Æ> }
inoremap <A-Ø> {
inoremap å \
inoremap Å `

" inoremap <A-e> æ
" inoremap <A-o> ø
" inoremap <A-E> Æ
" inoremap <A-O> Ø
" inoremap <A-a> å
" inoremap <A-A> Å

" inoremap <C-æ> æ
" inoremap <C-ø> ø
" inoremap <C-Æ> Æ
" inoremap <C-Ø> Ø
