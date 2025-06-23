return {
  'shellRaining/hlchunk.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('hlchunk').setup {
      chunk = {
        enable = true,
        use_treesitter = true,
        chars = {
          horizontal_line = '─',
          vertical_line = '│',
          left_top = '╭',
          left_bottom = '╰',
          right_arrow = '>',
        },
        style = { { fg = '#806d9c' } },
      },
      indent = {
        enable = true,
        use_treesitter = false,
        delay = 1000,
        lunum = 1,
        chars = { '│' },
        style = {
          { fg = '#5c4b4b' }, -- Level 1: desaturated red-brown
          { fg = '#5c5236' }, -- Level 2: muted mustard
          { fg = '#4a5c3d' }, -- Level 3: olive green
          { fg = '#3c5c5c' }, -- Level 4: steel cyan
          { fg = '#3a4a5c' }, -- Level 5: dark desaturated blue
          { fg = '#4f3d5c' }, -- Level 6: muted purple
        },
      },
      line_num = {
        enable = true,
        use_treesitter = false,
        style = '#806d9c',
      },
      blank = {
        enable = false,
        chars = { '․' },
        style = {
          vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID 'Whitespace'), 'fg', 'gui'),
        },
      },
    }
  end,
}
