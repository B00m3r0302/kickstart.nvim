# Toggleterm Setup Guide

This document explains how toggleterm.nvim was set up in your Neovim configuration, how to use it, modify it, or remove it.

## What is Toggleterm?

Toggleterm is a Neovim plugin that makes it easy to manage multiple terminal windows. You can:
- Toggle terminals on/off quickly
- Have multiple terminals (numbered 1, 2, 3, etc.)
- Open terminals in different layouts (float, horizontal, vertical, tab)
- Send commands to terminals

---

## How It Was Set Up

### File Location
The plugin configuration is in:
```
lua/kickstart/plugins/toggleterm.lua
```

### Enabled In
The plugin is loaded via `init.lua` at approximately line 982:
```lua
require 'kickstart.plugins.toggleterm', -- terminal management
```

### Configuration Summary
The current setup includes:
- **Default direction**: Float (centered popup terminal)
- **Keybindings**: Multiple ways to open terminals
- **Terminal shading**: Darker background to distinguish from editor
- **Easy navigation**: Ctrl+hjkl to move between terminal and editor windows

---

## How to Use Toggleterm

### Basic Keybindings

| Keybinding | Action |
|------------|--------|
| `Ctrl+\`` | Toggle default terminal (backtick) |
| `<leader>tt` | **[T]oggle [T]erminal** |
| `<leader>tf` | Open **[T]erminal** as **[F]loat** |
| `<leader>tv` | Open **[T]erminal** **[V]ertical** split |
| `<leader>th` | Open **[T]erminal** **[H]orizontal** split |
| `<leader>ta` | Toggle **[A]ll** terminals |
| `<leader>ts` | **[S]elect** a terminal to open |

### Inside the Terminal

| Keybinding | Action |
|------------|--------|
| `Esc` | Exit terminal mode (back to normal mode) |
| `Ctrl+h/j/k/l` | Navigate to other windows |
| `i` or `a` | Enter insert mode to type commands |

### Opening Multiple Terminals

You can have multiple numbered terminals:
- `1<leader>tt` - Opens/toggles terminal #1
- `2<leader>tt` - Opens/toggles terminal #2
- `3<leader>tt` - Opens/toggles terminal #3

Or use the commands directly:
- `:ToggleTerm` - Toggle default terminal
- `:2ToggleTerm` - Toggle terminal #2
- `:TermSelect` - Choose from a list of terminals

### Useful Commands

| Command | Description |
|---------|-------------|
| `:ToggleTerm` | Toggle terminal |
| `:ToggleTerm direction=float` | Open as floating window |
| `:ToggleTerm direction=horizontal size=20` | Open horizontal with custom size |
| `:ToggleTerm direction=vertical size=80` | Open vertical with custom size |
| `:ToggleTermToggleAll` | Toggle all open terminals |
| `:TermSelect` | Select from available terminals |
| `:TermExec cmd="git status"` | Run a command in terminal |

---

## How to Modify Toggleterm

### Change Default Direction
Edit `lua/kickstart/plugins/toggleterm.lua` and change the `direction` option:
```lua
opts = {
  direction = 'horizontal', -- Options: 'float', 'horizontal', 'vertical', 'tab'
  -- ...
}
```

### Change Terminal Size
Modify the `size` function or set a fixed number:
```lua
opts = {
  size = 20, -- Fixed size
  -- OR dynamic size:
  size = function(term)
    if term.direction == 'horizontal' then
      return 20  -- Change this number
    elseif term.direction == 'vertical' then
      return 100 -- Change this number
    end
  end,
}
```

### Change Float Window Style
Modify `float_opts`:
```lua
float_opts = {
  border = 'curved', -- Options: 'single', 'double', 'shadow', 'curved'
  width = 120,       -- Fixed width (or use a function)
  height = 30,       -- Fixed height
  winblend = 0,      -- Transparency (0-100)
},
```

### Add Custom Keybindings
Add more entries to the `keys` table:
```lua
keys = {
  -- ... existing keys ...
  { '<F4>', '<cmd>ToggleTerm<CR>', desc = 'Toggle terminal with F4' },
},
```

### Create a Custom Terminal (e.g., lazygit)
Add to the `config` function:
```lua
config = function(_, opts)
  require('toggleterm').setup(opts)
  
  -- Create a lazygit terminal
  local Terminal = require('toggleterm.terminal').Terminal
  local lazygit = Terminal:new({
    cmd = 'lazygit',
    hidden = true,
    direction = 'float',
  })

  vim.keymap.set('n', '<leader>tg', function()
    lazygit:toggle()
  end, { desc = '[T]erminal Lazy[g]it' })
  
  -- ... rest of config
end,
```

---

## How to Remove Toggleterm

### Step 1: Remove from init.lua
Open `init.lua` and delete or comment out this line (around line 982):
```lua
require 'kickstart.plugins.toggleterm', -- terminal management
```

### Step 2: (Optional) Delete the plugin file
Remove the configuration file:
```
lua/kickstart/plugins/toggleterm.lua
```

### Step 3: Clean up plugins
Restart Neovim and run:
```
:Lazy clean
```
This will remove the unused plugin files.

---

## Troubleshooting

### Terminal not opening?
- Make sure you saved `init.lua` after adding the require line
- Restart Neovim
- Run `:Lazy` to check if the plugin is installed

### Keybindings not working?
- Press `<leader>sk` to search keymaps and verify toggleterm keys exist
- Check for conflicts with other plugins

### Terminal is too small/large?
- Modify the `size` option in the configuration
- Use commands with explicit size: `:ToggleTerm size=30`

---

## More Information

- **GitHub**: https://github.com/akinsho/toggleterm.nvim
- **Help in Neovim**: `:help toggleterm`

