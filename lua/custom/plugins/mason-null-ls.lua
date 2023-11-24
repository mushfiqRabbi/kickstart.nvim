return {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
  config = function()
    require("mason-null-ls").setup({
      ensure_installed = {
        "alex",
        "beautysh",
        "codespell",
        "cspell",
        "eslint_d",
        "jq",
        "jsonlint",
        -- "luacheck",
        "markdownlint",
        "marksman",
        "prettierd",
        "remark-cli",
        "rustywind",
        "selene",
        -- "shellcheck",
        "stylelint",
        "stylua",
        -- "typos",
        "vint",
      },
    })
  end,
}
