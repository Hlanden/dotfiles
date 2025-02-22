vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
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


    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end }

    use { "mbbill/undotree" }

    -- LSP, formatter and linters
    use { 'neovim/nvim-lspconfig' }

    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }
    use { "WhoIsSethDaniel/mason-tool-installer.nvim", requires = { "williamboman/mason.nvim" }, }

    use { 'mhartington/formatter.nvim' }

    use { 'mfussenegger/nvim-lint' }

    -- Completion
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline',
        commit = "23c51b2a3c00f6abc4e922dbd7c3b9aca6992063" }
    use { 'hrsh7th/nvim-cmp' }

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

    use { 'chrisbra/csv.vim' }

    use { "dhruvasagar/vim-table-mode" }

    use { "mzlogin/vim-markdown-toc" }
end)
