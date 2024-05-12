-- Setup Custom visual to LSP
require('ful1e5.lsp.visual')

-- LSP Servers
local servers = {
  'cssls',
  'html',
  'tailwindcss',
  'prismals',
  'jsonls',
  'yamlls',
  'taplo',
  'pyright',
  'lua_ls',
  'emmet_ls',
  'tsserver',
  'esbonio',
  'dockerls',
  'bashls',
  'efm',
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
local opts = lspconfig.util.default_config
opts.capabilities = vim.tbl_deep_extend('force', opts.capabilities, require('cmp_nvim_lsp').default_capabilities())

-- Specify the default options which we'll use to setup all servers
for _, name in ipairs(servers) do
  -- Enhance the default opts with the server-specific ones
  local status, server = pcall(require, 'ful1e5.lsp.servers.' .. name)
  if status then
    opts = server.setup()
  end

  lspconfig[name].setup(opts)
end
