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
        "cspell",
        "codespell",
        "jq",
        "jsonlint",
        "markdownlint",
        "marksman",
        "prettierd",
        "rustywind",
        "selene",
        "stylelint",
        "stylua",
        "vint",
      },
      handlers = {
        function() end,
      },
    })
  end,
}
