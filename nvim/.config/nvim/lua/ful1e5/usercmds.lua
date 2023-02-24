-- Resource Neovim Config
vim.api.nvim_create_user_command('ReloadConfig', function()
  require('plenary.reload').reload_module('ful1e5', true)
  vim.cmd.source('$MYVIMRC')
  vim.cmd.PackerCompile()
end, {})

-- Inspect RGBA Color keymaps
vim.api.nvim_create_user_command('InspectRgba', function()
  require('ful1e5.utils.rgba_to_hex').inspect_rgba()
end, {})
