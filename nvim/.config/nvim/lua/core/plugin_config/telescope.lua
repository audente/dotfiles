require('telescope').setup()
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<Leader>fh', builtin.oldfiles, {})
vim.keymap.set('n', '<Leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Leader>ft', builtin.help_tags, {})
