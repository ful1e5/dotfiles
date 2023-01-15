vim.opt.guifont = 'Iosevka Nerd Font Mono:h15,Noto Color Emoji:h15'

vim.g.neovide_refresh_rate = 30
vim.g.neovide_refresh_rate_idle = 1

vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_cursor_unfocused_outline_width = 0.05
vim.g.neovide_cursor_vfx_mode = 'railgun'
vim.g.neovide_cursor_antialiasing = false

vim.g.neovide_hide_mouse_when_typing = true

vim.g.neovide_underline_automatic_scaling = true
vim.g.neovide_scale_factor = 1.0
-- Increase font size
vim.keymap.set('n', '<C-=>', function()
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * 1.10
end, {})
-- Decrease font size
vim.keymap.set('n', '<C-->', function()
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor / 1.10
end, {})
-- Reset font size
vim.keymap.set('n', '<C-0>', function()
  vim.g.neovide_scale_factor = 1.0
end, {})
