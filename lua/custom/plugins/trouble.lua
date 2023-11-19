return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('trouble').setup {
      height = 20,
      action_keys = {
        jump = {
          '<cr>',
          '<tab>',
          '<2-LeftMouse>',
          '<C-w>w',
        },
      },
    }
    vim.keymap.set('n', '<leader>dd', function()
      require('trouble').toggle 'document_diagnostics'
    end, { desc = '[D]iagnostic [D]ocument' })
    vim.keymap.set('n', '<leader>dw', function()
      require('trouble').toggle 'workspace_diagnostics'
    end, { desc = '[D]iagnostic [W]orkspace' })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufLeave' }, {
      pattern = '*/Trouble',
      callback = function(ev)
        if ev.event == 'BufEnter' then
          vim.cmd(string.format('resize %s', vim.o.lines * 0.4))
        elseif ev.event == 'BufLeave' then
          vim.cmd(string.format('resize %s', vim.o.lines * 0.2))
        end
      end,
    })
  end,
}
