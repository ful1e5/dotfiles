local efm = {}

local stylua = {
  formatCommand = 'stylua -s --stdin-filepath ${INPUT} -',
  formatStdin = true,
}

local luacheck = {
  lintCommand = 'luacheck --codes --formatter plain --std luajit --filename ${INPUT} -',
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = { '%f:%l:%c: %m' },
  lintSource = 'luacheck',
  rootMarkers = { '.luacheckrc' },
}

local black = {
  formatCommand = 'black --fast ${-l:lineLength} -',
  formatStdin = true,
}

local flake8 = {
  lintCommand = 'flake8 --max-line-length 160 --format '
    .. "'%(path)s:%(row)d:%(col)d: %(code)s %(code)s %(text)s '"
    .. '--stdin-display-name ${INPUT} -',
  lintStdin = true,
  lintIgnoreExitCode = true,
  lintFormats = { '%f:%l:%c: %t%n%n%n %m' },
  lintSource = 'flake8',
}

local isort = {
  formatCommand = 'isort --stdout ${-l:lineLength} --profile black -',
  formatStdin = true,
}

-- local prettierd = {
--   formatCommand = 'prettierd ${INPUT} ${--range-start=charStart} ${--range-end=charEnd} ${--tab-width=2}',
--   formatStdin = true,
--   rootMarkers = {
--     '.prettierrc',
--     '.prettierrc.json',
--     '.prettierrc.js',
--     '.prettierrc.yml',
--     '.prettierrc.yaml',
--     '.prettierrc.json5',
--     '.prettierrc.mjs',
--     '.prettierrc.cjs',
--     '.prettierrc.toml',
--   },
-- }

local prettier = {
  formatCommand = "prettier --stdin --stdin-filepath '${INPUT}' "
    .. '${--range-start=charStart} ${--range-end=charEnd} '
    .. '${--tab-width:tabSize} ${--use-tabs:!insertSpaces}',
  formatStdin = true,
  rootMarkers = {
    '.prettierrc',
    '.prettierrc.json',
    '.prettierrc.js',
    '.prettierrc.yml',
    '.prettierrc.yaml',
    '.prettierrc.json5',
    '.prettierrc.mjs',
    '.prettierrc.cjs',
    '.prettierrc.toml',
  },
}

local shfmt = {
  formatCommand = 'shfmt -ci -i 2 -s -bn',
  formatStdin = true,
}

local shellcheck = {
  lintCommand = 'shellcheck -f gcc -x',
  listSource = 'shellcheck',
  lintFormats = {
    '%f:%l:%c: %trror: %m',
    '%f:%l:%c: %tarning: %m',
    '%f:%l:%c: %tote: %m',
  },
}

local xmllint = {
  formatCommand = 'xmllint --format --recover -',
  formatStdin = true,
}

local languages = {
  lua = { stylua, luacheck },
  python = { black, isort, flake8 },
  typescript = { prettier },
  javascript = { prettier },
  typescriptreact = { prettier },
  javascriptreact = { prettier },
  yaml = { prettier },
  json = { prettier },
  html = { prettier },
  scss = { prettier },
  css = { prettier },
  markdown = { prettier },
  sh = { shfmt, shellcheck },
  -- svg = { xmllint },
  xml = { xmllint },
}

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

efm.setup = function()
  return {
    init_options = {
      documentFormatting = true,
      documentRangeFormatting = true,
    },
    filetypes = vim.tbl_keys(languages),
    settings = {
      rootMarkers = { '.git/' },
      lintDebounce = 100,
      -- logLevel = 5,
      languages = languages,
    },

    on_attach = function(client, bufnr)
      if client.supports_method('textDocument/formatting') then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({
              bufnr = bufnr,
              async = false,
              timeout_ms = 8000,
              filter = function(c)
                return c.name == 'efm'
              end,
            })
          end,
          desc = '[lsp] format on save',
        })
      end
    end,
  }
end

return efm
