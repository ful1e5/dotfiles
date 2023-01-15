local map = vim.keymap.set

-- Quickfix list
map('n', '<C-]>', function()
  return pcall(vim.cmd.cnext)
end)
map('n', '<C-[>', function()
  return pcall(vim.cmd.cprev)
end)
map('n', '<C-\\>', function()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win['quickfix'] == 1 then
      qf_exists = true
    end
  end
  if qf_exists == true then
    vim.cmd.cclose()
    return
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd.copen()
  else
    print('Quickfix list is Empty!')
  end
end)

-- Line transform using 'Alt'
map('n', '<A-j>', ':m .+1<CR>==')
map('n', '<A-k>', ':m .-2<CR>==')
map('v', '<A-j>', ":m '>+1<CR>gv=gv")
map('v', '<A-k>', ":m '<-2<CR>gv=gv")

-- Increment/decrement
map('n', '=', '<C-a>')
map('n', '-', '<C-x>')

-- Buffer
map('n', '<space>]', vim.cmd.bnext)
map('n', '<space>[', vim.cmd.bprev)
map('n', '<space><Esc>', vim.cmd.bdelete)
map('n', '<C-d>', ':%bd!<CR>')

-- Window navigation
map('n', '<C-h>', function()
  vim.cmd.wincmd('h')
end)
map('n', '<C-j>', function()
  vim.cmd.wincmd('j')
end)
map('n', '<C-k>', function()
  vim.cmd.wincmd('k')
end)
map('n', '<C-l>', function()
  vim.cmd.wincmd('l')
end)

-- Toggle search result
map('n', '<C-n>', function()
  vim.o.hlsearch = not vim.o.hlsearch
end)

-- Source luafile
map('n', '<space>so', function()
  vim.cmd.luafile('%')
end)

-- J & K moments in Markdown
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { '*.md', '*.html', '*.txt', 'text' },
  callback = function()
    vim.opt.wrap = true
    map({ 'n', 'v' }, 'j', 'gj', { noremap = true, silent = true, buffer = true })
    map({ 'n', 'v' }, 'k', 'gk', { noremap = true, silent = true, buffer = true })
  end,
})
