require('nvim-surround').setup({
  delimiters = {
    separators = {
      ['|'] = { '|', '|' },
      ['*'] = { '*', '*' },
      ['_'] = { '_', '_' },
    },
  },
})
