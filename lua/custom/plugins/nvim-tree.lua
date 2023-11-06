return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    {
      'JMarkin/nvim-tree.lua-float-preview',
      lazy = true,
    },
  },
  config = function()
    require('nvim-tree').setup {
      sync_root_with_cwd = true,
      renderer = {
        indent_markers = {
          enable = true,
        },
      },
      view = {
        width = function()
          local resposive_width = math.floor(vim.o.columns * 0.15)
          if resposive_width < 25 then
            return 25
          else
            return resposive_width
          end
        end,
        centralize_selection = true,
      },
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      filters = {
        custom = {
          '^.git$',
          '^.github$',
          '^.vscode$',
        },
        exclude = {
          '.env',
          '.env.local',
        },
      },
    }

    local api = require 'nvim-tree.api'
    vim.keymap.set('n', '<C-g>', function()
      api.tree.toggle { focus = false }
    end, { noremap = true, desc = 'Toggle NvimTree' })

    vim.api.nvim_create_autocmd('QuitPre', {
      callback = function()
        local tree_wins = {}
        local floating_wins = {}
        local wins = vim.api.nvim_list_wins()
        for _, w in ipairs(wins) do
          local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
          if bufname:match 'NvimTree_' ~= nil then
            table.insert(tree_wins, w)
          end
          if vim.api.nvim_win_get_config(w).relative ~= '' then
            table.insert(floating_wins, w)
          end
        end
        if 1 == #wins - #floating_wins - #tree_wins then
          -- Should quit, so we close all invalid windows.
          for _, w in ipairs(tree_wins) do
            vim.api.nvim_win_close(w, true)
          end
        end
      end,
    })
  end,
}
