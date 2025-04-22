-- ~/.config/nvim/lua/plugins/init.lua
return {
  -- Lazy itself
  { "folke/lazy.nvim", version = false },

  -- Colorschemes
  { "morhetz/gruvbox" },
  { "shaunsingh/solarized.nvim" },
  { "folke/tokyonight.nvim", branch = "main" },
  { "rebelot/kanagawa.nvim" },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup()
      vim.cmd("colorscheme rose-pine")
    end,
  },
  { "EdenEast/nightfox.nvim" },

  -- Telescope and Extensions
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "FeiyouG/command_center.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
  { "anuvyklack/hydra.nvim" },

  -- Notifications
  { "rcarriga/nvim-notify" },

  -- File Explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- TeX
  { "lervag/vimtex" },

  -- Statusline & Tabline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
  },
  {
    "kdheepak/tabline.nvim",
    dependencies = {
      "hoob3rt/lualine.nvim",
      "kyazdani42/nvim-web-devicons",
    },
  },

  -- Debugging & Testing
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"}, 
    commit = "bc81f8d3440aede116f821114547a476b082b319"
  },
  { "mfussenegger/nvim-dap-python" },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/nvim-nio",
    },
  },
  { "nvim-neotest/neotest-python" },

  -- Tpope
  { "tpope/vim-obsession" },
  { "tpope/vim-commentary" },
  { "tpope/vim-surround" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-repeat" },
  { "tpope/vim-unimpaired" },
  { "tpope/vim-rhubarb" },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter" },
  { "nvim-treesitter/playground" },
  { "nvim-treesitter/nvim-treesitter-context" },

  -- Visual Enhancements
  { "frazrepo/vim-rainbow" },
  { "kshenoy/vim-signature" },
  { "norcalli/nvim-colorizer.lua" },
  { "nvim-tree/nvim-web-devicons" },

  -- Illumination
  -- TODO: This breaks markdown files. Yet to find a workaround
  -- https://www.reddit.com/r/neovim/comments/1jybyxj/error_method_textdocumentdocumenthighlight_is_not/?rdt=53642
  -- { "RRethy/vim-illuminate" },

  -- Startup
  { "mhinz/vim-startify" },

  -- Markdown
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = { "markdown" },
    config = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  -- { "ellisonleao/glow.nvim" },

  -- Tools
  { "jiangmiao/auto-pairs" },
  { "Yggdroot/indentLine" },
  { "godlygeek/tabular" },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup()
    end,
  },
  { "mbbill/undotree" },

  -- LSP & Tools
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
  },
  { "mhartington/formatter.nvim" },
  { "mfussenegger/nvim-lint" },

  -- Completion
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/nvim-cmp" },
  { "SirVer/ultisnips" },

  -- Documentation
  {
    "kkoomen/vim-doge",
    build = ":call doge#install()",
  },

  -- Zen mode
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup()
    end,
  },

  -- Presentation
  { "sotte/presenting.vim" },

  -- Hex Editor
  { "RaafatTurki/hex.nvim" },

  -- CSV
  { "chrisbra/csv.vim" },

  -- Table tools
  { "dhruvasagar/vim-table-mode" },

  -- Markdown TOC
  { "mzlogin/vim-markdown-toc" },

  -- Fuzzy + Animation
  {
    "frankroeder/parrot.nvim",
    dependencies = {
      "ibhagwan/fzf-lua",
      "nvim-lua/plenary.nvim",
    },
  },
}

