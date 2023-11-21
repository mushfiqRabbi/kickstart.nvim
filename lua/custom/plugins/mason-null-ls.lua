return {
  'jay-babu/mason-null-ls.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'williamboman/mason.nvim',
    'nvimtools/none-ls.nvim',
  },
  config = function()
    require('mason-null-ls').setup {
      ensure_installed = { 'cspell', 'eslint_d', 'prettierd', 'stylua', 'codespell', 'beautysh', 'marksman' },
    }
  end,
}
