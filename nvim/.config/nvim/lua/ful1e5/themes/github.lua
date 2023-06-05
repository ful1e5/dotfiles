require('github-theme').setup({
  options = {
    hide_nc_statusline = false,
    inverse = {
      match_paren = true,
      visual = true,
      search = true,
    },
  },
})

vim.cmd('colorscheme github_dark')
