-- All config for nvim editor feature and appereance

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = false
vim.opt.autoread = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true

-- line number
vim.wo.number = true
-- wrap line on new line when is too long
vim.wo.wrap = false
-- autoindent
vim.opt.autoindent = true

-- take trace of all undotree
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true;

-- don't highlight works after search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- when scroll down keeps at least 10 lines
-- vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50
