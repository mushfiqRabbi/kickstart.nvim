return {
  'shellRaining/hlchunk.nvim',
  event = { 'UIEnter' },
  config = function()
    require('hlchunk').setup {
      blank = {
        enable = false,
        use_treesitter = true,
      },
      line_num = {
        enable = false,
      },
    }
  end,
}
