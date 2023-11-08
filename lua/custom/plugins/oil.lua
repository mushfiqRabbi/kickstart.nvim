return {
  'stevearc/oil.nvim',

  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    local oil = require 'oil'
    local util = require 'oil.util'

    oil.setup {

      keymaps = {
        ['<C-s>'] = false,
        ['<C-v>'] = 'actions.select_vsplit',
        ['<CR>'] = {
          callback = function()
            if oil.get_cursor_entry().type == 'directory' then
              oil.open(oil.get_current_dir() .. oil.get_cursor_entry().parsed_name)
            else
              oil.select()
            end
          end,
          mode = 'n',
        },
        ['<C-g>'] = {
          callback = function()
            if util.get_preview_win() then
              vim.api.nvim_win_close(util.get_preview_win(), true)
            end
            oil.close()
          end,
          mode = { 'n', 'v', 'i' },
        },
      },

      cleanup_delay_ms = 0,
      view_options = {
        show_hidden = true,
      },
      skip_confirm_for_simple_edits = true,
    }

    vim.keymap.set({ 'n', 'v', 'i' }, '<C-g>', '<cmd>Oil<CR>', { noremap = true, silent = true, desc = '[] Explore files/folders' })

    vim.api.nvim_create_autocmd('User', {
      pattern = 'OilEnter',
      callback = vim.schedule_wrap(function(args)
        if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
          oil.select { preview = true }
        end
      end),
    })
  end,
}
