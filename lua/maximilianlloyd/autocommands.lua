vim.cmd[[
  let g:copilot_no_tab_map = v:true
  
  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end
]]

P = function(v)
    print(vim.inspect(v))
    return v
end


RELOAD = function(...)
    return require("plenary.reload").reload_module(...)
end


R = function(name)
    RELOAD(name)
    return require(name)
end
  -- augroup _lsp
  --   autocmd!
  --   autocmd BufWritePre * lua vim.lsp.buf.formatting()
  -- augroup end
