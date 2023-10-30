return {
  'gbprod/yanky.nvim',
  config = function()
    local mapping = require 'yanky.telescope.mapping'
    require('yanky').setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      picker = {
        select = {
          action = require('yanky.picker').actions.put 'p', -- put after cursor,
        },
        telescope = {
          mappings = {
            default = mapping.put 'p',
            -- i = {
            --   ['<CR>'] = require('yanky.picker').actions.put 'p',
            -- },
            -- n = {
            --   ['<CR>'] = require('yanky.picker').actions.put 'p',
            -- },
          },
        },
      },
    }
    vim.keymap.set({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)')
    vim.keymap.set({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)')
    -- vim.keymap.set({ 'n', 'x' }, 'gp', '<Plug>(YankyGPutAfter)')
    -- vim.keymap.set({ 'n', 'x' }, 'gP', '<Plug>(YankyGPutBefore)')
    -- vim.keymap.set('n', '<c-n>', '<Plug>(YankyCycleForward)')
    -- vim.keymap.set('n', '<c-p>', '<Plug>(YankyCycleBackward)')
  end,
}
