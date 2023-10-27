return {
  'ahmedkhalf/project.nvim',
  config = function()
    require('project_nvim').setup {
      manual_mode = true,
      show_hidden = true,
    }
  end,
}
