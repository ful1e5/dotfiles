require('nvim-surround').setup({
  surrounds = {
    ['|'] = {
      add = { '|', '|' },
      find = '%|.-%|',
      delete = '^(%|?)().-(%|?)()$',
      change = {
        target = '^(%|?)().-(%|?)()$',
      },
    },
    ['*'] = {
      add = { '*', '*' },
      find = '%*.-%*',
      delete = '^(%*?)().-(%*?)()$',
      change = {
        target = '^(%*?)().-(%*?)()$',
      },
    },
    ['_'] = {
      add = { '_', '_' },
      find = '%_.-%_',
      delete = '^(%_?)().-(%_?)()$',
      change = {
        target = '^(%_?)().-(%_?)()$',
      },
    },
  },
})
