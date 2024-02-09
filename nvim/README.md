# Introduction to NeoVim configuration

<!--toc:start-->
- [Introduction to NeoVim configuration](#introduction-to-neovim-configuration)
  - [Colorscheme](#colorscheme)
  - [Plugins](#plugins)
  - [Basic Informations](#basic-informations)
    - [Lazy](#lazy)
    - [NeoTree](#neotree)
    - [Telescope](#telescope)
    - [ToggleTerm](#toggleterm)
    - [Undotree](#undotree)
    - [Mason](#mason)
<!--toc:end-->

In this file you will find a summary of my nvim rice with all information you need to use it with my personal adjustments.

## Colorscheme

For this configuration i used [folke tokyonight](https://github.com/folke/tokyonight.nvim) Night theme.

## Plugins

I decided to try configure an LSP using mason and lsp-config.
Here a list of all plugins I've used in this configuration.

- **Plugin manager**
  - Lazy
- **Core**
  - Neo Tree -> cool file tree
  - Nvim-Comment -> plugin for commenting lines
  - Dressing -> cool floating window
  - Gitsigns -> plugin for some git feature while workin gin a repository
  - Lualine -> nvim lualine at the bottom
  - Peek -> markdown viewer
  - Telescope -> how can you use nvim without Telescope??
  - ToggleTerm -> toggle terminal in the project folder
  - Treesitter -> just treesitter
  - Undotree -> plugin for local version control xD
- **LSP**
  - cmp -> rip cmp looking for a replacement
  - lsp-config
  - mason-lsp-config
  - mason
  - lsp-debugger
  - lsp-dap-ui -> UI for debuggers
  - comform -> for lsp formatting
  - nvim-lint -> linters for lsp

## Basic Informations

### Lazy

Lazy is the plugin manager that install and updates all plugins you configure in the `lua` folder.
To open the ui you can run the following command:

```vim
:Lazy
```

<!-- Add more info about plugins isntall... -->

### NeoTree

NeoTree is the file tree on the left, you can explore the current working directory by pressing arrows or `j k`.
You can copy/delete/rename/move directories and files, for all the commands you can hit `?` in file tree buffer.
This plugin allow you to open floating windows with all opened buffers and a git helper.

### Telescope

Telescope is a useful plugin that allow you to find every file in the current project folder. You can also
iterate all files and see their preview on the right side.
You can also search for a specified word recurrency in every file showing the preview on the right (if the nvim window is wide enough).

### ToggleTerm

ToggleeTerm allow you to open a floating terminal in the current project with the same path that you can see on top the file tree.
In this terminal you will enter in a mode called `---TERMINAL---`, while you are in this mode you are allowed to write in this buffer,
if you press your escape key, in my case `ESC`, you will leave `---TERMINAL---` mode and go in `---NORMAL---` mode.
To enter in `---TERMINAL---` mode you can simply press `a` or `i` or other keys that allow you to go in `---INSERT---` mode
in nvim.

### Undotree

This plugin creates a history for each file you create/modify, it simply define an history tree in a specified folder written
in `nvimconfig.lua` module. The default folder is `$HOME/.vim/undodir/`.

### Mason

Mason is the lsp package manager, when you want to install another LSP you have to install it in Mason.
To open the mason ui you can simply run this command:

```vim
:Mason
```

In this floating buffer you can search a specified server by hitting `/pluginName<CR>`, and press `n` and `N` to navigate all occurrences.
To open the help page you can press `g?` while in `---NORMAL---` mode, and it will toggle a window with all commands.
**Most important commands**:

- `i` -> install a package
- `U` -> updates all outdated packages
- `x` -> remove the current package under the cursor

When you install a package you have to tell `lsp` modules to use that specified package, or it will not work.
To check if a buffer has attached a lsp you can run:

```vim
:LspInfo
```

It will open a floating buffer with all information you need for the current lsp client.

Work in progress...
