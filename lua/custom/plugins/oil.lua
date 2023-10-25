return {
  'stevearc/oil.nvim',
  opts = {
    -- cleanup_delay_ms = false,
    -- win_options = {
    --   wrap = true,
    -- },
  },
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- local oil = require 'oil'
    -- local util = require 'oil.util'
    require('oil').setup {
      skip_confirm_for_simple_edits = true,
      keymaps = {
        ['<C-s>'] = false,
        ['<CR>'] = {
          callback = function()
            local oil = require 'oil'
            oil.select()
            if oil.get_cursor_entry().type == 'directory' then
              oil.select { preview = true }
            end
          end,
          mode = 'n',
        },
        ['<C-c>'] = {
          callback = function()
            local oil = require 'oil'
            local util = require 'oil.util'
            -- local entry = oil.get_cursor_entry()
            -- if not entry then
            --   vim.notify('Could not find entry under cursor', vim.log.levels.ERROR)
            --   return
            -- end
            local preview_win = util.get_preview_win()
            if preview_win then
              -- local cur_id = vim.w[winid].oil_entry_id
              -- if entry.id == cur_id then
              vim.api.nvim_win_close(preview_win, true)
              -- oil.close()
              -- return
              -- end
            end
            oil.close()
          end,
          mode = 'n',
        },
      },
    }
    vim.keymap.set({ 'n', 'v' }, '<leader>ob', ':Oil<CR>', { noremap = true, silent = true })
    vim.keymap.set({ 'n', 'v' }, '<leader>oB', ':lua require("oil").open(vim.loop.cwd())<CR>', { noremap = true, silent = true })
    vim.api.nvim_create_autocmd('User', {
      pattern = 'OilEnter',
      callback = vim.schedule_wrap(function(args)
        local oil = require 'oil'
        if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
          oil.select { preview = true }
        end
      end),
    })
  end,
}
