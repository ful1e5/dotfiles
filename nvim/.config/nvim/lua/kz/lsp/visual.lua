local M = {}

---Override custom diagnostic signs and border to nvim lsp
M.setup = function()
  -- Diagnostic icons
  local signs = {
    Error = ' ',
    Warn = ' ',
    Hint = '硫',
    Info = ' ',
  }

  for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
  end

  -- Border
  _G.border = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' }

  -- Docs Window
  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

  -- set border in lspconfig
  -- https://neovim.discourse.group/t/lspinfo-window-border/1566/5
  local win = require('lspconfig.ui.windows')
  local _default_opts = win.default_opts

  win.default_opts = function(options)
    local opts = _default_opts(options)
    opts.border = 'rounded'
    return opts
  end
end

return M
