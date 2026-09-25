local M = {}

function M.setup()
  -- 1. Setup the rewritten nvim-treesitter for Neovim 0.12
  local status_ok, ts = pcall(require, 'nvim-treesitter')
  if status_ok then
    -- Neovim 0.12 handles highlighting natively, but you tell the plugin 
    -- which parsers you want it to manage and install.
    ts.setup({
      -- Specify parsers to install
      install = { "lua", "vim", "vimdoc", "query", "javascript", "typescript", "html" },
    })
  else
    vim.notify('Failed to load rewritten nvim-treesitter: ' .. tostring(ts), vim.log.levels.WARN)
  end

  -- 2. Setup Autotag
  local autotag_ok, autotag = pcall(require, "nvim-ts-autotag")
  if autotag_ok then
    autotag.setup()
  end

  -- 3. Setup Autopairs
  local autopairs_ok, autopairs = pcall(require, "nvim-autopairs")
  if autopairs_ok then
    autopairs.setup({
      check_ts = true, -- Still uses Treesitter integration under the hood
    })
  end


  vim.keymap.set("n", "<leader>ff", function()
    -- Check if any active LSP server attached to the buffer supports formatting
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    local lsp_can_format = false

    for _, client in ipairs(clients) do
      if client.supports_method("textDocument/formatting") then
        lsp_can_format = true
        break
      end
    end

    if lsp_can_format then
      -- Run complete standard formatting using the LSP engine
      vim.lsp.buf.format({ async = true })
      vim.notify("Formatted document with LSP", vim.log.levels.INFO)
    else
      -- Fallback: Use Tree-sitter's AST grammar to re-indent the entire file range
      -- This evaluates identical code to executing gg=G without moving your cursor position
      local view = vim.fn.winsaveview()
      vim.cmd("normal! gg=G")
      if view then vim.fn.winrestview(view) end
      vim.notify("Re-indented document with Tree-sitter", vim.log.levels.INFO)
    end
  end, { desc = "Format Document (LSP / Tree-sitter Fallback)" })
end

return M
