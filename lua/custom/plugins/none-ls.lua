return {
  "nvimtools/none-ls.nvim",
  config = function()
    local get_root = function(params)
      local root = vim.fn.FindRootDirectory(vim.api.nvim_buf_get_name(params.bufnr))
      if root == "" then
        return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(params.bufnr), ":p:h")
      else
        return root
      end
    end
    local null_ls = require("null-ls")
    require("null-ls").setup({
      on_attach = function()
        vim.keymap.set("n", "<leader>ca", ":CodeActionMenu<CR>", { desc = "[C]ode [A]ction Menu" })
      end,
      sources = {
        -- Code Actions
        null_ls.builtins.code_actions.cspell,

        -- Diagnostics
        null_ls.builtins.diagnostics.codespell.with({
          cwd = get_root,
          disabled_filetypes = { "oil" },
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity["INFO"]
          end,
        }),
        null_ls.builtins.diagnostics.cspell.with({
          cwd = get_root,
          disabled_filetypes = { "oil" },
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity["INFO"]
          end,
          runtime_condition = function(params)
            local root = get_root(params)
            return not string.match(
              vim.fn.system({ "fd", "-H", "-F", "-tf", "-1", "--max-depth=1", "no-cspell", root }),
              ".*no%-cspell"
            )
          end,
        }),
        null_ls.builtins.diagnostics.dotenv_linter,
        null_ls.builtins.diagnostics.jsonlint,
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
