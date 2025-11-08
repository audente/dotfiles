require('diffview').setup({
  enhanced_diff_hl = true,
  use_icons = true,
  icons = {
    folder_closed = '',
    folder_open = '',
  },
  signs = {
    fold_closed = '',
    fold_open = '',
    done = '✓',
  },
  file_panel = {
    listing_style = 'tree',
    tree_options = {
      flatten_dirs = true,
      folder_statuses = 'only_folded',
    },
  },
})
vim.keymap.set('n', '<Leader>dv', ':DiffviewOpen<CR>')
vim.keymap.set('n', '<Leader>dc', ':DiffviewClose<CR>')
vim.keymap.set('n', '<Leader>dh', ':DiffviewFileHistory<CR>')
vim.keymap.set('n', '<Leader>dl', ':DiffviewLog<CR>')
vim.keymap.set('n', '<Leader>df', ':DiffviewToggleFiles<CR>')

