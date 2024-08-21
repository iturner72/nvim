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
local should_profile = false
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
local package_path_str = "/home/ian/.cache/nvim/packer_hererocks/2.1.1716656478/share/lua/5.1/?.lua;/home/ian/.cache/nvim/packer_hererocks/2.1.1716656478/share/lua/5.1/?/init.lua;/home/ian/.cache/nvim/packer_hererocks/2.1.1716656478/lib/luarocks/rocks-5.1/?.lua;/home/ian/.cache/nvim/packer_hererocks/2.1.1716656478/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/ian/.cache/nvim/packer_hererocks/2.1.1716656478/lib/lua/5.1/?.so"
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
  LuaSnip = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["dingllm.nvim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/dingllm.nvim",
    url = "https://github.com/yacineMTB/dingllm.nvim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n3\0\2\a\0\3\0\0066\2\0\0009\2\1\2'\4\2\0\18\5\1\0\18\6\0\0D\2\4\0\n%s %s\vformat\vstringh\0\3\v\0\5\0\0166\3\0\0009\3\1\3'\5\2\0\18\6\1\0\15\0\2\0X\a\a€6\a\0\0009\a\1\a'\t\3\0\18\n\2\0B\a\3\2\14\0\a\0X\b\1€'\a\4\0\18\b\0\0D\3\5\0\5\f (%s%%)\14%s%s [%s]\vformat\vstringö\3\1\0\5\0\23\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0003\4\r\0=\4\1\0033\4\14\0=\4\15\3=\3\16\0025\3\18\0005\4\17\0=\4\19\3=\3\20\0025\3\21\0=\3\22\2B\0\2\1K\0\1\0\ndebug\1\0\2\vstrict\1\flogging\1\fsources\6*\1\0\1\6*\0\1\0\1\vignore\1\bfmt\ttask\0\0\1\0\5\18stack_upwards\2\fleftpad\2\14max_width\3\0\ttask\0\vfidget\0\vwindow\1\0\4\vzindex\0\rrelative\bwin\nblend\3d\vborder\tnone\ntimer\1\0\3\17spinner_rate\3}\15task_decay\3è\a\17fidget_decay\3Ð\15\nalign\1\0\2\nright\2\vbottom\2\ttext\1\0\a\ttext\0\fsources\0\nalign\0\ndebug\0\bfmt\0\vwindow\0\ntimer\0\1\0\4\14commenced\fStarted\14completed\14Completed\tdone\bâœ”\fspinner\tpipe\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  harpoon = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  nightfox = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\24colorscheme terafox\bcmd\bvim\0" },
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/nightfox",
    url = "https://github.com/edeneast/nightfox.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/octo.nvim",
    url = "https://github.com/pwntester/octo.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["swift.vim"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/swift.vim",
    url = "https://github.com/keith/swift.vim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggle-lsp-diagnostics.nvim"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/toggle-lsp-diagnostics.nvim",
    url = "https://github.com/WhoIsSethDaniel/toggle-lsp-diagnostics.nvim"
  },
  ["tree-sitter-rstml"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/tree-sitter-rstml",
    url = "https://github.com/rayliwell/tree-sitter-rstml"
  },
  undotree = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  vimtex = {
    loaded = true,
    path = "/home/ian/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nightfox
time([[Config for nightfox]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\24colorscheme terafox\bcmd\bvim\0", "config", "nightfox")
time([[Config for nightfox]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\n3\0\2\a\0\3\0\0066\2\0\0009\2\1\2'\4\2\0\18\5\1\0\18\6\0\0D\2\4\0\n%s %s\vformat\vstringh\0\3\v\0\5\0\0166\3\0\0009\3\1\3'\5\2\0\18\6\1\0\15\0\2\0X\a\a€6\a\0\0009\a\1\a'\t\3\0\18\n\2\0B\a\3\2\14\0\a\0X\b\1€'\a\4\0\18\b\0\0D\3\5\0\5\f (%s%%)\14%s%s [%s]\vformat\vstringö\3\1\0\5\0\23\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0003\4\r\0=\4\1\0033\4\14\0=\4\15\3=\3\16\0025\3\18\0005\4\17\0=\4\19\3=\3\20\0025\3\21\0=\3\22\2B\0\2\1K\0\1\0\ndebug\1\0\2\vstrict\1\flogging\1\fsources\6*\1\0\1\6*\0\1\0\1\vignore\1\bfmt\ttask\0\0\1\0\5\18stack_upwards\2\fleftpad\2\14max_width\3\0\ttask\0\vfidget\0\vwindow\1\0\4\vzindex\0\rrelative\bwin\nblend\3d\vborder\tnone\ntimer\1\0\3\17spinner_rate\3}\15task_decay\3è\a\17fidget_decay\3Ð\15\nalign\1\0\2\nright\2\vbottom\2\ttext\1\0\a\ttext\0\fsources\0\nalign\0\ndebug\0\bfmt\0\vwindow\0\ntimer\0\1\0\4\14commenced\fStarted\14completed\14Completed\tdone\bâœ”\fspinner\tpipe\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: dingllm.nvim
time([[Config for dingllm.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "dingllm.nvim")
time([[Config for dingllm.nvim]], false)

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
