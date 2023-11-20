return {
  'gen740/SmoothCursor.nvim',
  config = function()
    require('smoothcursor').setup {
      type = 'matrix',
      matrix = {
        head = {
          cursor = { '▷' },
        },
      },
      -- speed = 25,
      -- intervals = 35,
      -- fancy = {
      --   enable = true,
      -- },
      disable_float_win = true, -- Disable in floating windows
    }
    local autocmd = vim.api.nvim_create_autocmd

    autocmd({ 'ModeChanged' }, {
      callback = function()
        local current_mode = vim.fn.mode()
        if current_mode == 'n' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#8aadf4' })
        elseif current_mode == 'v' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#c6a0f6' })
        elseif current_mode == 'V' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#c6a0f6' })
        elseif current_mode == '\22' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#c6a0f6' })
        elseif current_mode == 'i' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#a6da95' })
        elseif current_mode == 'R' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#ed8796' })
        elseif current_mode == 'c' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#f5a97f' })
        end
      end,
    })
  end,
}
