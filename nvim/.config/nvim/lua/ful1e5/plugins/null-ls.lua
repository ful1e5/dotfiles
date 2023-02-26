local null_ls = require('null-ls')

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
  if client.supports_method('textDocument/formatting') then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({
          timeout = -1,
          filter = function(c)
            return c.name == 'null-ls'
          end,
          bufnr = bufnr,
        })
      end,
    })
  end
end

null_ls.setup({
  timeout = -1,
  on_attach = on_attach,
  sources = {
    -- prettier
    null_ls.builtins.formatting.prettier.with({
      extra_filetypes = { 'toml' },
    }),

    -- fish
    null_ls.builtins.diagnostics.fish,
    null_ls.builtins.formatting.fish_indent,

    -- lua
    null_ls.builtins.formatting.stylua,

    -- python
    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.black,

    -- xml
    null_ls.builtins.formatting.xmllint.with({
      extra_filetypes = { 'svg' },
    }),
  },
  debug = true,
})
