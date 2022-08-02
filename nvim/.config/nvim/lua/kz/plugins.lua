-- Auto source when there are changes in plugins.lua
local group = vim.api.nvim_create_augroup('PackerGroup', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = 'plugins.lua',
  command = 'source <afile> | PackerCompile profile=true',
  group = group,
})

require('packer').startup({
  function(use)
    -- Packer
    use({ 'wbthomason/packer.nvim' })

    -- Profiling
    use({
      'dstein64/vim-startuptime',
      config = function()
        vim.keymap.set('n', '<space>st', ':StartupTime<cr>', { noremap = true })
      end,
    })

    -- Notification
    use({
      'rcarriga/nvim-notify',
      config = function()
        require('notify').setup({
          stages = 'slide',
          timeout = 500,
        })
        vim.notify = require('notify')
      end,
    })

    -- Lua docs
    use({
      { 'milisims/nvim-luaref' },
      { 'nanotee/luv-vimdocs' },
    })

    -- LSP
    use({
      'williamboman/mason.nvim',
      requires = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },
        { 'williamboman/mason-lspconfig.nvim' },

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'f3fora/cmp-spell' },
        { 'hrsh7th/cmp-vsnip' },
        { 'hrsh7th/vim-vsnip' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-nvim-lua' },

        -- Snippets
        { 'rafamadriz/friendly-snippets' },
      },
      config = function()
        -- Configuring LSP
        require('kz.lsp.mason')

        -- Configuring Autocompletion
        require('kz.lsp.cmp')
      end,
    })

    -- plenary.nvim
    use({
      'nvim-lua/plenary.nvim',
      config = function()
        vim.keymap.set('n', '<space>t', '<Plug>PlenaryTestFile', { noremap = true })
      end,
    })

    use({
      'jose-elias-alvarez/null-ls.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('.kz.plugins.null-ls')
      end,
    })

    --- Nvim tree
    use({
      'kyazdani42/nvim-tree.lua',
      requires = { 'kyazdani42/nvim-web-devicons', '~/GitHub/projekt0n/circles.nvim' },
      config = function()
        require('kz.plugins.nvimtree')
      end,
    })

    -- Search
    use({
      'nvim-telescope/telescope.nvim',
      branch = '0.1.x',
      requires = {
        { 'nvim-lua/popup.nvim' },
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      },
      event = 'VimEnter',
      config = function()
        require('kz.plugins.telescope')
      end,
    })

    -- Flutter LSP tools
    -- use({
    --   {
    --     'akinsho/flutter-tools.nvim',
    --     ft = { 'dart' },
    --     after = 'telescope.nvim',
    --     requires = 'nvim-lua/plenary.nvim',
    --     config = function()
    --       require('lsp.tools.flutter')
    --     end,
    --   },
    --
    --   { 'dart-lang/dart-vim-plugin' },
    --
    --   { 'Neevash/awesome-flutter-snippets', event = 'InsertCharPre' },
    -- })

    -- Treesitter
    use({
      { 'nvim-treesitter/nvim-treesitter' },

      {
        'nvim-treesitter/playground',
        require = { 'nvim-treesitter/nvim-treesitter' },
        run = ':TSUpdate',
        config = function()
          require('kz.plugins.nvim-treesitter')
        end,
      },

      -- spell checker
      {
        'lewis6991/spellsitter.nvim',
        require = { 'nvim-treesitter/nvim-treesitter' },
        commit = '9a79ce2',
        config = function()
          require('spellsitter').setup()
        end,
      },

      -- autotag
      {
        'windwp/nvim-ts-autotag',
        require = { 'nvim-treesitter/nvim-treesitter' },
      },

      -- autopairs
      {
        'windwp/nvim-autopairs',
        require = {
          { 'nvim-treesitter/nvim-treesitter' },
          { 'hrsh7th/nvim-cmp' },
        },
        config = function()
          require('kz.plugins.autopairs')
        end,
      },
    })

    -- Git
    use({
      {
        'tpope/vim-fugitive',
        config = function()
          require('kz.plugins.fugitive')
        end,
      },

      {
        'lewis6991/gitsigns.nvim',
        event = 'BufRead',
        config = function()
          require('kz.plugins.gitsigns')
        end,
      },
    })

    -- Lualine
    use({
      'nvim-lualine/lualine.nvim',
      config = function()
        -- require('lualine').setup({ options = { theme = 'auto' } })
      end,
    })

    -- ColorScheme
    use({
      { 'rktjmp/lush.nvim' },

      {
        '~/GitHub/projekt0n/github-nvim-theme',
        config = function()
          -- require('kz.themes.github')
        end,
      },

      {
        '~/GitHub/projekt0n/caret.nvim',
        config = function()
          require('kz.themes.caret')
        end,
      },

      {
        'ellisonleao/gruvbox.nvim',
        config = function()
          -- require('kz.themes.gruvbox')
        end,
      },
    })

    -- Markdown previewer
    use({
      'iamcco/markdown-preview.nvim',
      run = 'cd app && npm install',
      setup = function()
        vim.g.mkdp_filetypes = { 'markdown' }
      end,
      ft = { 'markdown' },
    })

    -- Surround
    use({
      'kylechui/nvim-surround',
      config = function()
        require('kz.plugins.nvim-surround')
      end,
    })

    -- Colorizer
    use({ 'lilydjwg/colorizer' })

    -- Comment
    use({
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end,
    })
  end,

  config = {
    profile = { enable = true },
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'rounded' })
      end,
      working_sym = '',
      error_sym = '',
      done_sym = '',
      removed_sym = '',
      moved_sym = '',
      prompt_border = 'rounded',
      keybindings = {
        quit = 'q',
        toggle_info = '<cr>',
        diff = '=',
        prompt_revert = 'r',
      },
    },
  },
})
