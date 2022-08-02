local glyphs = {}

local installed, circles = pcall(require, 'circles')
if installed then
  circles.setup({ icons = { empty = '', filled = '', lsp_prefix = '' } })
  glyphs = circles.get_nvimtree_glyphs()
end

glyphs.git = {
  unstaged = '',
  staged = '',
  unmerged = '',
  renamed = '',
  untracked = '',
  deleted = '',
  ignored = '◌',
}

require('nvim-tree').setup({
  diagnostics = { enable = true },
  view = {
    width = 30,
    side = 'right',
    signcolumn = 'no',
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  renderer = {
    group_empty = true,
    highlight_opened_files = 'all',
    special_files = {},
    root_folder_modifier = ':p:~',
    icons = {
      glyphs = glyphs,
    },
  },
})

-- Mappings
vim.keymap.set('n', '<C-b>', function()
  require('nvim-tree').toggle()
end, { noremap = true, silent = true })
