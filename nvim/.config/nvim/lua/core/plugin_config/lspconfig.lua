require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "pyright", "ts_ls" },
})


vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {
          'vim',
          'require',
        },
      },
    },
  },
})

vim.lsp.config('pyright', {
  settings = {
    python = {
      diagnostics = {
        globals = {
          'vim',
          'require',
        },
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = "openFilesOnly",
            useLibraryCodeForTypes = true,
          },
      },
    },
  },
})



vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local opts = { buffer = bufnr, noremap = true, silent = true }
    vim.keymap.set('n', '<Leader>cr', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<Leader>cn', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<Leader>cp', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<Leader>cd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<Leader>ci', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<Leader>cf', require('telescope.builtin').lsp_references, opts)
    vim.keymap.set('n', '<Leader>ch', vim.lsp.buf.hover, opts)
  end,
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

local signs = { Error = "✘", Warn = "▲", Hint = "➤", Info = "ℹ" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
