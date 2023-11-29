return {
  "JMarkin/nvim-tree.lua-float-preview",
  lazy = true,
  config = function()
    require("float-preview").setup({
      window = {
        wrap = true,
        open_win_config = function()
          local HEIGHT_RATIO = 0.9 -- You can change this
          local WIDTH_RATIO = 0.5 -- You can change this too
          local screen_w = vim.opt.columns:get()
          local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
          local window_w = screen_w * WIDTH_RATIO
          local window_h = screen_h * HEIGHT_RATIO
          local window_w_int = math.floor(window_w)
          local window_h_int = math.floor(window_h)
          local center_x = math.floor((screen_w - (screen_w * 0.3)) / 8) + (screen_w * 0.3) + 2
          local center_y = math.floor((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
          return {
            border = "single",
            relative = "editor",
            row = center_y,
            col = center_x,
            width = window_w_int,
            height = window_h_int,
          }
        end,
      },
    })
  end,
}
