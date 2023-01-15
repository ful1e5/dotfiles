-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = true
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/kaiz/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/kaiz/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/kaiz/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/kaiz/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/kaiz/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["asciitree.nvim"] = {
    loaded = true,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/start/asciitree.nvim",
    url = "https://github.com/cloudysake/asciitree.nvim"
  },
  ["caret.nvim"] = {
    config = { "\27LJ\2\n=\0\0\4\0\3\0\0056\0\0\0006\2\1\0'\3\2\0B\0\3\1K\0\1\0\24ful1e5.themes.caret\frequire\npcall\0" },
    loaded = true,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/start/caret.nvim",
    url = "/home/kaiz/GitHub/projekt0n/caret.nvim"
  },
  ["circles.nvim"] = {
    loaded = true,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/start/circles.nvim",
    url = "/home/kaiz/GitHub/projekt0n/circles.nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/kaiz/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "/home/kaiz/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after_files = { "/home/kaiz/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-spell"] = {
    after_files = { "/home/kaiz/.local/share/nvim/site/pack/packer/opt/cmp-spell/after/plugin/cmp-spell.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/opt/cmp-spell",
    url = "https://github.com/f3fora/cmp-spell"
  },
  ["cmp-vsnip"] = {
    after_files = { "/home/kaiz/.local/share/nvim/site/pack/packer/opt/cmp-vsnip/after/plugin/cmp_vsnip.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/opt/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  colorizer = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/opt/colorizer",
    url = "https://github.com/lilydjwg/colorizer"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\nç\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\vwindow\1\0\1\vborder\frounded\ttext\1\0\0\1\0\2\fspinner\19square_corners\tdone\t ÔÄå\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["friendly-snippets"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/opt/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["github-nvim-theme"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/start/github-nvim-theme",
    url = "/home/kaiz/GitHub/projekt0n/github-nvim-theme"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nA\0\0\4\0\3\0\0056\0\0\0006\2\1\0'\3\2\0B\0\3\1K\0\1\0\28ful1e5.plugins.gitsigns\frequire\npcall\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["luv-vimdocs"] = {
    loaded = true,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/start/luv-vimdocs",
    url = "https://github.com/nanotee/luv-vimdocs"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\n@\0\0\4\0\3\0\0056\0\0\0006\2\1\0'\3\2\0B\0\3\1K\0\1\0\27ful1e5.plugins.null-ls\frequire\npcall\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/opt/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nB\0\0\4\0\3\0\0056\0\0\0006\2\1\0'\3\2\0B\0\3\1K\0\1\0\29ful1e5.plugins.autopairs\frequire\npcall\0" },
    load_after = {
      ["nvim-cmp"] = true,
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-nvim-lua", "cmp-spell", "cmp-vsnip", "cmp-buffer", "nvim-autopairs", "nvim-lspconfig", "vim-vsnip", "cmp-path" },
    config = { "\27LJ\2\n<\0\0\4\0\3\0\0056\0\0\0006\2\1\0'\3\2\0B\0\3\1K\0\1\0\23ful1e5.plugins.cmp\frequire\npcall\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n:\0\0\4\0\3\0\0056\0\0\0006\2\1\0'\3\2\0B\0\3\1K\0\1\0\21ful1e5.lsp.mason\frequire\npcall\0" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-luaref"] = {
    loaded = true,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/start/nvim-luaref",
    url = "https://github.com/milisims/nvim-luaref"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\nk\0\0\4\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0006\1\0\0'\3\1\0B\1\2\2=\1\1\0K\0\1\0\bvim\1\0\2\vstages\nslide\ftimeout\3Ù\3\nsetup\vnotify\frequire\0" },
    loaded = true,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\nF\0\0\4\0\3\0\0056\0\0\0006\2\1\0'\3\2\0B\0\3\1K\0\1\0!ful1e5.plugins.nvim-surround\frequire\npcall\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/opt/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nB\0\0\4\0\3\0\0056\0\0\0006\2\1\0'\3\2\0B\0\3\1K\0\1\0\29ful1e5.plugins.nvim-tree\frequire\npcall\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-ts-autotag", "nvim-autopairs", "playground" },
    config = { "\27LJ\2\nH\0\0\4\0\3\0\0056\0\0\0006\2\1\0'\3\2\0B\0\3\1K\0\1\0#ful1e5.plugins.nvim-treesitter\frequire\npcall\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/opt/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    config = { "\27LJ\2\ng\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\26<Plug>PlenaryTestFile\r<space>t\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nB\0\0\4\0\3\0\0056\0\0\0006\2\1\0'\3\2\0B\0\3\1K\0\1\0\29ful1e5.plugins.telescope\frequire\npcall\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-fugitive"] = {
    config = { "\27LJ\2\nA\0\0\4\0\3\0\0056\0\0\0006\2\1\0'\3\2\0B\0\3\1K\0\1\0\28ful1e5.plugins.fugitive\frequire\npcall\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/opt/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-startuptime"] = {
    config = { "\27LJ\2\nZ\0\0\5\0\a\0\n6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0006\4\0\0009\4\5\0049\4\6\4B\0\4\1K\0\1\0\16StartupTime\bcmd\14<space>st\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/start/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["vim-vsnip"] = {
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/home/kaiz/.local/share/nvim/site/pack/packer/opt/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: markdown-preview.nvim
time([[Setup for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\rmarkdown\19mkdp_filetypes\6g\bvim\0", "setup", "markdown-preview.nvim")
time([[Setup for markdown-preview.nvim]], false)
-- Config for: caret.nvim
time([[Config for caret.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\4\0\3\0\0056\0\0\0006\2\1\0'\3\2\0B\0\3\1K\0\1\0\24ful1e5.themes.caret\frequire\npcall\0", "config", "caret.nvim")
time([[Config for caret.nvim]], false)
-- Config for: github-nvim-theme
time([[Config for github-nvim-theme]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "github-nvim-theme")
time([[Config for github-nvim-theme]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\nç\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\vwindow\1\0\1\vborder\frounded\ttext\1\0\0\1\0\2\fspinner\19square_corners\tdone\t ÔÄå\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: plenary.nvim
time([[Config for plenary.nvim]], true)
try_loadstring("\27LJ\2\ng\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\26<Plug>PlenaryTestFile\r<space>t\6n\bset\vkeymap\bvim\0", "config", "plenary.nvim")
time([[Config for plenary.nvim]], false)
-- Config for: vim-startuptime
time([[Config for vim-startuptime]], true)
try_loadstring("\27LJ\2\nZ\0\0\5\0\a\0\n6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0006\4\0\0009\4\5\0049\4\6\4B\0\4\1K\0\1\0\16StartupTime\bcmd\14<space>st\6n\bset\vkeymap\bvim\0", "config", "vim-startuptime")
time([[Config for vim-startuptime]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\nk\0\0\4\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0006\1\0\0'\3\1\0B\1\2\2=\1\1\0K\0\1\0\bvim\1\0\2\vstages\nslide\ftimeout\3Ù\3\nsetup\vnotify\frequire\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertCharPre * ++once lua require("packer.load")({'friendly-snippets'}, { event = "InsertCharPre *" }, _G.packer_plugins)]]
vim.cmd [[au CursorHold * ++once lua require("packer.load")({'vim-fugitive', 'colorizer', 'telescope.nvim'}, { event = "CursorHold *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-treesitter', 'nvim-cmp', 'gitsigns.nvim', 'Comment.nvim', 'null-ls.nvim', 'nvim-surround', 'nvim-lspconfig'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au BufEnter * ++once lua require("packer.load")({'lualine.nvim', 'nvim-tree.lua'}, { event = "BufEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
