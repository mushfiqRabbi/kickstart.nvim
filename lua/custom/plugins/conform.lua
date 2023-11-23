return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            javascript = { "prettier" },
            javascriptreact = { "prettier" },
            typescript = { "prettier" },
            typescriptreact = { "prettier" },
            json = { "jq" },
            zsh = { "beautysh" },

            ["*"] = { "codespell" },
            ["_"] = { "trim_whitespace" },
        },

        format_on_save = { timeout_ms = 1000, lsp_fallback = true },

        formatters = {
            stylua = {
                prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" },
            },
            prettier = {
                prepend_args = { "--tab-width", "4" },
            },
            jq = {
                prepend_args = { "--indent", "4" },
            },
        },
    },
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
