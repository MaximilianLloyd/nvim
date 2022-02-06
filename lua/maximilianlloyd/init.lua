require("maximilianlloyd.telescope")
require("maximilianlloyd.lsp")
require("maximilianlloyd.lualine")
require("maximilianlloyd.dashboard-nvim")
require("maximilianlloyd.which-key")
require("maximilianlloyd.bufferline")
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
