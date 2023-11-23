return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    require("null-ls").setup({
      sources = {

        -- Code Actions
        null_ls.builtins.code_actions.cspell.with({
          disabled_filetypes = { "lua", "sh", "oil", "markdown" },
        }),
        null_ls.builtins.code_actions.eslint_d,

        -- Diagnostics
        null_ls.builtins.diagnostics.codespell,
        null_ls.builtins.diagnostics.cspell.with({
          disabled_filetypes = { "lua", "sh", "oil", "markdown" },
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity["INFO"]
          end,
        }),
        null_ls.builtins.diagnostics.eslint_d,

        -- Formatting
        null_ls.builtins.formatting.codespell,
        null_ls.builtins.formatting.jq,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.stylua.with({
          extra_args = { "--indent-type", "Spaces", "--indent-width", "2" },
        }),
        null_ls.builtins.formatting.trim_whitespace,
      },

      -- Format on save
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                async = false,
                bufnr = bufnr,
                filter = function(c)
                  return c.name == "null-ls"
                end,
              })
            end,
          })
        end
      end,
    })
  end,
}
