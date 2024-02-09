# Introduction to NeoVim configuration

<!--toc:start-->

- [Introduction to NeoVim configuration](#introduction-to-neovim-configuration)
  - [Glossary](#glossary)
  - [Colorscheme](#colorscheme)
  - [Plugins](#plugins)
  - [Basic Informations](#basic-informations)
    - [Lazy](#lazy)
    - [NeoTree](#neotree)
    - [Telescope](#telescope)
    - [ToggleTerm](#toggleterm)
    - [Undotree](#undotree)
    - [Mason](#mason)
  - [Keymaps](#keymaps)
  <!--toc:end-->

In this file you will find a summary of my nvim rice with all information you need to use it with my personal adjustments.

## Glossary

| Key          | Description                                                                                         |
| ------------ | --------------------------------------------------------------------------------------------------- |
| `:wa`        | Saves all buffer in nvim                                                                            |
| `:qa`        | Closes all buffer in nvim                                                                           |
| `:map`       | Toggle a buffer with all active keymaps in the buffer                                               |
| `<CR>`       | Command in nvim meanign press `ENTER` automatically                                                 |
| `<C-s>`      | Command in nvim meaning `CTRL + s` key                                                              |
| `<leader>d`  | Command in nvim meaning `leaderKey + d`                                                             |
| `<leader>pf` | Command in nvim meanign press in this order `laeder + p + f`, you can realease each key after press |

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
  - Gitsigns -> plugin for some git feature while workin in a repository
  - Lualine -> nvim lualine at the bottom
  - Peek -> markdown viewer
  - Telescope -> how can you use nvim without Telescope??
  - ToggleTerm -> toggle terminal in the project directory
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

Lazy is the plugin manager that install and updates all plugins you configure in the `lua` directory.
To open the ui you can run the following command:

```vim
:Lazy
```

You can find more information [here](https://github.com/folke/lazy.nvim).

### NeoTree

NeoTree is the file tree on the left, you can explore the current working directory by pressing arrows or `j k`.
You can copy/delete/rename/move directories and files, for all the commands you can hit `?` in file tree buffer.
This plugin allow you to open floating windows with all opened buffers and a git helper.

### Telescope

Telescope is a useful plugin that allow you to find every file in the current project directory. You can also
iterate all files and see their preview on the right side.
You can also search for a specified word recurrency in every file showing the preview on the right (if the nvim window is wide enough).

### ToggleTerm

ToggleeTerm allow you to open a floating terminal in the current project with the same path that you can see on top the file tree.
In this terminal you will enter in a mode called `---TERMINAL---`, while you are in this mode you are allowed to write in this buffer,
if you press your escape key, in my case `ESC`, you will leave `---TERMINAL---` mode and go in `---NORMAL---` mode.
To enter in `---TERMINAL---` mode you can simply press `a` or `i` or other keys that allow you to go in `---INSERT---` mode
in nvim.

### Undotree

This plugin creates a history for each file you create/modify, it simply define an history tree in a specified directory written
in `nvimconfig.lua` module. The default directory is `$HOME/.vim/undodir/`.

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

## Keymaps

<table>
    <tbody>
        <tr>
            <th><span style="display: inline-block; width:105px">Mode</span></th>
            <th><span style="display: inline-block; width:100px">Key</span></th>
            <th><span style="display: inline-block; width:200px">Action</span></th>
            <th>Description</th>
        </tr>
        <tr>
            <th colspan="4"><code>lua/core/configs/keymaps.lua</code></th>
        </tr>
        <tr>
            <td><code>v</code></td>
            <td><code>J</code> or <code>K</code></td>
            <td><code>:m '>+1<CR>gv=gv</code><br><code>:m '<-2<CR>gv=gv</code></td>
            <td>Move up or down a selected line</td>
        </tr>
        <tr>
            <td><code>n</code></td>
            <td><code>n</code> or <code>N</code></td>
            <td><code>nzzzv</code><br><code>Nzzzv</code></td>
            <td>Keep the cursor in the middle of the screen when</td>
        </tr>
        <tr>
            <td><code>x</code></td>
            <td><code>p</code></td>
            <td><code>"_dp</code></td>
            <td>Keep the previous buffer when cutting content and paste</td>
        </tr>
        <tr>
            <td><code>n</code> or <code>v</code> or <code>x</code></td>
            <td><code>y</code> or <code>Y</code></td>
            <td><code>"+y</code></td>
            <td>Copy the line or the selected content in the clipboard</td>
        </tr>
        <tr>
            <td><code>n</code> or <code>v</code></td>
            <td><code>d</code></td>
            <td><code>"_d</code></td>
            <td>Delete the buffer content when deleting a word/line</td>
        </tr>
        <tr>
            <td><code>n</code></td>
            <td><code>&lt;leader&gt;s</code></td>
            <td><code>[[:%s/\&lt;&lt;C-r&gt;&lt;C-w&gt;\&gt;/&lt;C-r&gt;&lt;C-w&gt;/gI&lt;Left&gt;&lt;Left&gt;&lt;Left&gt;]]</code></td>
            <td>Search current word and replace all occurences in the entire file</td>
        </tr>
        <tr>
            <td><code>n</code></td>
            <td><code>&lt;leader&gt;x</code></td>
            <td><code>&lt;cmd&gt;!chmod +x %&lt;CR&gt;</code></td>
            <td>Give executable permission to the current file</td>
        </tr>
        <tr>
            <td><code>n</code></td>
            <td><code>&lt;C-h&gt;</code></td>
            <td><code>&lt;C-w&gt;h</code></td>
            <td>Focuses the left window</td>
        </tr>
        <tr>
            <td><code>n</code></td>
            <td><code>&lt;C-l&gt;</code></td>
            <td><code>&lt;C-w&gt;l</code></td>
            <td>Focuses the right window</td>
        </tr>
        <tr>
            <td><code>n</code></td>
            <td><code>&lt;C-k&gt;</code></td>
            <td><code>&lt;C-w&gt;k</code></td>
            <td>Focuses the upper top window</td>
        </tr>
        <tr>
            <td><code>n</code></td>
            <td><code>&lt;C-j&gt;</code></td>
            <td><code>&lt;C-w&gt;j</code></td>
            <td>Focuses the bottom window</td>
        </tr>
        <tr>
            <td><code>n</code></td>
            <td><code>&lt;C-n&gt;</code></td>
            <td><code>:Neotree toggle left&lt;CR&gt;</code></td>
            <td>Open on the left side of the window the file tree</td>
        </tr>
        <tr>
            <td><code>n</code></td>
            <td><code>&lt;C-g&gt;</code></td>
            <td><code>:Neotree toggle float git_status&lt;CR&gt;</code></td>
            <td>Toggle a floating window containig a git support, <code>?</code> for help</td>
        </tr>
        <tr>
            <td><code>n</code></td>
            <td><code>&lt;C-b&gt;</code></td>
            <td><code>:Neotree toggle float buffers&lt;CR&gt;</code></td>
            <td>Toggle a floating window containig all opened buffers, <code>?</code> for help</td>
        </tr>
        <tr>
            <td colspan="4"><em>ToggleTerm plugin required</em></td>
        </tr>
        <tr>
            <td><code>n</code></td>
            <td><code>&lt;leader&gt;pt</code></td>
            <td><code>:ToggleTerm&lt;CR&gt;</code></td>
            <td>Toggle a floating terminal, <code>:ToggleTerm</code> is an <code>autocmd</code> defined previously</td>
        </tr>
        <tr>
            <td colspan="4"><em>Peek plugin required</em></td>
        </tr>
        <tr>
            <td><code>n</code></td>
            <td><code>&lt;leader&gt;po</code></td>
            <td><code>:PeekOpen&lt;CR&gt;</code></td>
            <td>Opens in the browser, specified in <code>lua/core/plugins/core/nvim-peek.lua</code> module, a preview of markdown file</td>
        </tr>
        <tr>
            <td colspan="4"><em>Undotree plugin required</em></td>
        </tr>
        <tr>
            <td><code>n</code></td>
            <td><code>&lt;leader&gt;ut</code></td>
            <td><code>vim.cmd.UndotreeToggle</code></td>
            <td>Toggle a floating window on the left showing the undotree of the current buffer</td>
        </tr>
        <tr>
            <th colspan="4">lua/core/plugins/core/nvim-comment.lua</th>
        </tr>
        <tr>
            <td><code>n</code></td>
            <td><code>&lt;leader&gt;cc</code></td>
            <td><code>&lt;cmd&gt;set operatorfunc=CommentOperator&lt;CR&gt;g@l</code></td>
            <td>Toggle line comment on cursor position, calling a function previously defined</td>
        </tr>
        <tr>
            <td><code>v</code></td>
            <td><code>&lt;leader&gt;kc</code></td>
            <td><code>&lt;cmd&gt;set operatorfunc=CommentOperator&lt;CR&gt;g@</code></td>
            <td>Toggle line comment on all selected lines, calling a function previously defined</td>
        </tr>
        <tr>
            <th colspan="4">lua/core/plugins/core/nvim-telescope.lua</th>
        </tr>
        <tr>
            <td><code>n</code></td>
            <td><code>&lt;leader&gt;pf</code></td>
            <td><code>&lt;cmd&gt;Telescope find_files&lt;CR&gt;</code></td>
            <td>Opens a floating window containing all project files where you can filter by name and see a preview on the right. You can scroll lines on preview using <code>&lt;C-d&gt;</code> and <code>&lt;C-u&gt;</code>. You can scroll files using arrow or <code>&lt;TAB&gt;</code> and <code>&lt;S-TAB&gt;</code>. Click <code>?</code> in normal mode to toggle help</td>
        </tr>
        <tr>
            <td><code>n</code></td>
            <td><code>&lt;leader&gt;ps</code></td>
            <td><code>&lt;cmd&gt;Telescope live_grep&lt;CR&gt;</code></td>
            <td>Opens a floating window containing all project files and will search the string in all files and show matches like the previous one. You can scroll lines on preview using <code>&lt;C-d&gt;</code> and <code>&lt;C-u&gt;</code>. You can scroll files using arrow or <code>&lt;TAB&gt;</code> and <code>&lt;S-TAB&gt;</code>. Click <code>?</code> in normal mode to toggle help</td>
        </tr>
    </tbody>
</table>

To Be Continued...I need a roooouundabout
