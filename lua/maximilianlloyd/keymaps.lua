local map = vim.keymap.set
local tspbuiltin = require "telescope.builtin"
local file_browser = require "telescope".extensions.file_browser.file_browser
local silentOptions = { noremap = true, silent = true }

-- vim.g.mapleader = " "

vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<C-Up>", "<cmd>resize -2<CR>", silentOptions)
map("n", "<C-Down>", "<cmd>resize +2<CR>", silentOptions)
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", silentOptions)
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", silentOptions)

map("n", "<C-p>", tspbuiltin.git_files, silentOptions)
map("n", "<leader>b", tspbuiltin.buffers, silentOptions)
map("n", "<leader>gc", tspbuiltin.git_branches, silentOptions)
map("n", "<leader>fr", tspbuiltin.lsp_references, silentOptions)
map("n", "<leader>fg", tspbuiltin.live_grep, silentOptions)
map("n", "<leader>fb", file_browser, silentOptions)
map("n", "<leader>ts", tspbuiltin.treesitter, silentOptions)
map("n", "<leader>ht", tspbuiltin.help_tags, silentOptions)

map("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", silentOptions)

map("n", "<C-s>", "<cmd>update<CR>", silentOptions)
map("i", "<C-s>", "<ESC> :update<CR>", silentOptions)

map("n", "<leader><CR>", "<cmd>source ~/.config/nvim/init.lua<CR>",{ noremap = true, silent = false })

map("n", "<leader>ff", vim.lsp.buf.formatting, silentOptions)

map("i", "<C-a>", "copilot#Accept()", { expr = true, noremap = true, silent = true })

map("n", "<leader>ss", "<cmd>SessionSave<CR>", silentOptions)
map("n", "<leader>q", "<cmd>copen<CR>", silentOptions)


map("n", "<leader>q", "<cmd>copen<CR>", silentOptions)
map("n", "<C-h>", "<cmd>cprev<CR>", silentOptions)
map("n", "<C-l>", "<cmd>cnext<CR>", silentOptions)

map("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>", silentOptions)
map("n", "<leader>tf", "<cmd>NvimTreeToggle<CR>", silentOptions)

map("v", "<leader>y", '"+y', { silent = false })
-- Add two numbers together



