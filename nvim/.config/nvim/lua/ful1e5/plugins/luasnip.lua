local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local types = require('luasnip.util.types')

ls.setup({
  history = true,
  -- Update more often, :h events for more info.
  update_events = 'TextChanged,TextChangedI',
  -- Snippets aren't automatically removed if their text is deleted.
  -- `delete_check_events` determines on which events (:h events) a check for
  -- deleted snippets is performed.
  -- This can be especially useful when `history` is enabled.
  delete_check_events = 'TextChanged',
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { 'choiceNode', 'Comment' } },
      },
    },
    -- Display a cursor-like placeholder in unvisited nodes
    -- of the snippet.
    ext_opts = {
      [types.insertNode] = {
        unvisited = {
          virt_text = { { '|', 'Conceal' } },
          virt_text_pos = 'inline',
        },
      },
      -- This is needed because LuaSnip differentiates between $0 and other
      -- placeholders (exitNode and insertNode). So this will highlight the last
      -- jump node.
      [types.exitNode] = {
        unvisited = {
          virt_text = { { '|', 'Conceal' } },
          virt_text_pos = 'inline',
        },
      },
    },
  },
  -- treesitter-hl has 100, use something higher (default is 200).
  ext_base_prio = 300,
  -- minimal increase in priority.
  ext_prio_increase = 1,
  enable_autosnippets = true,
  -- mapping for cutting selected text so it's usable as SELECT_DEDENT,
  -- SELECT_RAW or TM_SELECTED_TEXT (mapped via xmap).
  store_selection_keys = '<Tab>',
  -- luasnip uses this function to get the currently active filetype. This
  -- is the (rather uninteresting) default, but it's possible to use
  -- eg. treesitter for getting the current filetype by setting ft_func to
  -- require("luasnip.extras.filetype_functions").from_cursor (requires
  -- `nvim-treesitter/nvim-treesitter`). This allows correctly resolving
  -- the current filetype in eg. a markdown-code block or `vim.cmd()`.
  ft_func = function()
    ---@diagnostic disable-next-line: param-type-mismatch
    return vim.split(vim.bo.filetype, '.', true)
  end,
})

ls.add_snippets('lua', {
  s('pt', { t('print('), i(1, '...'), t(')') }),
  s('ipt', { t('print(vim.inspect({'), i(1, '...'), t('}))') }),
  s('fn', { t('local '), i(1), t(' = function('), i(2, 'args'), t({ ')', '\t' }), i(3, '...'), t({ '', 'end' }) }),
  s('mfn', { t('M.'), i(1), t(' = function( '), i(2), t({ ')', '\t' }), i(3), t({ '', 'end' }) }),
})

ls.add_snippets('typescript', {
  s('log', { t('console.log('), i(1), t(')') }),
  s('err', { t('console.error('), i(1), t(')') }),
  s('oimp', { t('import { '), i(1), t(' } from "'), i(2), t('"') }),
  s('exp', { t('export { '), i(1), t(' }"') }),
})

require('luasnip.loaders.from_vscode').lazy_load()
