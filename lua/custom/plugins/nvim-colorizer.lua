return {
  "NvChad/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      filetypes = {
        "css",
        "html",
        "javascriptreact",
        "typescriptreact",
      },
    })
  end,
}
