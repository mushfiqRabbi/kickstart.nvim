return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    local be
    local bl
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      -- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
      -- vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      -- vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      -- vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      -- vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
      vim.keymap.set('t', '<C-w>q', 'exit<cr>', opts)
      vim.keymap.set('n', '<C-w>q', 'iexit<cr>', opts)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'

    require('toggleterm').setup {
      size = function(term)
        if term.direction == 'horizontal' then
          if vim.fn.hostname() == 'DESKTOP-QP9KQE3' then
            return vim.o.lines * 0.3
          elseif vim.fn.hostname() == 'DESKTOP-CKMOCDG' then
            return vim.o.lines * 0.4
          end
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        end
      end,
      persist_mode = false,
      persist_size = false,
      open_mapping = [[<c-\>]],
      on_create = function()
        -- print('on_create', term.bufnr)
      end,
      on_open = function()
        -- print('on_open', term.bufnr)
        vim.cmd 'wincmd w'
        vim.cmd 'stopinsert'
        be = vim.api.nvim_create_autocmd('BufEnter', {
          pattern = 'term://*#toggleterm#*',
          callback = function()
            vim.cmd 'resize'
            -- vim.cmd 'startinsert'
          end,
        })
        bl = vim.api.nvim_create_autocmd('BufLeave', {
          pattern = 'term://*#toggleterm#*',
          callback = function()
            if vim.fn.hostname() == 'DESKTOP-QP9KQE3' then
              vim.cmd(string.format('resize %s', vim.o.lines * 0.3))
            elseif vim.fn.hostname() == 'DESKTOP-CKMOCDG' then
              vim.cmd(string.format('resize %s', vim.o.lines * 0.4))
            end
            -- vim.cmd 'startinsert'
          end,
        })
      end,
      on_close = function()
        -- print('on_close', term.bufnr)
        vim.api.nvim_del_autocmd(be)
        vim.api.nvim_del_autocmd(bl)
      end,
      on_exit = function()
        -- print('on_exit', term)
      end,
    }
    -- vim.api.nvim_create_autocmd('BufEnter', {
    --   pattern = 'term://*#toggleterm#*',
    --   callback = function(ev)
    --     vim.cmd 'resize'
    --     -- vim.cmd 'startinsert'
    --   end,
    -- })
    -- vim.api.nvim_create_autocmd('BufLeave', {
    --   pattern = 'term://*#toggleterm#*',
    --   callback = function(ev)
    --     vim.cmd(string.format('resize %s', vim.o.lines * 0.4))
    --     -- vim.cmd 'startinsert'
    --   end,
    -- })
  end,
}
