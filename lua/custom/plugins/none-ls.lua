return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local get_root = function()
      local root = vim.fn.FindRootDirectory()
      if root == "" then
        return vim.fn.expand("%:p:h")
      else
        return root
      end
    end
    require("null-ls").setup({
      on_attach = function()
        vim.keymap.set("n", "<leader>ca", ":CodeActionMenu<CR>", { desc = "[C]ode [A]ction Menu" })
      end,
      sources = {
        -- Code Actions
        null_ls.builtins.code_actions.cspell,

        -- Diagnostics
        null_ls.builtins.diagnostics.alex,
        null_ls.builtins.diagnostics.codespell.with({
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity["INFO"]
          end,
        }),
        null_ls.builtins.diagnostics.cspell.with({
          disabled_filetypes = { "oil" },
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity["INFO"]
          end,
          runtime_condition = function()
            return get_root() ~= "/home/mushfiq/.config/nvim"
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
