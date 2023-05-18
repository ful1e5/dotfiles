-- Helper function to create buffer-local mappings
local bufmap = function(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts or { noremap = true, silent = true, buffer = true })
end

-- Create an autogroup for LSP commands
local lsp_cmds = vim.api.nvim_create_augroup('lsp_cmds', { clear = true })

-- Autocmd to attach LSP actions
vim.api.nvim_create_autocmd('LspAttach', {
  group = lsp_cmds,
  desc = 'LSP actions',
  callback = function()
    -- Set the omnifunc for the current buffer
    vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Create mappings for various LSP functions
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
      vim.diagnostic.open_float(float_opts.float)
    end)
    bufmap('n', '[d', function()
      vim.diagnostic.goto_prev(float_opts)
    end)
    bufmap('n', ']d', function()
      vim.diagnostic.goto_next(float_opts)
    end)

    -- Unused mappings
    -- bufmap('n', '<C-k>', vim.lsp.buf.signature_help)
    -- bufmap('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end)
    -- bufmap('n', '<space>wa', vim.lsp.buf.add_workspace_folder)
    -- bufmap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder)
    -- bufmap('n', '<space>D', vim.lsp.buf.type_definition)
    -- bufmap('n', '<space>q', function() vim.diagnostic.set_loclist() end)

    -- Set the omnifunc for the current buffer
    vim.cmd.setlocal('omnifunc=v:lua.vim.lsp.omnifunc')

    vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = {
        prefix = '',
      },
    })
  end,
})

-- Create an autogroup for user filetype commands
local user_cmds = vim.api.nvim_create_augroup('user_cmds', { clear = true })

-- J & K moments in wrap
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  group = user_cmds,
  pattern = { '*.md', '*.html', '*.txt', 'text' },
  callback = function()
    vim.opt.wrap = true
    bufmap({ 'n', 'v' }, 'j', 'gj')
    bufmap({ 'n', 'v' }, 'k', 'gk')
  end,
})

-- Set Fallback filetype to text
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  group = user_cmds,
  pattern = '*',
  callback = function()
    if vim.o.filetype == nil or vim.o.filetype == '' then
      vim.o.filetype = 'txt'
    end
  end,
})

-- Highlight Yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = user_cmds,
  callback = function()
    vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
  end,
})
