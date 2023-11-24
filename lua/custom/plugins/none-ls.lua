return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    require("null-ls").setup({
      sources = {

        -- Code Actions
        null_ls.builtins.code_actions.cspell.with({
          disabled_filetypes = { "lua", "sh", "oil", "markdown" },
        }),
        null_ls.builtins.code_actions.eslint_d,
        -- null_ls.builtins.code_actions.shellcheck,

        -- Diagnostics
        null_ls.builtins.diagnostics.alex,
        null_ls.builtins.diagnostics.codespell.with({
          cwd = function()
            return vim.fn.FindRootDirectory()
          end,
          disabled_filetypes = { "oil" },
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity["INFO"]
          end,
        }),
        null_ls.builtins.diagnostics.cspell.with({
          disabled_filetypes = { "lua", "sh", "oil", "markdown" },
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity["INFO"]
          end,
        }),
        null_ls.builtins.diagnostics.dotenv_linter,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.jsonlint,
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.diagnostics.selene.with({
          cwd = function()
            return vim.fn.FindRootDirectory()
          end,
        }),
        -- null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.diagnostics.stylelint,
        null_ls.builtins.diagnostics.vint,
        null_ls.builtins.diagnostics.zsh,
      },
    })
    vim.api.nvim_create_user_command("NullLsToggle", function()
      -- you can also create commands to disable or enable sources
      require("null-ls").toggle({})
    end, {})
  end,
}
