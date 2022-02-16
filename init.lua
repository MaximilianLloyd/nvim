require("plenary.reload").reload_module("maximilianlloyd", true)
require("maximilianlloyd.plugins")
require("maximilianlloyd.options")
require("maximilianlloyd.colorscheme")
require("maximilianlloyd.keymaps")
require("maximilianlloyd.autocommands")
require("maximilianlloyd.lsp")
require("maximilianlloyd.telescope")
require("maximilianlloyd.cmp")
require("maximilianlloyd.treesitter")
require("maximilianlloyd.lualine-mine")
require("maximilianlloyd.dashboard-nvim")
-- require("maximilianlloyd.which-key")
require("maximilianlloyd.bufferline")
require("maximilianlloyd.diffview")
require("maximilianlloyd.luasnip")
require("maximilianlloyd.discord")
require("maximilianlloyd.luatree")

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
