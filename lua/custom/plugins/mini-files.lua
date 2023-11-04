return {
  'mushfiqRabbi/mini.files',
  version = false,
  config = function()
    require('mini.files').setup {
      windows = {
        preview = true,
        width_focus = function()
          local MiniFiles = require 'mini.files'
          if math.floor(vim.o.columns * 0.3) < 40 then
            return 40
          else
            return math.floor(vim.o.columns * 0.3)
          end
        end,
        width_preview = function()
          local MiniFiles = require 'mini.files'
          if MiniFiles.get_fs_entry().fs_type == 'directory' then
            return 25
          else
            if math.floor(vim.o.columns * 0.4) < 50 then
              return 50
            else
              return math.floor(vim.o.columns * 0.4)
            end
          end
        end,
      },
    }
    vim.keymap.set(
      'n',
      '<leader>e',
      '<CMD>lua require("mini.files").open(vim.api.nvim_buf_get_name(0), false)<CR>',
      { noremap = true, silent = true, desc = '[E]xplore files/folders' }
    )
  end,
}
