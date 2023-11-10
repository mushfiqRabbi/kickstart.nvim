return {
  'gen740/SmoothCursor.nvim',
  config = function()
    require('smoothcursor').setup {
      -- speed = 25,
      -- intervals = 35,
      fancy = {
        enable = true,

        body = {
          { cursor = '', texthl = 'SmoothCursorRed' },
          { cursor = '', texthl = 'SmoothCursorOrange' },
          { cursor = '󰝥', texthl = 'SmoothCursorYellow' },
          { cursor = '●', texthl = 'SmoothCursorGreen' },
          { cursor = '•', texthl = 'SmoothCursorAqua' },
          { cursor = '.', texthl = 'SmoothCursorBlue' },
          { cursor = '.', texthl = 'SmoothCursorPurple' },
        },
      },
    }
  end,
}
