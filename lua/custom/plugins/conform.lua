return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  config = function()
    local slow_format_filetypes = {}
    require("conform").setup({
      formatters_by_ft = {
        bash = { "beautysh" },
        css = { { "stylelint", "prettier" } },
        html = { "prettier" },
        javascript = { "prettier", "rustywind" },
        javascriptreact = { "prettier", "rustywind" },
        json = { { "jq", "prettier" } },
        lua = { "stylua" },
        markdown = { "prettier" },
        sh = { "beautysh" },
        typescript = { "prettier", "rustywind" },
        typescriptreact = { "prettier", "rustywind" },
        zsh = { "beautysh" },

        ["*"] = { "codespell" },
        ["_"] = { "trim_whitespace" },
      },

      format_on_save = function(bufnr)
        if slow_format_filetypes[vim.bo[bufnr].filetype] then
          return
        end
        local function on_format(err)
          if err and err:match("timeout$") then
            slow_format_filetypes[vim.bo[bufnr].filetype] = true
          end
        end

        return { timeout_ms = 200, lsp_fallback = true }, on_format
      end,

      format_after_save = function(bufnr)
        if not slow_format_filetypes[vim.bo[bufnr].filetype] then
          return
        end
        return { lsp_fallback = true }
      end,

      formatters = {
        stylua = {
          prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
        },
      },
    })
  end,
}
