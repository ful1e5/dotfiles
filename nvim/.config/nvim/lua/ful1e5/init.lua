require('ful1e5.options')
require('ful1e5.autocmds')
require('ful1e5.keymaps')
require('ful1e5.plugins')
require('ful1e5.statusline')

if vim.g.neovide then
  require('ful1e5.neovide')
end

vim.api.nvim_create_user_command('ReloadConfig', function()
  require('plenary.reload').reload_module('ful1e5', true)
  vim.cmd.source('$MYVIMRC')
  vim.cmd.PackerCompile()
end, {})
