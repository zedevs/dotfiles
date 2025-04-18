-- <leader> key
vim.g.mapleader = ' '
-- sync system clipboard
vim.opt.clipboard = 'unnamedplus'
-- search ignoring case
vim.opt.ignorecase = true
-- disable "ignorecase" option if the search pattern contains upper case characters
vim.opt.smartcase = true


vim.keymap.set("n", "U", "<C-R>", { noremap = true, desc = "Redo last change" })
vim.keymap.set('n', '<Esc>', ':nohlsearch<cr>', { noremap = true, desc = "Clear search highlights" })
vim.keymap.set("n", "Y", "y$", { noremap = true, desc = "Yank to end of line" })
vim.keymap.set("n", "D", "d$", { noremap = true, desc = "Delete to end of line" })
vim.keymap.set("n", "C", "c$", { noremap = true, desc = "Change to end of line" })
vim.keymap.set("v", "p", "P", { noremap = true, desc = "Paste after cursor" })
vim.keymap.set("v", "P", "P", { noremap = true, desc = "Paste before cursor" })

-- disable arrow keys
vim.keymap.set("n","<Up>","<Nop>")
vim.keymap.set("n","<Down>","<Nop>")
vim.keymap.set("n","<Left>","<Nop>")
vim.keymap.set("n","<Right>","<Nop>")

