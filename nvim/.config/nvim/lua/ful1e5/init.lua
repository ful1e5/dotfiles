-- Disable some builtin vim plugins
local disabled_built_ins = {
  '2html_plugin',
  'getscript',
  'getscriptPlugin',
  'gzip',
  'logipat',
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
  'matchit',
  'matchparen',
  'tar',
  'tarPlugin',
  'rrhelper',
  'vimball',
  'vimballPlugin',
  'zip',
  'zipPlugin',
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g['loaded_' .. plugin] = 1
end

require('ful1e5.keymaps')
require('ful1e5.options')

-- Set up lazy.nvim plugin manager
require('lazy').setup('ful1e5.lazy_plugins', {
  defaults = {
    lazy = true,
  },
  install = {
    missing = true,
  },
  ui = {
    border = 'rounded',
  },
  pkg = {
    enabled = false,
  },
  performance = {
    cache = { enabled = true },
    rtp = {
      disabled_plugins = {
        'gzip',
        'matchit',
        'matchparen',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'vimballPlugin',
        'zipPlugin',
      },
    },
  },
})

require('ful1e5.autocmds')
require('ful1e5.usercmds')
require('ful1e5.statusline')

if vim.g.neovide then
  require('ful1e5.neovide')
end
