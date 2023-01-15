local map = vim.keymap.set

-- Git
-- NOTE: 'dv' to get conflicts
-- NOTE: Ctrl+w & Ctrl+o to save
map('n', '<space>gh', ':diffget //2<CR>')
map('n', '<space>gl', ':diffget //3<CR>')

-- push & pull
map('n', '<space>gs', ':Git<CR>')
map('n', '<space>gp', ':G push<CR>')
map('n', '<space>gl', ':G pull<CR>')

-- rebase
map('n', '<space>grb', ':G rebase ')

-- fetch
map('n', '<space>gfo', ':G fetch origin<CR>')

-- reset
map('n', '<space>grs', ':G reset --soft HEAD~1<CR>')
map('n', '<space>grh', ':G reset --hard HEAD~1<CR>')
