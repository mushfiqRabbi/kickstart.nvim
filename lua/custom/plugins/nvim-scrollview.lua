return {
  'dstein64/nvim-scrollview',
  config = function()
    require('scrollview').setup {}
    vim.g.scrollview_always_show = true
    vim.g.scrollview_excluded_filetypes = { 'alpha', 'minimap' }
  end,
}
