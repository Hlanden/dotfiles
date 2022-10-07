call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', {'do': { -> fzf#install()} }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'lervag/vimtex'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'puremourning/vimspector'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'frazrepo/vim-rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'kshenoy/vim-signature'
Plug 'Yggdroot/indentLine'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'godlygeek/tabular'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'shaunsingh/solarized.nvim'
Plug 'https://gitlab.com/yorickpeterse/vim-paper.git'
Plug 'norcalli/nvim-colorizer.lua'
call plug#end()
