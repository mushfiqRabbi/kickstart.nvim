return {
  'ojroques/nvim-bufdel',
  config = function()
    require('bufdel').setup {
      quit = false,
    }
    vim.keymap.set({ 'n', 'v', 'i' }, '<C-q>', ':BufDel<cr>', { noremap = true, silent = true })
  end,
}
