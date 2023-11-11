return {
  'gen740/SmoothCursor.nvim',
  config = function()
    require('smoothcursor').setup {
      -- speed = 25,
      -- intervals = 35,
      fancy = {
        enable = true,
      },
    }
  end,
}
