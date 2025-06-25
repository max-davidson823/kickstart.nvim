return {
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    priority = 1000,
    config = function()
      require('github-theme').setup {
        -- Optional: config options here
      }
      -- Comment out the colorscheme line if not the default
      vim.cmd 'colorscheme github_dark_default'
    end,
  },

  {
    'folke/tokyonight.nvim',
    priority = 1000,
    config = function()
      require('tokyonight').setup {
        styles = {
          comments = { italic = false },
        },
      }
      -- Set this as the default colorscheme
      -- vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
}
