# Kickstart.nvim Beginner's Guide

Welcome to Neovim! This guide covers all keybindings and how to use each plugin in this configuration.

> **Important**: The **Leader Key** is `<Space>`. When you see `<leader>`, press the spacebar first.

## Getting Started

1. Run `:Tutor` in Neovim to learn basic Vim motions
2. Press `<Space>` and wait - **which-key** will show all available keybindings!
3. Run `:checkhealth` to verify your setup

---

## Essential Neovim Keybindings

### Window/Split Navigation
| Keybinding | Action |
|------------|--------|
| `Ctrl+h` | Move to left window |
| `Ctrl+l` | Move to right window |
| `Ctrl+j` | Move to lower window |
| `Ctrl+k` | Move to upper window |

### General
| Keybinding | Action |
|------------|--------|
| `<Esc>` | Clear search highlights |
| `<Esc><Esc>` | Exit terminal mode |
| `<leader>q` | Open diagnostic quickfix list |

---

## Plugin Keybindings

### 🔍 Telescope (Fuzzy Finder)
The most powerful plugin for finding things. All start with `<leader>s` for **[S]earch**.

| Keybinding | Action |
|------------|--------|
| `<leader>sf` | **[S]earch [F]iles** - Find files in project |
| `<leader>sg` | **[S]earch by [G]rep** - Search text in all files |
| `<leader>sw` | **[S]earch current [W]ord** - Find word under cursor |
| `<leader>sh` | **[S]earch [H]elp** - Search Neovim help docs |
| `<leader>sk` | **[S]earch [K]eymaps** - Find all keybindings |
| `<leader>sd` | **[S]earch [D]iagnostics** - Find errors/warnings |
| `<leader>sr` | **[S]earch [R]esume** - Resume last search |
| `<leader>s.` | **Search Recent Files** |
| `<leader>sn` | **[S]earch [N]eovim files** - Search config files |
| `<leader>ss` | **[S]earch [S]elect Telescope** - Pick a Telescope picker |
| `<leader>s/` | **Search in Open Files** |
| `<leader><leader>` | Find existing buffers |
| `<leader>/` | Fuzzy search in current buffer |

**Inside Telescope:**
- `Ctrl+/` (insert mode) or `?` (normal mode): Show Telescope help
- `<Enter>`: Select item
- `Ctrl+n`/`Ctrl+p` or `↑`/`↓`: Navigate items

### 📝 LSP (Language Server Protocol)
These work when you have an LSP active (editing code files).

| Keybinding | Action |
|------------|--------|
| `grd` | **[G]oto [D]efinition** - Jump to where symbol is defined |
| `grr` | **[G]oto [R]eferences** - Find all usages of symbol |
| `gri` | **[G]oto [I]mplementation** |
| `grt` | **[G]oto [T]ype Definition** |
| `grD` | **[G]oto [D]eclaration** (e.g., C headers) |
| `grn` | **[R]e[n]ame** symbol across project |
| `gra` | **Code [A]ction** - Show quick fixes/refactors |
| `gO` | Open Document Symbols (functions, classes, etc.) |
| `gW` | Open Workspace Symbols |
| `<leader>th` | **[T]oggle Inlay [H]ints** |

**Navigation Tip**: After jumping with `grd`, press `Ctrl+t` to jump back!

### ✨ Autocompletion (blink.cmp)
Works automatically as you type in insert mode.

| Keybinding | Action |
|------------|--------|
| `Ctrl+y` | Accept completion |
| `Ctrl+n` / `Ctrl+p` | Next/Previous suggestion |
| `↑` / `↓` | Navigate suggestions |
| `Ctrl+Space` | Open completion menu / show docs |
| `Ctrl+e` | Close completion menu |
| `Ctrl+k` | Toggle signature help |
| `Tab` / `Shift+Tab` | Move within snippet |

### 📁 Neo-tree (File Explorer)
| Keybinding | Action |
|------------|--------|
| `\` | Toggle file tree |

**Inside Neo-tree**: Use standard navigation. Press `?` for help.

### 📐 Formatting (conform.nvim)
| Keybinding | Action |
|------------|--------|
| `<leader>f` | **[F]ormat** current buffer |

Formatting also runs automatically on save.

### 🔀 Git (gitsigns.nvim)
All start with `<leader>h` for Git **[H]unk**.

| Keybinding | Action |
|------------|--------|
| `]c` | Jump to next git change |
| `[c` | Jump to previous git change |
| `<leader>hs` | **[s]tage** hunk |
| `<leader>hr` | **[r]eset** hunk |
| `<leader>hS` | **[S]tage** entire buffer |
| `<leader>hR` | **[R]eset** entire buffer |
| `<leader>hu` | **[u]ndo** stage hunk |
| `<leader>hp` | **[p]review** hunk (popup) |
| `<leader>hb` | **[b]lame** line |
| `<leader>hd` | **[d]iff** against index |
| `<leader>hD` | **[D]iff** against last commit |
| `<leader>tb` | **[T]oggle** git **[b]lame** line |
| `<leader>tD` | **[T]oggle** show **[D]eleted** inline |

### 💻 Toggleterm (Terminal Management)
Manage multiple terminal windows easily. See `docs/toggleterm-setup.md` for full details.

| Keybinding | Action |
|------------|--------|
| `Ctrl+\`` | Toggle terminal (backtick key) |
| `<leader>tt` | **[T]oggle [T]erminal** |
| `<leader>tf` | **[T]erminal [F]loat** (floating window) |
| `<leader>tv` | **[T]erminal [V]ertical** split |
| `<leader>th` | **[T]erminal [H]orizontal** split |
| `<leader>ta` | **[T]erminal** Toggle **[A]ll** |
| `<leader>ts` | **[T]erminal [S]elect** (pick from list) |

**Inside Terminal:**
| Keybinding | Action |
|------------|--------|
| `Esc` | Exit terminal mode (back to normal) |
| `Ctrl+h/j/k/l` | Navigate to other windows |
| `i` or `a` | Enter insert mode to type |

**Multiple Terminals**: Prefix with number, e.g., `2<leader>tt` opens terminal #2

### 🐛 Debugging (nvim-dap) - Optional
*Note: Uncomment `require 'kickstart.plugins.debug'` in init.lua to enable.*

| Keybinding | Action |
|------------|--------|
| `F5` | Start/Continue debugging |
| `F1` | Step Into |
| `F2` | Step Over |
| `F3` | Step Out |
| `F7` | Toggle debug UI |
| `<leader>b` | Toggle Breakpoint |
| `<leader>B` | Set conditional Breakpoint |

### 🎨 Mini.nvim (Text Objects & Surround)
These enhance Vim motions for selecting/changing text.

**Around/Inside (mini.ai):**
- `va)` - **[V]isually select [A]round** parentheses
- `vi"` - **[V]isually select [I]nside** quotes
- `ci'` - **[C]hange [I]nside** single quotes
- `da{` - **[D]elete [A]round** curly braces

**Surround (mini.surround):**
- `saiw)` - **[S]urround [A]dd [I]nner [W]ord** with parentheses
- `sd'` - **[S]urround [D]elete** quotes
- `sr)"` - **[S]urround [R]eplace** `)` with `"`

---

## Other Active Plugins (No Keybindings)

| Plugin | What It Does |
|--------|--------------|
| **guess-indent.nvim** | Automatically detects and sets indentation |
| **which-key.nvim** | Shows pending keybindings when you pause |
| **indent-blankline.nvim** | Shows vertical indentation guides |
| **nvim-lint** | Runs linters automatically on save |
| **nvim-autopairs** | Auto-closes brackets, quotes, etc. |
| **todo-comments.nvim** | Highlights TODO, NOTE, FIXME in comments |
| **nvim-treesitter** | Advanced syntax highlighting |
| **tokyonight.nvim** | The colorscheme |
| **fidget.nvim** | Shows LSP progress in bottom right |
| **lazydev.nvim** | Lua LSP for Neovim config files |

---

## How to Add New Plugins

This config uses [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

### Method 1: Add to init.lua (Quick)
Add a new plugin directly in the `require('lazy').setup({...})` table in `init.lua`:

```lua
-- Simple plugin (just install it)
'username/plugin-name',

-- Plugin with options
{
  'username/plugin-name',
  opts = {
    -- plugin options here
  },
},

-- Plugin with custom config
{
  'username/plugin-name',
  config = function()
    require('plugin-name').setup({
      -- your config
    })
  end,
},
```

### Method 2: Create a Plugin File (Recommended for Organization)

1. Create a new file in `lua/custom/plugins/`:
   ```
   lua/custom/plugins/my-plugin.lua
   ```

2. Add your plugin spec:
   ```lua
   return {
     'username/plugin-name',
     opts = {},
   }
   ```

3. Uncomment this line in `init.lua`:
   ```lua
   { import = 'custom.plugins' },
   ```

### Plugin Spec Options

```lua
{
  'username/plugin-name',          -- GitHub repo
  version = '*',                   -- Use latest stable version
  dependencies = { 'other/plugin' }, -- Required plugins
  event = 'VimEnter',              -- When to load (lazy loading)
  ft = 'lua',                      -- Load for specific filetypes
  keys = {                         -- Load when key is pressed
    { '<leader>x', ':Command<CR>', desc = 'Do something' },
  },
  opts = {},                       -- Passed to plugin's setup()
  config = function()             -- Custom setup code
    require('plugin').setup({})
  end,
}
```

### Managing Plugins

| Command | Action |
|---------|--------|
| `:Lazy` | Open plugin manager UI |
| `:Lazy update` | Update all plugins |
| `:Lazy sync` | Install/clean/update plugins |
| `:Lazy health` | Check plugin health |

Press `?` in the Lazy UI for help!

---

## Quick Reference Card

| Action | Keybinding |
|--------|------------|
| Find files | `<leader>sf` |
| Search text | `<leader>sg` |
| File explorer | `\` |
| Go to definition | `grd` |
| Find references | `grr` |
| Rename symbol | `grn` |
| Code actions | `gra` |
| Format code | `<leader>f` |
| Git stage hunk | `<leader>hs` |
| Toggle blame | `<leader>tb` |
| **Toggle terminal** | `<leader>tt` |
| **Float terminal** | `<leader>tf` |
| Search keymaps | `<leader>sk` |
| Search help | `<leader>sh` |

---

## Tips for Beginners

1. **Press `<Space>` and wait** - which-key will show you all available commands!
2. **Use `:Telescope keymaps`** (or `<leader>sk`) to search for any keybinding
3. **Run `:checkhealth`** if something isn't working
4. **Use `:Mason`** to install language servers and formatters
5. **Read the comments** in `init.lua` - they explain everything!

Happy coding! 🚀

