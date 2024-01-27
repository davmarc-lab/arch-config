-- don't load the default file tree
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
vim.g.nvim_tree_auto_close = 1

-- additional config for neo-tree
require("neo-tree").setup({
    window = {
        position = 'float',
        mappings = {
            ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
        },
    },
    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = true,
        },
    },
    buffers = {
        follow_current_file = {
            enabled = true,
            leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
    },
})

vim.keymap.set('n', '<c-n>', ':Neotree toggle left<CR>')
vim.keymap.set('n', '<c-g>', ':Neotree toggle float git_status<CR>')
vim.keymap.set('n', '<c-b>', ':Neotree toggle float buffers<CR>')
