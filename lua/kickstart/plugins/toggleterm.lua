-- toggleterm.nvim - A neovim plugin to persist and toggle multiple terminals
-- https://github.com/akinsho/toggleterm.nvim

return {
  'akinsho/toggleterm.nvim',
  version = '*',
  keys = {
    { '<C-`>', '<cmd>ToggleTerm<CR>', desc = 'Toggle terminal' },
    { '<leader>tt', '<cmd>ToggleTerm<CR>', desc = '[T]oggle [T]erminal' },
    { '<leader>tf', '<cmd>ToggleTerm direction=float<CR>', desc = '[T]erminal [F]loat' },
    { '<leader>tv', '<cmd>ToggleTerm direction=vertical size=80<CR>', desc = '[T]erminal [V]ertical' },
    { '<leader>th', '<cmd>ToggleTerm direction=horizontal size=15<CR>', desc = '[T]erminal [H]orizontal' },
    { '<leader>ta', '<cmd>ToggleTermToggleAll<CR>', desc = '[T]erminal Toggle [A]ll' },
    { '<leader>ts', '<cmd>TermSelect<CR>', desc = '[T]erminal [S]elect' },
  },
  opts = {
    -- Size of the terminal window
    size = function(term)
      if term.direction == 'horizontal' then
        return 15
      elseif term.direction == 'vertical' then
        return vim.o.columns * 0.4
      end
    end,
    -- Default direction: 'vertical', 'horizontal', 'tab', or 'float'
    direction = 'float',
    -- Hide line numbers in terminal buffers
    hide_numbers = true,
    -- Shade terminal to make it visually distinct
    shade_terminals = true,
    shading_factor = -30,
    -- Start terminal in insert mode
    start_in_insert = true,
    -- Whether open mapping works in insert mode
    insert_mappings = true,
    -- Whether open mapping works in terminal mode
    terminal_mappings = true,
    -- Persist terminal size across sessions
    persist_size = true,
    -- Remember previous terminal mode
    persist_mode = true,
    -- Close terminal window when process exits
    close_on_exit = true,
    -- Automatically scroll to bottom on output
    auto_scroll = true,
    -- Floating window options
    float_opts = {
      border = 'curved',
      winblend = 3,
    },
  },
  config = function(_, opts)
    require('toggleterm').setup(opts)

    -- Terminal mode mappings for easier navigation
    function _G.set_terminal_keymaps()
      local term_opts = { buffer = 0 }
      -- Press Escape to exit terminal mode
      vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], term_opts)
      -- Navigate between windows while in terminal
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], term_opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], term_opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], term_opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], term_opts)
    end

    -- Apply terminal keymaps when terminal opens
    vim.cmd 'autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()'
  end,
}

