return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    require("null-ls").setup({
      sources = {

        -- Diagnostics
        null_ls.builtins.diagnostics.alex,
        null_ls.builtins.diagnostics.codespell.with({
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity["INFO"]
          end,
        }),
        null_ls.builtins.diagnostics.dotenv_linter,
        null_ls.builtins.diagnostics.jsonlint,
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.diagnostics.selene,
        null_ls.builtins.diagnostics.stylelint,
        null_ls.builtins.diagnostics.vint,
        null_ls.builtins.diagnostics.zsh,
      },
    })
    vim.api.nvim_create_user_command("NullLsToggle", function()
      require("null-ls").toggle({})
    end, {})
  end,
}
