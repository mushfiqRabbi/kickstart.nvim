return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      -- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
      -- vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      -- vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      -- vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      -- vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
      vim.keymap.set('t', '<C-q>', 'exit<cr>', opts)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'

    require('toggleterm').setup {
      size = function(term)
        if term.direction == 'horizontal' then
          if math.floor(vim.o.lines * 0.3) < 16 then
            return 16
          else
            return math.floor(vim.o.lines * 0.3)
          end
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        end
      end,
      persist_mode = false,
      persist_size = false,
      open_mapping = [[<c-\>]],
    }
  end,
}
