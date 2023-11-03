return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    -- add any options here
    popupmenu = {
      backend = 'cmp',
    },
    -- notify = {
    --   enabled = false,
    -- },
    lsp = {
      progress = {
        enabled = false,
      },
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true,
      },
    },
    -- you can enable a preset for easier configuration
    presets = {
      bottom_search = false, -- use a classic bottom cmdline for search
      command_palette = false, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
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
          kind = '',
          find = 'more line',
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
          kind = '',
          find = 'more lines',
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
          kind = '',
          find = 'change',
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = 'msg_show',
          kind = 'search_count',
        },
        opts = { skip = true },
      },
      -- {
      --   view = 'notify',
      --   filter = { event = 'msg_showmode' },
      -- },
    },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    {
      'rcarriga/nvim-notify',
      config = function()
        require('notify').setup {
          on_open = function(win)
            vim.api.nvim_win_set_config(win, { focusable = false })
          end,
        }
      end,
    },
  },
}
