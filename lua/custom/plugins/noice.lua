return {
  'folke/noice.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim',
    {
      'rcarriga/nvim-notify',
      config = function()
        require('notify').setup {
          on_open = function(win)
            vim.api.nvim_win_set_config(win, { focusable = false, zindex = 100 })
          end,
        }
      end,
    },
  },
  event = 'VeryLazy',
  opts = {
    popupmenu = {
      backend = 'cmp',
    },
    lsp = {
      progress = {
        enabled = false,
      },
      signature = {
        enabled = false,
      },
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true,
      },
    },
    presets = {
      bottom_search = true, -- use a classic bottom cmdline for search
      command_palette = false, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = true, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = true, -- add a border to hover docs and signature help
    },
    views = {
      cmdline_popup = {
        position = {
          row = 5,
          col = '50%',
        },
        size = {
          width = 60,
          height = 'auto',
        },
      },
      hover = {
        zindex = 60,
      },
    },
    routes = {
      {
        filter = {
          event = 'msg_show',
          kind = '',
          find = 'written',
        },
        opts = { skip = true },
      },

      {
        filter = {
          event = 'msg_show',
          kind = 'echo',
          find = 'written',
        },
        opts = { skip = true },
      },

      {
        filter = {
          event = 'msg_show',
          kind = '',
          find = 'fewer lines',
        },
        opts = { skip = true },
      },

      {
        filter = {
          event = 'msg_show',
          kind = 'echo',
          find = 'fewer lines',
        },
        opts = { skip = true },
      },

      {
        filter = {
          event = 'msg_show',
          kind = '',
          find = 'line less',
        },
        opts = { skip = true },
      },

      {
        filter = {
          event = 'msg_show',
          kind = 'echo',
          find = 'line less',
        },
        opts = { skip = true },
      },

      {
        filter = {
          event = 'msg_show',
          kind = '',
          find = 'more line',
        },
        opts = { skip = true },
      },

      {
        filter = {
          event = 'msg_show',
          kind = 'echo',
          find = 'more line',
        },
        opts = { skip = true },
      },

      {
        filter = {
          event = 'msg_show',
          kind = '',
          find = 'change',
        },
        opts = { skip = true },
      },

      {
        filter = {
          event = 'msg_show',
          kind = 'echo',
          find = 'change',
        },
        opts = { skip = true },
      },

      {
        filter = {
          event = 'msg_show',
          kind = '',
          find = '-- (terminal) --',
        },
        opts = { skip = true },
      },

      {
        filter = {
          event = 'msg_show',
          kind = 'echo',
          find = '-- (terminal) --',
        },
        opts = { skip = true },
      },

      {
        filter = {
          event = 'msg_show',
          kind = '',
          find = '-- VISUAL LINE --',
        },
        opts = { skip = true },
      },

      {
        filter = {
          event = 'msg_show',
          kind = 'echo',
          find = '-- VISUAL LINE --',
        },
        opts = { skip = true },
      },

      {
        filter = {
          event = 'msg_show',
          kind = '',
          find = '-- INSERT --',
        },
        opts = { skip = true },
      },

      {
        filter = {
          event = 'msg_show',
          kind = 'echo',
          find = '-- INSERT --',
        },
        opts = { skip = true },
      },

      -- {
      --   filter = {
      --     event = 'msg_show',
      --     kind = 'search_count',
      --   },
      --   opts = { skip = true },
      -- },
    },
  },
}
