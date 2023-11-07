return {
  'mawkler/modicator.nvim',
  -- dependencies = 'navarasu/onedark.nvim', -- Add your colorscheme plugin here
  dependencies = 'folke/tokyonight.nvim', -- Add your colorscheme plugin here
  event = 'VeryLazy',
  init = function()
    -- These are required for Modicator to work
    -- vim.o.cursorline = true
    -- vim.o.number = true
    -- vim.o.termguicolors = true
  end,
  opts = {
    show_warnings = false,
  },
}
