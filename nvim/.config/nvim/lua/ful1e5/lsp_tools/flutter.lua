local lsp_opts = require('ful1e5.lsp.opts')

require('flutter-tools').setup({
  ui = { border = 'rounded' },
  -- flutter_lookup_cmd = "dirname $(which flutter)", -- zsh/bash shell
  flutter_lookup_cmd = 'dirname (which flutter)', -- fish shell
  lsp = {
    on_attach = lsp_opts.on_attach,
    capabilities = lsp_opts.capabilities,
    settings = { showTodos = true, completeFunctionCalls = true },
  },
})

-- Auto Formate
local group = vim.api.nvim_create_augroup('FultterTools', { clear = true })
vim.api.nvim_create_autocmd('BufWrite', {
  pattern = '*.dart',
  command = "execute ':DartFmt'",
  group = group,
})

-- Flutter Extension

require('telescope').load_extension('flutter')
vim.keymap.set('n', '<spcae>fr', require('telescope').extensions.flutter.commands)
