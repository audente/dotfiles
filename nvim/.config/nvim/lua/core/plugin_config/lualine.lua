require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
      {
        'filename',
        path = 1,
      }
    }
  }
}
