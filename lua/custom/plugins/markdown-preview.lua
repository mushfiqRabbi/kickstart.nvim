return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  build = function()
    vim.fn['mkdp#util#install']()
  end,
  config = function()
    vim.keymap.set('n', '<leader>mp', ':MarkdownPreviewToggle<CR>', { desc = 'Toggle [M]arkdown [P]review' })
  end,
}
