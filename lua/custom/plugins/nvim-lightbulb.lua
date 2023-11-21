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
    vim.cmd 'hi LightBulbNumber cterm=italic,bold gui=italic,bold guifg=#94e2d5'
  end,
}
