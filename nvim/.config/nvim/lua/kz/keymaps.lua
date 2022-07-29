local map = vim.keymap.set
local opts = { noremap = true }

-- Quickfix list
map('n', 'q[', ':cprev<cr>', opts)
map('n', 'q]', ':cnext<cr>', opts)
map('n', 'q\\', function()
  vim.cmd([[
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen 4
    else
      cclose
    endif
  ]])
end, opts)

-- Line transform using 'Alt'
map('n', '<A-j>', ':m .+1<CR>==', opts)
map('n', '<A-k>', ':m .-2<CR>==', opts)
map('i', '<A-j>', '<Esc>:m .+1<CR>==gi', opts)
map('i', '<A-k>', '<Esc>:m .-2<CR>==gi', opts)
map('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
map('v', '<A-k>', ":m '<-2<CR>gv=gv", opts)

-- Buffer
map('n', '<space><Esc>', ':bd<CR>', opts)
map('n', '<C-l>', ':%bd!<CR>', opts)
map('n', '<space>]', ':bnext<CR>', opts)
map('n', '<space>[', ':bprev<CR>', opts)

-- Window navigation
map('n', '<space>h', ':wincmd h<CR>', opts)
map('n', '<space>j', ':wincmd j<CR>', opts)
map('n', '<space>k', ':wincmd k<CR>', opts)
map('n', '<space>l', ':wincmd l<CR>', opts)

-- Clear search result
map('n', '<C-n>', ':set hlsearch!<CR>', opts)

-- Source luafile
map('n', '<space>so', ':luafile %<CR>', opts)

-- Change word
map('n', '<space><F2>', ':%s/\\<<C-r><C-w>\\>//g<Left><Left>', opts)
