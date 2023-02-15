-- Setup Custom visual to LSP
require('ful1e5.lsp.visual')

-- LSP Servers
local servers = {
  'cssls',
  'jsonls',
  'yamlls',
  'taplo',
  'pyright',
  'lua_ls',
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

local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config
lsp_defaults.capabilities =
  vim.tbl_deep_extend('force', lsp_defaults.capabilities, require('cmp_nvim_lsp').default_capabilities())

-- Specify the default options which we'll use to setup all servers
for _, name in ipairs(servers) do
  -- Enhance the default opts with the server-specific ones
  pcall(function()
    lsp_defaults = require('ful1e5.lsp.servers.' .. name).setup()
  end)

  lspconfig[name].setup(lsp_defaults)
end
