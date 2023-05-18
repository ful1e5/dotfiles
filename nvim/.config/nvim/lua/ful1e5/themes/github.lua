require('github-theme').setup({
  options = {
    inverse = {
      match_paren = false,
      visual = true,
      search = true,
    },
  },
})

vim.cmd('colorscheme github_dark_high_contrast')
