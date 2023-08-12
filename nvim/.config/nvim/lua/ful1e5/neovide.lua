-- Neovide Settings
vim.g.neovide_confirm_quit = true
vim.g.neovide_underline_automatic_scaling = true
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_scale_factor = 1.0

-- Refresh rate
vim.g.neovide_refresh_rate = 60
vim.g.neovide_refresh_rate_idle = 1

-- GUI Settings
vim.opt.guifont = 'IosevkaTerm Nerd Font Mono:h10,Iosevka Nerd Font Mono,Noto Color Emoji:h14'
vim.opt.linespace = 3

vim.g.neovide_padding_top = 7
vim.g.neovide_padding_bottom = 7
vim.g.neovide_padding_right = 7
vim.g.neovide_padding_left = 7

-- Floating Blur
vim.g.neovide_transparency = 0.8
vim.g.neovide_floating_blur_amount_x = 50.0
vim.g.neovide_floating_blur_amount_y = 50.0

-- Cursor Settings
vim.g.neovide_cursor_vfx_mode = 'railgun'
vim.g.neovide_cursor_antialiasing = false
-- vim.g.neovide_cursor_unfocused_outline_width = 0.05

-- Particles Settings
vim.g.neovide_cursor_vfx_particle_lifetime = 5.0
vim.g.neovide_cursor_vfx_particle_density = 5.0
vim.g.neovide_cursor_animation_length = 0.03

-- Keybinds
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
