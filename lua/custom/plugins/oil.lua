return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup()
    vim.keymap.set({ 'n', 'v' }, '<leader>oo', ':lua require("oil").open(vim.loop.cwd())<CR>', { noremap = true, silent = true })
  end,
}
