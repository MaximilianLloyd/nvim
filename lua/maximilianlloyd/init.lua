require("plenary.reload").reload_module("maximilianlloyd", true)
require("maximilianlloyd.telescope")
require("maximilianlloyd.lsp")
require("maximilianlloyd.cmp")
require("maximilianlloyd.treesitter")
-- require("maximilianlloyd.lualine")
-- require("maximilianlloyd.lualine-bubbles")
require("maximilianlloyd.lualine-mine")
require("maximilianlloyd.dashboard-nvim")
require("maximilianlloyd.which-key")
require("maximilianlloyd.bufferline")
require("maximilianlloyd.diffview")
-- require("maximilianlloyd.harpoon")
require("maximilianlloyd.luasnip")
require("maximilianlloyd.discord")
require("maximilianlloyd.keymaps")
-- require("maximilianlloyd.auto-session")

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

P = function(v)
  print(vim.inspect(v))
  return v
end

if pcall(require, 'plenary') then
  RELOAD = require('plenary.reload').reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end
