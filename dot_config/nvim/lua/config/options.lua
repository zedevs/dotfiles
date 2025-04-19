-- enable transparent background
vim.cmd([[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]])

if vim.g.vscode then
  -- search ignoring case
  vim.opt.ignorecase = true
  -- disable "ignorecase" option if the search pattern contains upper case characters
  vim.opt.smartcase = true
end
