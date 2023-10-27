return {
  'ahmedkhalf/project.nvim',
  config = function()
    require('project_nvim').setup {
      -- manual_mode = true,
      detection_methods = { 'pattern' },
      show_hidden = true,
    }
  end,
}
