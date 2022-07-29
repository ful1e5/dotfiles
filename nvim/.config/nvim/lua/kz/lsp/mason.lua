-- Setup Custom visual to LSP
require('kz.lsp.visual').setup()

-- Setup LSP Servers
local servers = {
  'cssls',
  'jsonls',
  'yamlls',
  -- "taplo",
  'pyright',
  'sumneko_lua',
  'emmet_ls',
  'tsserver',
  'esbonio',
  'dockerls',
}

require('mason').setup({
  ui = {
    border = 'rounded',
    icons = {
      package_installed = '',
      package_pending = '',
      package_uninstalled = '',
    },
  },
})

require('mason-lspconfig').setup({
  ensure_installed = servers,
  automatic_installation = true,
})

-- Specify the default options which we'll use to setup all servers
local default_opts = require('kz.lsp.opts')

for _, name in ipairs(servers) do
  -- Enhance the default opts with the server-specific ones
  pcall(function()
    require('kz.lsp.servers.' .. name).setup(default_opts)
  end)

  require('lspconfig')[name].setup(default_opts)
end
