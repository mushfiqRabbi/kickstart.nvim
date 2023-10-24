return {
  'shellRaining/hlchunk.nvim',
  event = { 'UIEnter' },
  config = function()
    require('hlchunk').setup {
      chunk = {
        style = {
          { fg = '#abb2bf' },
          { fg = '#c21f30' }, -- this fg is used to highlight wrong chunk
        },
      },
      indent = {
        enable = true,
      },
      blank = {
        enable = false,
      },
      line_num = {
        enable = false,
      },
    }
  end,
}