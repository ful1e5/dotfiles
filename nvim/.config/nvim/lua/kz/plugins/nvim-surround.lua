require('nvim-surround').setup({
  surrounds = {
    ['|'] = {
      add = function()
        return { { '|' }, { '|' } }
      end,
    },
    ['*'] = {
      add = function()
        return { { '*' }, { '*' } }
      end,
    },
    ['_'] = {
      add = function()
        return { { '_' }, { '_' } }
      end,
    },
  },
})
