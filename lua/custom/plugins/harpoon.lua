return {
  'ThePrimeagen/harpoon',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    vim.keymap.set({ 'n', 'v' }, '<leader>mf', function()
      require('harpoon.mark').add_file()
    end, { noremap = true, desc = '[Mark] [F]ile' })
    vim.keymap.set({ 'n', 'v', 'i' }, '<C-i>', function()
      require('harpoon.ui').nav_next()
    end, { noremap = true, desc = 'Harpoon next' })
    vim.keymap.set({ 'n', 'v', 'i' }, '<C-o>', function()
      require('harpoon.ui').nav_next()
    end, { noremap = true, desc = 'Harpoon next' })
    vim.keymap.set({ 'n', 'v' }, '<leader>mm', function()
      require('harpoon.ui').toggle_quick_menu()
    end, { noremap = true, desc = '[M]ark [M]enu' })
  end,
}