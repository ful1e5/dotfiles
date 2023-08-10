require('github-theme').setup({
  options = {
    hide_nc_statusline = false,
    inverse = {
      match_paren = true,
      visual = true,
      search = true,
    },
  },
  groups = {
    all = {
      ['@label.jsonc'] = { link = '@label.json' },
    },
  },
})

vim.g.github_theme_debug = true

vim.cmd('colorscheme github_dark')
