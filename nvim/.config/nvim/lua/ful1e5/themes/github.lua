require('github-theme').setup({
  options = {
    transparent = true,
    hide_nc_statusline = false,
    hide_end_of_buffer = false,
    inverse = {
      match_paren = true,
      -- visual = true,
      search = true,
    },
    darken = {
      sidebars = {
        enabled = false,
      },
    },
  },
  groups = {
    all = {
      ['@label.jsonc'] = { link = '@label.json' },
    },
  },
})

vim.g.github_theme_debug = true

vim.cmd('colorscheme github_dark_dimmed')
