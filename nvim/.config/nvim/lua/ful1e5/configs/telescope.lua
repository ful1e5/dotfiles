local status_ok, telescope = pcall(require, "telescope")
if not status_ok then return end

local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    selection_caret = '❯ ',
    entry_prefix = '  ',
    color_devicons = true,
    set_env = { ['COLORTERM'] = 'truecolor' },
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
  },
  -- FIXED: Kept parallel to defaults table (NOT nested inside it)
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
  },
})

-- Force binary injections into Telescope core
pcall(telescope.load_extension, 'fzf')
pcall(telescope.load_extension, 'emoji')

-- Standard Keybindings Configuration
local builtin = require('telescope.builtin')
local map = vim.keymap.set

map('n', '<space>vrc', function()
  builtin.find_files({ prompt_title = '~ VimRC ~', cwd = vim.fn.expand('$HOME/.dotfiles/nvim/.config/nvim/') })
end, { desc = "Find Neovim Config Files" })

map('n', '<C-p>', function()
  -- Ultra-fast check if file path is within a git management environment
  local is_git = vim.fn.finddir('.git', '.;') ~= ''
  if is_git then
    builtin.git_files({ show_untracked = true })
  else
    builtin.find_files()
  end
end, { desc = "Find Files" })

map('n', '<C-f>', builtin.live_grep, { desc = "Live Grep" })
map('n', '<leader><f1>', builtin.help_tags, { desc = "Help Tags" })
map('n', 'z=', builtin.spell_suggest, { desc = "Spell Suggestions" })
map('n', '<leader>hi', builtin.highlights, { desc = "Highlights" })
