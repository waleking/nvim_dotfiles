require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'nightfly',
  },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 2,
      }
    }
  }
}
