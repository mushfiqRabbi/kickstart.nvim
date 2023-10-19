return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup()
    vim.keymap.set({ 'n', 'v' }, '<leader>oo', ':Oil<cr>', { noremap = true, silent = true })
  end,
}
