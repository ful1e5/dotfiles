require('caret').setup({
  options = { inverse = { visual = true } },
  mapping = { toggle_bg = '<space>bg' },
})

vim.cmd('colorscheme caret')
