-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- remap jj to esc
vim.keymap.set("i", "jj", "<esc>", { silent = true, desc = "Escape insert mode" })

-- remap jk to esc + save
vim.keymap.set("i", "jk", "<esc>:w<cr>", { silent = false, desc = "Escape insert mode" })

vim.keymap.set({ "v", "n" }, "U", "<C-R>", { noremap = true, desc = "Redo last change" })
vim.keymap.set("n", "Y", "y$", { noremap = true, desc = "Yank to end of line" })
vim.keymap.set("n", "D", "d$", { noremap = true, desc = "Delete to end of line" })
vim.keymap.set("n", "C", "c$", { noremap = true, desc = "Change to end of line" })
vim.keymap.set("v", "p", "P", { noremap = true, desc = "Paste after cursor" })
vim.keymap.set("v", "P", "P", { noremap = true, desc = "Paste before cursor" })
vim.keymap.set("v", "d", '"_d', { noremap = true, desc = "Delete without yanking" })

-- disable arrow keys
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")

if vim.g.vscode then
  -- remap ctrl+s to save
  vim.keymap.set({ "i", "n", "v" }, "<C-s>", ":w<CR>", { desc = "Save file" })
  vim.keymap.del("n", "<leader>,")
  vim.keymap.del("n", "<leader>e")
end
