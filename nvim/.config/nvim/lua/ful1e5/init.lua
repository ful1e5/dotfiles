require('ful1e5.keymaps')
require('ful1e5.options')
require('ful1e5.plugins')
require('ful1e5.autocmds')
require('ful1e5.usercmds')
require('ful1e5.statusline')

if vim.g.neovide then
  require('ful1e5.neovide')
end
