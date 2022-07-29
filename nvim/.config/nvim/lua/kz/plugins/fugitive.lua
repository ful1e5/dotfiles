local map = vim.keymap.set
local opts = { noremap = true }

-- Git
-- NOTE: 'dv' to get conflicts
-- NOTE: Ctrl+w & Ctrl+o to save
map('n', '<space>gh', ':diffget //2<CR>', opts)
map('n', '<space>gl', ':diffget //3<CR>', opts)

-- push & pull
map('n', '<space>gs', ':Git<CR>', opts)
map('n', '<space>gp', ':G push<CR>', opts)
map('n', '<space>gl', ':G pull<CR>', opts)

-- rebase
map('n', '<space>grb', ':G rebase ', opts)

-- fetch
map('n', '<space>gf', ':G fetch ', opts)
map('n', '<space>gfo', ':G fetch origin<CR>', opts)

-- reset
map('n', '<space>grs', ':G reset --soft HEAD~1<CR>', opts)
map('n', '<space>grh', ':G reset --hard HEAD~1<CR>', opts)
