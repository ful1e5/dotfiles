-- LSP Keybinds
local lsp_cmds = vim.api.nvim_create_augroup('lsp_cmds', { clear = true })

vim.api.nvim_create_autocmd('LspAttach', {
  group = lsp_cmds,
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, { buffer = true })
    end

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    bufmap('n', 'gD', vim.lsp.buf.declaration)
    bufmap('n', 'gd', vim.lsp.buf.definition)
    bufmap('n', 'gr', vim.lsp.buf.references)
    bufmap('n', 'gi', vim.lsp.buf.implementation)
    bufmap('n', 'K', vim.lsp.buf.hover)
    bufmap('n', '<F2>', vim.lsp.buf.rename)
    bufmap('n', '<space>ca', vim.lsp.buf.code_action)
    bufmap('n', '<space>ff', vim.lsp.buf.format)

    local float_opts = { float = { border = 'rounded' } }
    bufmap('n', '<space>e', function()
      vim.diagnostic.open_float(float_opts)
    end)
    bufmap('n', '[d', function()
      vim.diagnostic.goto_prev(float_opts)
    end)
    bufmap('n', ']d', function()
      vim.diagnostic.goto_next(float_opts)
    end)

    -- bufmap('n', '<C-k>', vim.lsp.buf.signature_help)
    -- bufmap('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end)
    -- bufmap('n', '<space>wa', vim.lsp.buf.add_workspace_folder)
    -- bufmap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder)
    -- bufmap('n', '<space>D', vim.lsp.buf.type_definition)
    -- bufmap('n', '<space>q', function() vim.diagnostic.set_loclist() end)
  end,
})
