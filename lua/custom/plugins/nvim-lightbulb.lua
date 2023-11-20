return {
  'kosayoda/nvim-lightbulb',
  config = function()
    require('nvim-lightbulb').setup {
      autocmd = {
        enabled = true,
        -- updatetime = -1,
        -- events = {
        --   'CursorMoved',
        --   'CursorMovedI',
        -- },
      },
      priority = 100,
    }
  end,
}
