-- Diagnostic icons
local signs = {
  Error = ' ',
  Warn = ' ',
  Hint = '󰓏',
  Info = ' ',
}

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

-- Docs Window
vim.lsp.handlers['textDocument/hover'] = vim.lsp.handlers.hover.with({ border = 'rounded' })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.handlers.signature_help.with({ border = 'rounded' })

-- set border in lspconfig
-- https://neovim.discourse.group/t/lspinfo-window-border/1566/5
require('lspconfig.ui.windows').default_options.border = 'rounded'

-- Diagnostic config (replaces deprecated vim.lsp.with for on_publish_diagnostics)
vim.diagnostic.config({
  virtual_text = {
    prefix = '',
    spacing = 5,
    severity_limit = 'Warning',
  },
  underline = true,
  update_in_insert = true,
})
