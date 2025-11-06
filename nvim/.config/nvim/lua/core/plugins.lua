vim.opt.rtp:prepend(vim.fn.stdpath('data') .. '/site/pack/lazy/start/lazy.nvim')

require('lazy').setup({
  'tjdevries/colorbuddy.nvim',
  'folke/tokyonight.nvim',
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'nvim-lualine/lualine.nvim',
  'nvim-treesitter/nvim-treesitter',
  'nvim-lua/plenary.nvim',
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim", dependencies = { "williamboman/mason.nvim" } },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    lazy = false, -- Fuerza la carga inmediata
  },
  { 'nvim-telescope/telescope.nvim'},
  'vimwiki/vimwiki',
  'audente/vimwiki-git',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  --
  'github/copilot.vim',
  -- {
  --   'zbirenbaum/copilot.lua',
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   lazy = false,
  -- },
})
