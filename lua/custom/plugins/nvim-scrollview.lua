return {
  'dstein64/nvim-scrollview',
  config = function()
    require('scrollview').setup {}
    vim.g.scrollview_always_show = true
  end,
}
