--call plug#begin('~/.vim/plugged')
--call plug#end()
--
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Colorthemes
  use {'morhetz/gruvbox'}
  use {'shaunsingh/solarized.nvim'}
  use {'folke/tokyonight.nvim', branch = 'main'}
  use { "rebelot/kanagawa.nvim"}

  -- Fuzzyfinder
  use {'junegunn/fzf', run = ":call fzf#install()"}
  use {'junegunn/fzf.vim'}
  use {'preservim/nerdtree'}
  use {'mhinz/vim-startify'}
  use {'lervag/vimtex'}
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
      'kdheepak/tabline.nvim',
      requires = { { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }
  }
  use {'puremourning/vimspector'}

  -- Tpope
  use {'tpope/vim-obsession'}
  use {'tpope/vim-commentary'}
  use {'tpope/vim-surround'}
  use {'tpope/vim-fugitive'}
  use {'tpope/vim-repeat'}
  use {'tpope/vim-unimpaired'}

  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'nvim-treesitter/playground'}
  use {'nvim-treesitter/nvim-treesitter-context'}

  -- Completion
  use { 'neovim/nvim-lspconfig' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/nvim-cmp' }
  use {'SirVer/ultisnips'}
  use { 'quangnguyen30192/cmp-nvim-ultisnips' }

  -- Visual
  use {'frazrepo/vim-rainbow'}
  use {'kshenoy/vim-signature'} -- To see marks
  use {'norcalli/nvim-colorizer.lua'}

  -- Markdown
  -- use { 'iamcco/markdown-preview.nvim', ft = 'markdown', run = 'cd app && yarn install' }

  -- Tools
  use {'jiangmiao/auto-pairs'}
  use {'Yggdroot/indentLine'}
  use {'godlygeek/tabular'}

  -- Plugins can have post-install/update hooks

  -- Post-install/update hook with neovim command

  -- Inspiration for future expansion: 
  --
  -- Lazy loading:
  -- Load on specific commands
  -- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
  -- Load on an autocommand event
  -- use {'andymass/vim-matchup', event = 'VimEnter'}

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  --use {
  --  'w0rp/ale',
  --  ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
  --  cmd = 'ALEEnable',
  --  config = 'vim.cmd[[ALEEnable]]'
  --}
end)
