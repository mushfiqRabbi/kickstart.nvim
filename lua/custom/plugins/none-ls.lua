return {
  "nvimtools/none-ls.nvim",
  config = function()
    local get_root = function()
      return vim.fn.FindRootDirectory()
    end
    local null_ls = require("null-ls")
    require("null-ls").setup({
      sources = {

        -- Code Actions
        null_ls.builtins.code_actions.cspell.with({
          cwd = get_root,
          runtime_condition = function()
            return get_root() ~= "/home/mushfiq/.config/nvim"
          end,
          disabled_filetypes = { "oil" },
        }),
        null_ls.builtins.code_actions.eslint_d.with({
          cwd = get_root,
        }),

        -- Diagnostics
        null_ls.builtins.diagnostics.alex.with({
          cwd = get_root,
        }),
        null_ls.builtins.diagnostics.codespell.with({
          cwd = get_root,
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity["INFO"]
          end,
        }),
        null_ls.builtins.diagnostics.cspell.with({
          cwd = get_root,
          runtime_condition = function()
            return get_root() ~= "/home/mushfiq/.config/nvim"
          end,
          disabled_filetypes = { "oil" },
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity["INFO"]
          end,
        }),
        null_ls.builtins.diagnostics.dotenv_linter.with({
          cwd = get_root,
        }),
        null_ls.builtins.diagnostics.eslint_d.with({
          cwd = get_root,
        }),
        null_ls.builtins.diagnostics.jsonlint.with({
          cwd = get_root,
        }),
        null_ls.builtins.diagnostics.markdownlint.with({
          cwd = get_root,
        }),
        null_ls.builtins.diagnostics.selene.with({
          cwd = get_root,
        }),
        null_ls.builtins.diagnostics.stylelint.with({
          cwd = get_root,
        }),
        null_ls.builtins.diagnostics.vint.with({
          cwd = get_root,
        }),
        null_ls.builtins.diagnostics.zsh.with({
          cwd = get_root,
        }),
      },
    })
    vim.api.nvim_create_user_command("NullLsToggle", function()
      require("null-ls").toggle({})
    end, {})
  end,
}
