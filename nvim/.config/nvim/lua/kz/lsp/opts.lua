return {
  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  on_attach = function(_, bufnr)
    local function buf_set_keymap(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    local function buf_set_option(...)
      vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap = true, silent = true }

        -- See `:help vim.lsp.*` for documentation on any of the below functions
        -- stylua: ignore start
        buf_set_keymap('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
        buf_set_keymap('n', 'gd', function() vim.lsp.buf.definition() end, opts)
        buf_set_keymap('n', 'K', function() vim.lsp.buf.hover() end, opts)
        buf_set_keymap('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
        buf_set_keymap('n', '<C-k>', function() vim.lsp.buf.signature_help() end, opts)
        buf_set_keymap('n', '<space>wa', function() vim.lsp.buf.add_workspace_folder() end, opts)
        buf_set_keymap('n', '<space>wr', function() vim.lsp.buf.remove_workspace_folder() end, opts)
        buf_set_keymap('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
        buf_set_keymap('n', '<space>D', function() vim.lsp.buf.type_definition() end, opts)
        buf_set_keymap('n', '<F2>', function() vim.lsp.buf.rename() end, opts)
        buf_set_keymap('n', 'gr', function() vim.lsp.buf.references() end, opts)
        buf_set_keymap('n', '<space>ca', function() vim.lsp.buf.code_action() end, opts)
        buf_set_keymap('n', '<space>e',function () vim.diagnostic.open_float({ float={ border='rounded' } }) end, opts)
        buf_set_keymap('n', '[d', "<cmd>lua vim.diagnostic.goto_prev({float={border='rounded'}})<CR>", opts)
        buf_set_keymap('n', ']d', "<cmd>lua vim.diagnostic.goto_next({float={border='rounded'}})<CR>", opts)
        buf_set_keymap('n', '<space>q', function() vim.diagnostic.set_loclist() end, opts)
        buf_set_keymap('n', '<space>ff', function() vim.lsp.buf.format() end, opts)
    -- stylua: ignore end

    vim.cmd('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

    print('LSP Attached.')
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
}
