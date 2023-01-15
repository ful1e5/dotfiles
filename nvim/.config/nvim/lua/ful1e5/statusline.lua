-- statusline
-- %<                                             trim from here
-- %{fugitive#head()}                             name of the current branch (needs fugitive.vim)
-- %f                                             path+filename
-- %m                                             check modifi{ed,able}
-- %r                                             check readonly
-- %w                                             check preview window
-- %=                                             left/right separator
-- %l/%L,%c                                       rownumber/total,colnumber
-- %{&fileencoding?&fileencoding:&encoding}       file encoding
vim.opt.statusline =
  '  %< %{FugitiveHead()}  %f %m %r %w %= Ln %l, Col %c  %{&fileencoding?&fileencoding:&encoding}  '

-- minimal statusline on start
_G.laststatus = 0
vim.opt.laststatus = _G.laststatus

-- toggle statusline
vim.keymap.set('n', '<space>z', function()
  if _G.laststatus == 0 then
    _G.laststatus = 2
  else
    _G.laststatus = 0
  end
  vim.opt.laststatus = _G.laststatus
end)
