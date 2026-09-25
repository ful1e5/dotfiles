return {
  -- ==========================================
  -- 1. LSP & Mason Configuration
  -- ==========================================
  {
    "williamboman/mason.nvim",
    lazy = true,
    cmd = { "Mason", "MasonInstall", "MasonUpdate", "MasonLog" },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      pcall(require, "ful1e5.lsp.mason")
    end,
  },

  -- ==========================================
  -- 2. Autocompletion (Consolidated)
  -- ==========================================
  {
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = "InsertEnter",
    dependencies = {
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      -- Automatically handles calling your luasnip config internally if mapped there
      pcall(require, "ful1e5.configs.cmp")
    end,
  },

  -- ==========================================
  -- 3. Treesitter & Syntax Extensions
  -- ==========================================
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main", -- Native Neovim 0.12 engine compatibility
    lazy = false,
    dependencies = {
      "windwp/nvim-ts-autotag",
      "windwp/nvim-autopairs",
    },
    config = function()
      local ok, ts_file = pcall(require, "ful1e5.configs.nvim-treesitter")
      if ok and ts_file.setup then
        ts_file.setup()
      end
    end,
  },

  -- ==========================================
  -- 4. Fuzzy Finder & File Management
  -- ==========================================
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    cmd = "Telescope",
    -- Enforce key triggers so Lazy loads this module immediately when you hit them
    keys = {
      { "<C-p>",      desc = "Find Files" },
      { "<C-f>",      desc = "Live Grep" },
      { "<space>vrc", desc = "Vimrc files" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "prochri/telescope-all-recent.nvim",
      "xiyaowong/telescope-emoji.nvim",
    },
    config = function()
      pcall(function() require("telescope-all-recent").setup({}) end)
      pcall(require, "ful1e5.configs.telescope")
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    keys = {
      { "<C-b>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "projekt0n/circles.nvim",
    },
    config = function()
      pcall(require, "ful1e5.configs.nvim-tree")
    end,
  },

  -- ==========================================
  -- 5. Text Editing Enhancements
  -- ==========================================
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      pcall(require, "ful1e5.configs.nvim-surround")
    end,
  },
  {
    "numToStr/Comment.nvim",
    lazy = true,
    event = "BufReadPost",
    dependencies = { "folke/ts-comments.nvim" },
  },
  {
    "chrisgrieser/nvim-spider",
    lazy = true,
    keys = { "w", "e", "b", "ge" }, -- Core triggers for subword motion overrides
    config = function()
      pcall(require, "ful1e5.configs.nvim-spider")
    end,
  },
  { "lukas-reineke/indent-blankline.nvim", lazy = true, event = "BufReadPost" },

  -- ==========================================
  -- 6. Git Integration
  -- ==========================================
  {
    "tpope/vim-fugitive",
    lazy = true,
    cmd = { "G", "Git", "Gdiffsplit", "Gread", "Gwrite" },
    event = "BufReadPost",
    config = function()
      pcall(require, "ful1e5.configs.fugitive")
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = "BufReadPost",
    config = function()
      pcall(require, "ful1e5.configs.gitsigns")
    end,
  },

  -- ==========================================
  -- 7. UI & Terminal
  -- ==========================================
  {
    "rcarriga/nvim-notify",
    lazy = true,
    event = "VeryLazy",
    config = function()
      pcall(function()
        require("notify").setup({ stages = "slide", timeout = 500 })
        vim.notify = require("notify")
      end)
    end,
  },
  { "j-hui/fidget.nvim",                   lazy = true, event = "LspAttach" },
  { "nvim-lualine/lualine.nvim",           lazy = true, event = "VeryLazy" },
  { "akinsho/toggleterm.nvim",             lazy = true, event = "VeryLazy" },
  { "NvChad/nvim-colorizer.lua",           lazy = true, event = "BufReadPost" },

  -- ==========================================
  -- 8. Document Formats
  -- ==========================================
  { "cloudysake/asciitree.nvim",           lazy = true, cmd = "AsciiTree" },
  { "iamcco/markdown-preview.nvim",        lazy = true, ft = { "markdown" } },
  { "antonk52/markdowny.nvim",             lazy = true, ft = { "markdown", "txt" } },
  { "milisims/nvim-luaref",                lazy = true, ft = { "lua" } },
  { "nanotee/luv-vimdocs",                 lazy = true, ft = { "lua" } },

  -- ==========================================
  -- 9. Primary Colorscheme
  -- ==========================================
  {
    dir = "/home/ful1e5/GitHub/projekt0n/caret.nvim",
    name = "caret.nvim",
    lazy = false,
    priority = 1000, -- Guarantees layout loads instantly on launch
    config = function()
      pcall(require, "ful1e5.themes.caret")
    end,
  },

  -- ==========================================
  -- 10. Core Utilities
  -- ==========================================
  { "tweekmonster/startuptime.vim", lazy = true, cmd = "StartupTime" },
  { "nvim-lua/popup.nvim",          lazy = true },
  { "kkharji/sqlite.lua",           lazy = true },
}
