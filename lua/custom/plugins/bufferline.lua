return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {
      -- options = {
      --   always_show_bufferline = false,
      -- },
    }
    vim.keymap.set({ 'n', 'i', 'v' }, '<C-l>', '<cmd>BufferLineCycleNext<cr>', { noremap = true, silent = true })
    vim.keymap.set({ 'n', 'i', 'v' }, '<C-h>', '<cmd>BufferLineCyclePrev<cr>', { noremap = true, silent = true })
  end,
}
