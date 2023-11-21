return {
  'kosayoda/nvim-lightbulb',
  config = function()
    require('nvim-lightbulb').setup {
      autocmd = {
        enabled = true,
      },
      number = {
        enabled = true,
      },
    }

    vim.cmd 'hi LightBulbNumber guifg=#fde154'
  end,
}
