return {
  'gen740/SmoothCursor.nvim',
  config = function()
    require('smoothcursor').setup {
      speed = 35,
      intervals = 25,
      fancy = {
        enable = true,
      },
    }
  end,
}
