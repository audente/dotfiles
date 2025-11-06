-- Configuración de Copilot
-- require('copilot').setup({
--   suggestion = {
--     enabled = true,
--     auto_trigger = true,
--     keymap = {
--       accept = "<C-a>",  -- Aceptar toda la sugerencia
--       next = "<C-j>",    -- Siguiente sugerencia
--       prev = "<C-k>",    -- Anterior sugerencia
--       dismiss = "<C-l>", -- Descartar sugerencia
--     },
--   },
--   filetypes = {
--     ["*"] = true, -- Habilitar para todos los tipos de archivo
--   },
-- })

-- Mapeos adicionales en modo inserción
vim.keymap.set('i', '<C-w>', function() require('copilot.suggestion').accept_word() end, { silent = true })
vim.keymap.set('i', '<C-e>', function() require('copilot.suggestion').accept_line() end, { silent = true })

-- Mapeos en modo normal
vim.keymap.set('n', '<Leader>ct', '<Cmd>Copilot toggle<CR>', { silent = true })
vim.keymap.set('n', '<Leader>ce', '<Cmd>Copilot enable<CR>', { silent = true })
vim.keymap.set('n', '<Leader>cd', '<Cmd>Copilot disable<CR>', { silent = true })
vim.keymap.set('n', '<Leader>cs', '<Cmd>Copilot status<CR>', { silent = true })
