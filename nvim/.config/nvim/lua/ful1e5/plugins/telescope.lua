local actions = require('telescope.actions')

require('telescope').setup({
  defaults = {
    selection_caret = '❯ ',
    entry_prefix = '  ',
    color_devicons = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    selection_strategy = 'reset',
    sorting_strategy = 'descending',
    layout_strategy = 'horizontal',
    layout_config = { horizontal = { mirror = false }, vertical = { mirror = false } },
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
      },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
    },
  },
})
-- To get fzf loaded and working with telescope
require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')

local map = vim.keymap.set

-- Custom key-binding
map('n', '<space>vrc', function()
  return builtin.find_files({ prompt_title = '~ VimRC ~', cwd = '$HOME/.dotfiles/nvim/.config/nvim/' })
end)

map('n', '<C-p>', function()
  local in_git_repo = vim.fn.systemlist('git rev-parse --is-inside-work-tree')[1] == 'true'
  if in_git_repo then
    return builtin.git_files({ show_untracked = true })
  else
    return builtin.find_files()
  end
end)

-- Builtin key-binding
map('n', '<C-f>', builtin.live_grep)
map('n', '<f1>', builtin.help_tags)
map('n', 'z=', builtin.spell_suggest)
map('n', 'hi', builtin.highlights)
