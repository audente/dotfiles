require('nvim-treesitter.configs').setup {
  -- ensure_installed = { "c", "lua", "rust", "ruby", "vim", "vimdoc", "query", "python", "swift", "typescript", "dart" },
  -- ensure_installed = {
  --   "c", "lua", "rust", "ruby", "vim", "vimdoc", "query",
  --    "python", "typescript", "javascript", "tsx", "jsdoc",
  --   "bash", "dart", "go", "html", "css", "json", "yaml",
  -- },
  sync_install   = false,     -- don't block startup
  auto_install   = true,      -- install missing parser when you open a file
  prefer_git = true,
  ignore_install = {},        -- never auto-install these
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}
