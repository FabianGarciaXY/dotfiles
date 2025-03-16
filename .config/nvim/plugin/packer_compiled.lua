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
local package_path_str = "/root/.cache/nvim/packer_hererocks/2.1.1713484068/share/lua/5.1/?.lua;/root/.cache/nvim/packer_hererocks/2.1.1713484068/share/lua/5.1/?/init.lua;/root/.cache/nvim/packer_hererocks/2.1.1713484068/lib/luarocks/rocks-5.1/?.lua;/root/.cache/nvim/packer_hererocks/2.1.1713484068/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/root/.cache/nvim/packer_hererocks/2.1.1713484068/lib/lua/5.1/?.so"
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
  ["SmoothCursor.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/SmoothCursor.nvim",
    url = "https://github.com/gen740/SmoothCursor.nvim"
  },
  ["ash.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/ash.nvim",
    url = "https://github.com/drewxs/ash.nvim"
  },
  ["ayu-vim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/ayu-vim",
    url = "https://github.com/ayu-theme/ayu-vim"
  },
  ["buffer_manager.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/buffer_manager.nvim",
    url = "https://github.com/j-morano/buffer_manager.nvim"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  catppuccin = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cool-substitute.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/cool-substitute.nvim",
    url = "https://github.com/otavioschwanck/cool-substitute.nvim"
  },
  ["dhall-vim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/dhall-vim",
    url = "https://github.com/vmchale/dhall-vim"
  },
  ["diagflow.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/diagflow.nvim",
    url = "https://github.com/dgagn/diagflow.nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  embark = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/embark",
    url = "https://github.com/embark-theme/vim"
  },
  ["fern.vim"] = {
    after = { "vim-fern-renderer-nerdfont" },
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/root/.local/share/nvim/site/pack/packer/opt/fern.vim",
    url = "https://github.com/lambdalisue/fern.vim"
  },
  fzf = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf-lua"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/fzf-lua",
    url = "https://github.com/ibhagwan/fzf-lua"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["git-blame.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/git-blame.nvim",
    url = "https://github.com/f-person/git-blame.nvim"
  },
  ["goto-preview"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/goto-preview",
    url = "https://github.com/rmagatti/goto-preview"
  },
  ["hlchunk.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/hlchunk.nvim",
    url = "https://github.com/shellRaining/hlchunk.nvim"
  },
  ["kanagawa.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["keepcursor.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/keepcursor.nvim",
    url = "https://github.com/rlychrisg/keepcursor.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["minimal.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/minimal.nvim",
    url = "https://github.com/Yazeed1s/minimal.nvim"
  },
  molokai = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/molokai",
    url = "https://github.com/tomasr/molokai"
  },
  ["namu.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/namu.nvim",
    url = "https://github.com/bassamsdata/namu.nvim"
  },
  neogit = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/NeogitOrg/neogit"
  },
  ["neoscroll.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  ["noice.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/noice.nvim",
    url = "https://github.com/folke/noice.nvim"
  },
  ["notebook.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/notebook.nvim",
    url = "https://github.com/meatballs/notebook.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["onedarkpro.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/onedarkpro.nvim",
    url = "https://github.com/olimorris/onedarkpro.nvim"
  },
  ["outline.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/outline.nvim",
    url = "https://github.com/hedyhli/outline.nvim"
  },
  ["oxocarbon.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/oxocarbon.nvim",
    url = "https://github.com/nyoom-engineering/oxocarbon.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["render-markdown.nvim"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/render-markdown.nvim",
    url = "https://github.com/MeanderingProgrammer/render-markdown.nvim"
  },
  ["rose-pine"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["tokyodark.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/tokyodark.nvim",
    url = "https://github.com/tiagovla/tokyodark.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["true-zen.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/true-zen.nvim",
    url = "https://github.com/Pocco81/true-zen.nvim"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-fern-renderer-nerdfont"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/vim-fern-renderer-nerdfont",
    url = "https://github.com/lambdalisue/vim-fern-renderer-nerdfont"
  },
  ["vim-monokai"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-monokai",
    url = "https://github.com/ku1ik/vim-monokai"
  },
  ["vim-nerdfont"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-nerdfont",
    url = "https://github.com/lambdalisue/vim-nerdfont"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  }
}

time([[Defining packer_plugins]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter ]]
vim.cmd [[ packadd render-markdown.nvim ]]
vim.cmd [[ packadd vim-nerdfont ]]
vim.cmd [[ packadd fern.vim ]]
vim.cmd [[ packadd vim-fern-renderer-nerdfont ]]
time([[Sequenced loading]], false)

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
