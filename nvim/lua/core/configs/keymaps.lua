-- all config for nvim keymaps

-- move highlighted lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- search with cursor in the middle of the page
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- when you press 'p' for paste, keep the previous buffer
vim.keymap.set("x", "p", '"_dP')

-- yank the content of vim in the clipboard
vim.keymap.set("n", "y", '"+y')
vim.keymap.set("v", "y", '"+y')
vim.keymap.set("n", "Y", '"+y')

-- delete the buffer when deletes word
vim.keymap.set("n", "d", '"_d')
vim.keymap.set("v", "d", '"_d')

-- searche the current word and replace with a new word in the entire file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- set this file permission to executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- change window focus
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

-- Plugin keymaps

-- Neotree

vim.keymap.set("n", "<C-n>", ":Neotree toggle left<CR>")
vim.keymap.set("n", "<C-g>", ":Neotree toggle float git_status<CR>")
vim.keymap.set("n", "<C-b>", ":Neotree toggle float buffers<CR>")

-- Toggleterm
function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
vim.keymap.set("n", "<leader>pt", ":ToggleTerm<CR>")

-- Peek
local peek = require("peek")

vim.api.nvim_create_user_command("PeekOpen", peek.open, {})
vim.api.nvim_create_user_command("PeekClose", peek.close, {})

vim.keymap.set("n", "<leader>po", ":PeekOpen<CR>")

-- Undotree
vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle)
