return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    -- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    require("null-ls").setup({
      sources = {

        -- Code Actions
        null_ls.builtins.code_actions.cspell.with({
          disabled_filetypes = { "lua", "sh", "oil", "markdown" },
        }),
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.code_actions.shellcheck,
        -- null_ls.builtins.code_actions.xo,

        -- Diagnostics
        null_ls.builtins.diagnostics.alex,
        null_ls.builtins.diagnostics.codespell,
        null_ls.builtins.diagnostics.cspell.with({
          disabled_filetypes = { "lua", "sh", "oil", "markdown" },
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity["INFO"]
          end,
        }),
        null_ls.builtins.diagnostics.dotenv_linter,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.jsonlint,
        null_ls.builtins.diagnostics.luacheck,
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.diagnostics.stylelint,
        -- null_ls.builtins.diagnostics.typos,
        null_ls.builtins.diagnostics.vint,
        -- null_ls.builtins.diagnostics.xo,
        null_ls.builtins.diagnostics.zsh,

        -- Formatting
        -- null_ls.builtins.formatting.beautysh,
        -- null_ls.builtins.formatting.codespell,
        -- null_ls.builtins.formatting.jq,
        -- null_ls.builtins.formatting.prettierd,
        -- null_ls.builtins.formatting.stylua.with({
        --   extra_args = { "--indent-type", "Spaces", "--indent-width", "2" },
        -- }),
        -- null_ls.builtins.formatting.trim_whitespace,
      },

      -- Format on save
      -- on_attach = function(client, bufnr)
      --   if client.supports_method("textDocument/formatting") then
      --     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      --     vim.api.nvim_create_autocmd("BufWritePre", {
      --       group = augroup,
      --       buffer = bufnr,
      --       callback = function()
      --         vim.lsp.buf.format({
      --           async = false,
      --           bufnr = bufnr,
      --           filter = function(c)
      --             return c.name == "null-ls"
      --           end,
      --         })
      --       end,
      --     })
      --   end
      -- end,
    })
  end,
}
