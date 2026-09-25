-- Setup Custom visual to LSP
pcall(require, 'ful1e5.lsp.visual')

-- List of servers to handle via Mason
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

-- 1. Initialize Mason Core Engine Safely
local mason_ok, mason = pcall(require, 'mason')
if not mason_ok then return end

mason.setup({
  ui = {
    border = 'rounded',
    icons = {
      package_installed = '',
      package_pending = '',
      package_uninstalled = '',
    },
  },
})

-- 2. Initialize Mason-LSPConfig Companion Safely
local mason_lsp_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lsp_ok then return end

mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_installation = true,
})

-- 3. Modern Configuration Strategy (Nvim 0.11+)
-- Extract capabilities safely with a fallback table so lazy loading doesn't crash it
local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if cmp_lsp_ok then
  capabilities = cmp_nvim_lsp.default_capabilities()
end

-- Define global defaults using the "*" registry key
vim.lsp.config('*', {
  capabilities = capabilities,
  -- Add other global hooks (like custom on_attach mapping schemes) here
})

-- 4. Load Per-Server Custom Module Settings Profiles
for _, name in ipairs(servers) do
  local status, server_mod = pcall(require, 'ful1e5.lsp.servers.' .. name)
  if status and server_mod and server_mod.settings then
    vim.lsp.config(name, {
      settings = server_mod.settings
    })
  end
end
