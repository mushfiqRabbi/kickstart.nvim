return {
  'kosayoda/nvim-lightbulb',
  config = function()
    require('nvim-lightbulb').setup {
      autocmd = {
        enabled = true,
      },
      number = {
        enabled = true,
        -- hl = "SmoothCursor"
      },
    }

    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      callback = function()
        if vim.lsp.buf.server_ready() then
          local r, _ = unpack(vim.api.nvim_win_get_cursor(0))
          if next(vim.diagnostic.get(0, { lnum = r - 1 })) ~= nil then
            vim.cmd 'hi LightBulbNumber cterm=bold,italic gui=bold,italic guifg=#fde154'
          end
        end
      end,
    })
  end,
}
