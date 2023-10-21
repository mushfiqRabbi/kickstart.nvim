return {
  'goolord/alpha-nvim',
  dependencies = {
    'MaximilianLloyd/ascii.nvim',
  },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'
    local ascii = require 'ascii'
    dashboard.section.header.val = ascii.get_random_global()

    dashboard.section.buttons.val = {
      -- dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('SPC f p', '  Projects', ':Telescope projects<CR>'),
      dashboard.button('SPC F F', '󰱽  Find file', ':lua require("telescope.builtin").find_files({ cwd = vim.env.HOME, follow = true, hidden = true })<CR>'),
      dashboard.button('SPC f o', '  Recent files', ':Telescope oldfiles<CR>'),
      dashboard.button('SPC o o', '  File brwoser', ':Oil<cr>'),
      -- dashboard.button('SPC l g', '󰺯  Live grep', ':Telescope live_grep<CR>'),
      -- dashboard.button('SPC f w', '󰈭  Find word', ':Telescope grep_string<CR>'),
      dashboard.button('SPC f h', '󰋖  Help', ':Telescope help_tags<CR>'),
      dashboard.button('q', '󰅚  Quit NVIM', ':qa<CR>'),
    }

    alpha.setup(dashboard.config)
  end,
}
