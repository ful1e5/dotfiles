local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

local c = {
  completion = {
    autocomplete = false,
    completeopt = 'menuone,noinsert,noselect',
  },
  experimental = { ghost_text = true },
}

c.window = {
  completion = cmp.config.window.bordered(),
  documentation = cmp.config.window.bordered(),
  winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
  col_offset = -3,
  side_padding = 0,
}

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

c.mapping = {
  ['<C-Up>'] = cmp.mapping.scroll_docs(-4),
  ['<C-Down>'] = cmp.mapping.scroll_docs(4),
  ['<C-e>'] = cmp.mapping.close(),
  ['<C-n>'] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
    elseif has_words_before() then
      cmp.complete()
    else
      fallback()
    end
  end, { 'i', 's' }),
  ['<C-p>'] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end, { 'i', 's' }),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-y>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
}

c.snippet = {
  expand = function(args)
    require('luasnip').lsp_expand(args.body)
  end,
}

c.formatting = {
  format = lspkind.cmp_format(),
}

c.sources = {
  { name = 'luasnip' },
  { name = 'nvim_lsp' },
  { name = 'nvim_lua' },
  { name = 'path' },
  { name = 'spell' },
  { name = 'buffer', option = { keyword_length = 5 } },
}

cmp.setup(c)
