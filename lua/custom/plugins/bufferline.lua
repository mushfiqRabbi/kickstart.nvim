return {
  'akinsho/bufferline.nvim',
  -- after = 'catppuccin',
  version = '*',
  dependencies = {
    {
      'catppuccin/nvim',
      name = 'catppuccin',
    },
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('bufferline').setup {
      highlights = require('catppuccin.groups.integrations.bufferline').get(),
      options = {
        --   always_show_bufferline = false,
        indicator = {
          style = 'underline',
        },
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match 'error' and ' ' or ' '
          return ' ' .. icon .. count
        end,
        -- offsets = {
        --   {
        --     filetype = 'NvimTree',
        --     text = function()
        --       return vim.fn.getcwd()
        --     end,
        --     highlight = 'Directory',
        --     separator = true, -- use a "true" to enable the default, or set your own character
        --   },
        -- },
        custom_areas = {
          right = function()
            local result = {}
            local seve = vim.diagnostic.severity
            local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
            local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
            local info = #vim.diagnostic.get(0, { severity = seve.INFO })
            local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

            if error ~= 0 then
              table.insert(result, { text = '  ' .. error, fg = '#EC5241' })
            end

            if warning ~= 0 then
              table.insert(result, { text = '  ' .. warning, fg = '#EFB839' })
            end

            if hint ~= 0 then
              table.insert(result, { text = '  ' .. hint, fg = '#A3BA5E' })
            end

            if info ~= 0 then
              table.insert(result, { text = '  ' .. info, fg = '#7EA9A7' })
            end
            return result
          end,
        },
        -- separator_style = 'thick',
      },
    }
    vim.keymap.set({ 'n', 'i', 'v' }, '<C-l>', '<cmd>BufferLineCycleNext<cr>', { noremap = true, silent = true })
    vim.keymap.set({ 'n', 'i', 'v' }, '<C-h>', '<cmd>BufferLineCyclePrev<cr>', { noremap = true, silent = true })
  end,
}
