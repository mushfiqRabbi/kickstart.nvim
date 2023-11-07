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
    local HEIGHT_RATIO = 0.8 -- You can change this
    local WIDTH_RATIO = 0.5 -- You can change this too
    require('nvim-tree').setup {
      on_attach = function(bufnr)
        local api = require 'nvim-tree.api'
        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
      end,

      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          error = '',
          warning = '',
          hint = '',
          info = '',
        },
      },
      sync_root_with_cwd = true,
      renderer = {
        indent_markers = {
          enable = true,
        },
      },
      view = {
        float = {
          enable = true,
          open_win_config = function()
            local screen_w = vim.opt.columns:get()
            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
            local window_w = screen_w * WIDTH_RATIO
            local window_h = screen_h * HEIGHT_RATIO
            local window_w_int = math.floor(window_w)
            local window_h_int = math.floor(window_h)
            local center_x = (screen_w - window_w) / 2
            local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
            return {
              border = 'rounded',
              relative = 'editor',
              row = center_y,
              col = center_x,
              width = window_w_int,
              height = window_h_int,
            }
          end,
        },
        width = function()
          return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
        end,
        -- width = function()
        --   local resposive_width = math.floor(vim.o.columns * 0.15)
        --   if resposive_width < 25 then
        --     return 25
        --   else
        --     return resposive_width
        --   end
        -- end,
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
      api.tree.toggle()
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

    -- vim.api.nvim_create_autocmd('BufEnter', {
    --   -- pattern = 'NvimTree_*',
    --   callback = function(ev)
    --     print(vim.inspect(ev))
    --     print(vim.api.nvim_buf_get_name(0))
    --   end,
    -- })
    --
    -- vim.api.nvim_create_autocmd('BufLeave', {
    --   -- pattern = 'NvimTree_*',
    --   callback = function(ev)
    --     print(vim.inspect(ev))
    --     print(vim.api.nvim_buf_get_name(0))
    --   end,
    -- })
  end,
}
