vim.cmd[[
  let g:copilot_no_tab_map = v:true
  
  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end
]]

  -- augroup _lsp
  --   autocmd!
  --   autocmd BufWritePre * lua vim.lsp.buf.formatting()
  -- augroup end
