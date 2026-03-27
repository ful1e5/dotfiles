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
  'ts_ls',
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

-- 1. Mason Setup
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

-- 2. Mason-LSPConfig Setup
-- NOTE: In 0.11+, this automatically enables servers by default.
require('mason-lspconfig').setup({
  ensure_installed = servers,
  automatic_installation = true,
})

-- 3. Modern Configuration Strategy
-- Instead of a loop with .setup(), use the native configuration registry.
-- You can define global defaults using the "*" key.
vim.lsp.config('*', {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  -- Add other global options here
})

-- For custom per-server settings, instead of server.setup(), 
-- simply define them via vim.lsp.config before or after mason setup.
for _, name in ipairs(servers) do
  local status, server_mod = pcall(require, 'ful1e5.lsp.servers.' .. name)
  if status and server_mod.settings then
    vim.lsp.config(name, {
      settings = server_mod.settings
    })
  end
end
