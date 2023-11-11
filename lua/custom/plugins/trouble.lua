return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    action_keys = {
      jump = {
        '<cr>',
        '<tab>',
        '<2-LeftMouse>',
        '<C-w>w',
      },
    },
  },
  config = function()
    vim.keymap.set('n', '<leader>dd', function()
      require('trouble').toggle 'document_diagnostics'
    end, { desc = '[D]iagnostic [D]ocument' })
    vim.keymap.set('n', '<leader>dw', function()
      require('trouble').toggle 'workspace_diagnostics'
    end, { desc = '[D]iagnostic [W]orkspace' })
    -- vim.keymap.set('n', '<leader>ql', function()
    --   require('trouble').toggle 'quickfix'
    -- end, { desc = '[Q]uickfix [L]ist' })
    -- Lua
    -- vim.keymap.set('n', '<leader>xx', function()
    --   require('trouble').toggle()
    -- end)
    -- vim.keymap.set('n', '<leader>xw', function()
    --   require('trouble').toggle 'workspace_diagnostics'
    -- end)
    -- vim.keymap.set('n', '<leader>xd', function()
    --   require('trouble').toggle 'document_diagnostics'
    -- end)
    -- vim.keymap.set('n', '<leader>xq', function()
    --   require('trouble').toggle 'quickfix'
    -- end)
    -- vim.keymap.set('n', '<leader>xl', function()
    --   require('trouble').toggle 'loclist'
    -- end)
    -- vim.keymap.set('n', 'gR', function()
    --   require('trouble').toggle 'lsp_references'
    -- end)
  end,
}
