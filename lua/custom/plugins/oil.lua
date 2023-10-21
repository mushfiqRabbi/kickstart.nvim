return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup({
      skip_confirm_for_simple_edits = true,
      keymaps = {
        ["<C-s>"] = false,
      }
    })
    vim.keymap.set({ 'n', 'v' }, '<leader>oo', ':lua require("oil").open(vim.loop.cwd())<CR>',
      { noremap = true, silent = true })
  end,
}
