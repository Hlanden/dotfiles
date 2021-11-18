source $HOME/.config/nvim/Plugin/plug_config.vim
source $HOME/.config/nvim/Plugin/treesitter.vim
source $HOME/.config/nvim/Plugin/vim_test_config.vim
source $HOME/.config/nvim/Plugin/cocvim_config.vim
source $HOME/.config/nvim/Plugin/no_to_us_config.vim
source $HOME/.config/nvim/Plugin/fzf_config.vim
source $HOME/.config/nvim/Plugin/gruvbox_config.vim
source $HOME/.config/nvim/Plugin/vim_config.vim
source $HOME/.config/nvim/Plugin/ntree_config.vim
source $HOME/.config/nvim/Plugin/rainbow_config.vim
source $HOME/.config/nvim/Plugin/vim_airline.vim
source $HOME/.config/nvim/Plugin/vimspector.vim
source $HOME/.config/nvim/Plugin/vimtex.vim

setlocal spell
set spelllang=en_us

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
