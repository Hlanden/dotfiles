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
    use { 'morhetz/gruvbox' }
    use { 'shaunsingh/solarized.nvim' }
    use { 'folke/tokyonight.nvim', branch = 'main' }
    use { "rebelot/kanagawa.nvim" }
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            require("rose-pine").setup()
            vim.cmd('colorscheme rose-pine')
        end
    })
    use({ 'EdenEast/nightfox.nvim', })

    -- Fuzzyfinder
    -- use {
    --     'ojroques/nvim-lspfuzzy',
    --     requires = {
    --         { 'junegunn/fzf' },
    --         { 'junegunn/fzf.vim' }, -- to enable preview (optional)
    --     },
    -- }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Tools/telescope
    use {
        "FeiyouG/command_center.nvim",
        requires = { "nvim-telescope/telescope.nvim" }
    }
    use { 'anuvyklack/hydra.nvim' }

    -- Notifications
    use { 'rcarriga/nvim-notify' }

    -- File explorer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
    }
    
    use { 'lervag/vimtex' }

    -- Statusline and tabline
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        'kdheepak/tabline.nvim',
        requires = { { 'hoob3rt/lualine.nvim', opt = true }, { 'kyazdani42/nvim-web-devicons', opt = true } }
    }

    -- Debuggers
    -- use { 'puremourning/vimspector' }
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use { 'mfussenegger/nvim-dap-python' }
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-neotest/nvim-nio"
        }
    }
    use {'nvim-neotest/neotest-python'}

    -- Tpope
    use { 'tpope/vim-obsession' }
    use { 'tpope/vim-commentary' }
    use { 'tpope/vim-surround' }
    use { 'tpope/vim-fugitive' }
    use { 'tpope/vim-repeat' }
    use { 'tpope/vim-unimpaired' }
    use { 'tpope/vim-rhubarb' }

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'nvim-treesitter/playground' }
    use { 'nvim-treesitter/nvim-treesitter-context' }

    -- Completion
    use { 'neovim/nvim-lspconfig' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline',
        commit = "23c51b2a3c00f6abc4e922dbd7c3b9aca6992063" }
    use { 'hrsh7th/nvim-cmp' }
    -- use { 'SirVer/ultisnips' }
    -- use { 'quangnguyen30192/cmp-nvim-ultisnips' }

    -- Visual
    use { 'frazrepo/vim-rainbow' }
    use { 'kshenoy/vim-signature' } -- To see marks
    use { 'norcalli/nvim-colorizer.lua' }
    use { 'nvim-tree/nvim-web-devicons' }

    -- Illuminate
    use { 'RRethy/vim-illuminate' }

    -- Startup
    use { 'mhinz/vim-startify' }

    -- Markdown
    -- -- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    -- use {"ellisonleao/glow.nvim"}

    -- Tools
    use { 'jiangmiao/auto-pairs' }
    use { 'Yggdroot/indentLine' }
    use { 'godlygeek/tabular' }

    -- Mason: Manage LSP, DAP, linters and formatters
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }

    -- Toggle term
    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end }

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

    -- Undotree
    use { "mbbill/undotree" }

    -- Formatters
    use { 'mhartington/formatter.nvim' }

    -- linters
    use { 'mfussenegger/nvim-lint' }

    -- ChatGPT
    use({
        "jackMort/ChatGPT.nvim",
        config = function()
            require("chatgpt").setup({
                -- optional configuration
            })
        end,
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    })


    -- Documentation
    use {
        'kkoomen/vim-doge',
        run = ':call doge#install()'
    }

    -- Zen mode
    use {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- Presentation
    use { "sotte/presenting.vim" }

    -- Hex editor
    use { "RaafatTurki/hex.nvim" }

    -- use { 'subnut/nvim-ghost.nvim' }
    --
    use { 'chrisbra/csv.vim' }

    use { "dhruvasagar/vim-table-mode" }

    use { "mzlogin/vim-markdown-toc" }

    use { "akinsho/flutter-tools.nvim" }

end)
