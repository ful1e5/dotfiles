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
require('ful1e5.plugins')
require('ful1e5.autocmds')
require('ful1e5.usercmds')
require('ful1e5.statusline')

if vim.g.neovide then
  require('ful1e5.neovide')
end
