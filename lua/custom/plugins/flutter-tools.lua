return {
  'nvim-flutter/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim',
  },
  config = function()
    require('flutter-tools').setup {}

    vim.keymap.set('n', '<leader>tf', function()
      vim.cmd 'Telescope flutter commands'
    end, { desc = 'Flutter Commands' })
  end,
}
