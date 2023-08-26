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

    -- Cache
    use({
      'lewis6991/impatient.nvim',
      config = function()
        require('impatient')
      end,
    })

    -- Profiling
    use({
      'dstein64/vim-startuptime',
      setup = function()
        vim.keymap.set('n', '<space>st', vim.cmd.StartupTime)
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

    -- Nvim tree
    use({
      'nvim-tree/nvim-tree.lua',
      -- event = 'BufEnter',
      requires = { 'nvim-tree/nvim-web-devicons', 'projekt0n/circles.nvim' },
      config = function()
        pcall(require, 'ful1e5.plugins.nvim-tree')
      end,
    })

    -- LSP
    use({
      'williamboman/mason.nvim',
      event = 'BufRead',
      requires = {
        { 'neovim/nvim-lspconfig' },
        { 'williamboman/mason-lspconfig.nvim' },
        { 'hrsh7th/cmp-nvim-lsp' },
      },
      config = function()
        require('ful1e5.lsp.mason')
      end,
    })

    -- Autocompletion
    use({
      'hrsh7th/nvim-cmp',
      event = 'BufRead',
      requires = {
        -- vscode-like pictograms
        { 'onsails/lspkind.nvim' },

        -- Snippet Engine
        { 'L3MON4D3/LuaSnip', tag = 'v1.2.1', run = 'make install_jsregexp' },

        -- vacode-like snippets
        { 'rafamadriz/friendly-snippets', event = 'InsertCharPre' },

        -- nvim-cmp plugins
        { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
        { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      },
      config = function()
        pcall(require, 'ful1e5.plugins.luasnip')
        pcall(require, 'ful1e5.plugins.cmp')
      end,
    })

    -- plenary.nvim
    use({
      'nvim-lua/plenary.nvim',
      config = function()
        vim.keymap.set('n', '<space>t', '<Plug>PlenaryTestFile', { noremap = true })
      end,
    })

    -- Search
    use({
      'nvim-telescope/telescope.nvim',
      branch = '0.1.x',
      event = 'CursorHold',
      requires = {
        { 'nvim-lua/popup.nvim' },
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      },
      config = function()
        pcall(require, 'ful1e5.plugins.telescope')
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
      {
        'nvim-treesitter/nvim-treesitter',
        event = 'BufRead',
        run = ':TSUpdate',
        config = function()
          pcall(require, 'ful1e5.plugins.nvim-treesitter')
        end,
      },

      { 'nvim-treesitter/playground', after = 'nvim-treesitter' },
      { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' },
      {
        'windwp/nvim-autopairs',
        after = { 'nvim-treesitter', 'nvim-cmp' },
        config = function()
          pcall(require, 'ful1e5.plugins.autopairs')
        end,
      },
    })

    -- Git
    use({
      {
        'tpope/vim-fugitive',
        event = 'BufRead',
        config = function()
          pcall(require, 'ful1e5.plugins.fugitive')
        end,
      },

      {
        'lewis6991/gitsigns.nvim',
        event = 'BufRead',
        config = function()
          pcall(require, 'ful1e5.plugins.gitsigns')
        end,
      },
    })

    -- Lualine
    use({
      'nvim-lualine/lualine.nvim',
      event = 'BufEnter',
      config = function()
        -- require('lualine').setup({ options = { theme = 'auto' } })
      end,
    })

    -- ColorScheme
    use({
      {
        -- 'projekt0n/github-nvim-theme',
        '~/GitHub/projekt0n/github-nvim-theme',
        config = function()
          require('ful1e5.themes.github')
        end,
      },

      {
        -- 'projekt0n/caret.nvim',
        '~/GitHub/projekt0n/caret.nvim',
        config = function()
          -- require('ful1e5.themes.caret')
        end,
      },
    })

    -- Markdown previewer
    use({
      'iamcco/markdown-preview.nvim',
      run = 'cd app && npm install',
      ft = { 'markdown' },
      setup = function()
        vim.g.mkdp_filetypes = { 'markdown' }
      end,
    })

    -- Markdown Shortcuts
    use({
      'antonk52/markdowny.nvim',
      config = function()
        require('markdowny').setup({ filetypes = { 'markdown', 'txt' } })
      end,
    })

    -- Surround
    use({
      'kylechui/nvim-surround',
      event = 'BufRead',
      config = function()
        pcall(require, 'ful1e5.plugins.nvim-surround')
      end,
    })

    -- Colorizer
    use({ 'lilydjwg/colorizer', event = 'CursorHold' })

    -- ASCII tree
    use({ 'cloudysake/asciitree.nvim', event = 'BufRead' })

    -- Comment
    use({
      'numToStr/Comment.nvim',
      event = 'BufRead',
      config = function()
        require('Comment').setup()
      end,
    })

    use({
      'j-hui/fidget.nvim',
      branch = 'legacy',
      config = function()
        require('fidget').setup({
          text = {
            spinner = 'square_corners',
            done = ' ',
          },
          window = {
            border = 'rounded',
          },
        })
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
