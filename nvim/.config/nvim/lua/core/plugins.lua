--
require('silence-trim-error')

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'tjdevries/colorbuddy.nvim',
  'folke/tokyonight.nvim',
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'nvim-lualine/lualine.nvim',
  'nvim-lua/plenary.nvim',
  'vimwiki/vimwiki',
  'audente/vimwiki-git',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'tpope/vim-fugitive',
  'sindrets/diffview.nvim',
  'github/copilot.vim',
  { 'nvim-telescope/telescope.nvim'},
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim", dependencies = { "williamboman/mason.nvim" } },
  {
    "neovim/nvim-lspconfig",
    dependencies = {"nvim-treesitter/nvim-treesitter", "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    lazy = false, -- Fuerza la carga inmediata
  },
  -- plugins/treesitter.lua
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',           -- runs only when you :Lazy sync (i.e. plugin updated)
    event = { 'BufReadPost', 'BufNewFile' },
    cmd = { 'TSInstall', 'TSUpdate', 'TSUpdateSync' }, -- enables lazy-loading
    config = function()
      require('core.plugin_config.treesitter')
    end
  },
})
