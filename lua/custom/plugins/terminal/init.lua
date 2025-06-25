local state = {
  floating = {
    buf = -1,
    win = -1,
  },
}

return {
  dir = vim.fn.stdpath 'config' .. '/lua/custom/plugins/terminal',
  name = 'custom-terminal',
  lazy = false,
  config = function()
    -- Key mappings
    vim.keymap.set('t', '<esc><esc>', function()
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-\\><C-n>', true, false, true), 'n', false)
      if vim.api.nvim_win_is_valid(state.floating.win) then
        vim.api.nvim_win_hide(state.floating.win)
      end
    end)

    vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerminal<cr>')

    -- Highlight groups for GitHub Dark colors
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#0d1117', fg = '#3FB950' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#0d1117', fg = '#3FB950' })

    local function create_floating_window(opts)
      opts = opts or {}
      local width = opts.width or math.floor(vim.o.columns * 0.9)
      local height = opts.height or math.floor(vim.o.lines * 0.9)

      local col = math.floor((vim.o.columns - width) / 2)
      local row = math.floor((vim.o.lines - height) / 2) - 1

      local buf = nil
      if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
      else
        buf = vim.api.nvim_create_buf(false, true)
      end

      local win_config = {
        relative = 'editor',
        width = width,
        height = height,
        col = col,
        row = row,
        style = 'minimal',
        border = 'double',
        title = '  Terminal ',
        title_pos = 'center',
        noautocmd = true,
      }

      local win = vim.api.nvim_open_win(buf, true, win_config)

      vim.api.nvim_set_option_value('winhl', 'Normal:NormalFloat,FloatBorder:FloatBorder', { win = win })
      vim.api.nvim_set_option_value('winblend', 0, { win = win })
      return { buf = buf, win = win }
    end

    local function toggle_terminal()
      if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.floating = create_floating_window { buf = state.floating.buf }

        if vim.bo[state.floating.buf].buftype ~= 'terminal' then
          vim.cmd.terminal()
          vim.cmd.startinsert()
        else
          vim.api.nvim_set_current_win(state.floating.win)
          vim.cmd.startinsert()
        end
      else
        vim.api.nvim_win_hide(state.floating.win)
      end
    end

    vim.api.nvim_create_user_command('ToggleTerminal', toggle_terminal, {})
  end,
  state = state,
}
