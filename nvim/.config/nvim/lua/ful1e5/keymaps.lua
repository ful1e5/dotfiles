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
map('n', '<space><Esc>', function()
  vim.api.nvim_buf_delete(0, { force = true })
end)
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
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  pattern = { '*.md', '*.html', '*.txt', 'text' },
  callback = function()
    vim.cmd('setlocal wrap')
    map({ 'n', 'v' }, 'j', 'gj', { noremap = true, silent = true, buffer = true })
    map({ 'n', 'v' }, 'k', 'gk', { noremap = true, silent = true, buffer = true })
  end,
})

-- toggleterm.nvim Keybind (ONLY IN NEOVIDE)
if vim.g.neovide then
  map('n', '<C-~>', [[<Cmd>ToggleTerm direction=horizontal<CR>]])
  map('n', '<C-`>', [[<Cmd>ToggleTerm direction=vertical<CR>]])
  map('n', '<C-1>', [[<Cmd>ToggleTerm direction=float<CR>]])

  -- Terminal window movement mappings
  function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  end

  -- if you only want these mappings for toggle term use term://*toggleterm#* instead
  vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
end
