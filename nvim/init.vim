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
source $XDG_CONFIG_HOME/nvim/Plugin/vim_config.vim
source $XDG_CONFIG_HOME/nvim/Plugin/ntree_config.vim
source $XDG_CONFIG_HOME/nvim/Plugin/rainbow_config.vim
source $XDG_CONFIG_HOME/nvim/Plugin/vim_airline.vim
source $XDG_CONFIG_HOME/nvim/Plugin/vimspector.vim
source $XDG_CONFIG_HOME/nvim/Plugin/vimtex.vim
source $XDG_CONFIG_HOME/nvim/Plugin/ultisnippets.vim

" source ~/.vim/plugged/vim-unimpaired/plugin/unimpaired.vim

if has('win32')
	let g:python3_host_prog='C:/Python310/python.exe'
endif

" setlocal spell
set spelllang=en_us

" Map window movement
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

nnoremap <silent> <leader>ev :execute 'edit' resolve($MYVIMRC)<cr>
nnoremap <silent> <leader>xv :source $MYVIMRC<cr>
nnoremap <silent> <leader>es :CocCommand snippets.editSnippets<cr>

" nnoremap rp :!python3 %<cr>

" set smarttab
set linebreak

" Map mark-command to other key
nnoremap <leader>< `
