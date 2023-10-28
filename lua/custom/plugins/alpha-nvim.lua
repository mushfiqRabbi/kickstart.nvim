return {
  'goolord/alpha-nvim',
  dependencies = {
    'MaximilianLloyd/ascii.nvim',
  },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'
    local ascii = require 'ascii'
    dashboard.section.header.val = ascii.get_random('text', 'neovim')

    dashboard.section.buttons.val = {
      -- dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('SPC f p', '  Projects', ':Telescope projects<CR>'),
      dashboard.button(
        'SPC f F',
        '󰱽  Search file',
        ':lua require("telescope.builtin").find_files({ cwd = vim.env.HOME, follow = true, hidden = true })<CR>'
      ),
      dashboard.button('SPC f r', '  Recent files', ':Telescope oldfiles<CR>'),
      dashboard.button('SPC o b', '  File browser', ':Oil<cr>'),
      -- dashboard.button('SPC l g', '󰺯  Live grep', ':Telescope live_grep<CR>'),
      -- dashboard.button('SPC s w', '󰈭  Find word', ':Telescope grep_string<CR>'),
      dashboard.button('SPC f h', '󰋖  Help', ':Telescope help_tags<CR>'),
      dashboard.button('q', '󰅚  Quit NVIM', ':qa<CR>'),
    }

    alpha.setup(dashboard.config)

    vim.api.nvim_create_autocmd({ 'User' }, {
      pattern = 'AlphaReady',
      callback = function()
        vim.cmd [[
          set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
        ]]
      end,
    })
  end,
}
