return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").setup({
      override_by_filename = {
        [".env.local"] = {
          icon = "",
          color = "#f1fa8c",
          name = "DevIconEnv",
        },
      },
    })
  end,
}
