return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  config = function()
    local slow_format_filetypes = {}
    require("conform").setup({
      formatters_by_ft = {
        bash = { "beautysh" },
        css = { { "stylelint", "prettierd", "prettier" } },
        html = { { "prettierd", "prettier" } },
        javascript = { { "prettierd", "prettier" }, "rustywind" },
        javascriptreact = { { "prettierd", "prettier" }, "rustywind" },
        json = { { "jq", "prettierd", "prettier" } },
        lua = { "stylua" },
        markdown = { { "prettierd", "prettier" } },
        sh = { "beautysh" },
        typescript = { { "prettierd", "prettier" }, "rustywind" },
        typescriptreact = { { "prettierd", "prettier" }, "rustywind" },
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
