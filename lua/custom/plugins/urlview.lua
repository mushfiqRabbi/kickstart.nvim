return {
  'mushfiqRabbi/urlview.nvim',
  branch = 'tork',
  config = function()
    require('urlview').setup {
      -- custom configuration options --
      default_picker = 'telescope',
      default_action = 'system',
    }
  end,
}
