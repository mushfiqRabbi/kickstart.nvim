return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha', -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = 'latte',
        dark = 'mocha',
      },
      -- transparent_background = true, -- disables setting the background color.
      -- dim_inactive = {
      --   enabled = true, -- dims the background color of inactive window
      --   shade = 'dark',
      --   percentage = 0.001, -- percentage of the shade to apply to the inactive window
      -- },
      integrations = {
        fidget = true,
        -- hop = true,
        mason = true,
        noice = true,
        notify = true,
        lsp_trouble = true,
        which_key = true,
      },
    }
    vim.cmd.colorscheme 'catppuccin-mocha'
  end,
}
