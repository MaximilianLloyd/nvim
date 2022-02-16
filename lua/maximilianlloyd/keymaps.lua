local map = vim.keymap.set

local silentOptions = { silent = true }

map("n", "<C-Up>", "<cmd>resize -2<CR>", silentOptions)
map("n", "<C-Down>", "<cmd>resize +2<CR>", silentOptions)
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", silentOptions)
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", silentOptions)
