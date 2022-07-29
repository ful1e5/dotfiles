local lsp_opts = require('kz.lsp.opts')

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
local opts = { noremap = true, silent = true }
local map = vim.keymap.set

require('telescope').load_extension('flutter')
map('n', '<spcae>fr', function()
  require('telescope').extensions.flutter.commands()
end, opts)
