return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
      json = { "jq" },
      zsh = { "beautysh" },

      ["*"] = { "codespell" },
      ["_"] = { "trim_whitespace" },
    },

    format_on_save = { timeout_ms = 500, lsp_fallback = true },

    formatters = {
      stylua = {
        prepend_args = { "--indent-type=Spaces", "--indent-width=2" },
      },
    },
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
