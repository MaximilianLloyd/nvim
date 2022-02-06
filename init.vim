call plug#begin('~/.config/nvim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'editorconfig/editorconfig-vim'
Plug 'akinsho/bufferline.nvim'

" Session
" Plug 'rmagatti/auto-session'

" Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'

"
Plug 'nvim-lualine/lualine.nvim'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'github/copilot.vim' 
Plug 'sheerun/vim-polyglot'
Plug 'rust-lang/rust.vim'
Plug 'ryanoasis/vim-devicons'


" Tools
Plug 'fatih/vim-go'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

Plug 'onsails/lspkind-nvim', { 'commit': '06872e887e7e4579765cc51fa6b0e7643b4284fa' }
Plug 'simrat39/symbols-outline.nvim'
Plug 'saadparwaiz1/cmp_luasnip'

" Snippets 
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" Themes
Plug 'ayu-theme/ayu-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'marko-cerovac/material.nvim' 


" Dashboard
Plug 'glepnir/dashboard-nvim'

Plug 'folke/which-key.nvim'


call plug#end()

set timeoutlen=500
set ttimeoutlen=50
set scrolloff=8
set number
set relativenumber
set ic
set nohls
set hidden
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set noerrorbells

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set noshowmode
set nowrap

" Extra column on the left for linting
set signcolumn=yes

set termguicolors

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_transparent_bg=1

" Whichkey
let ayucolor="dark"
colorscheme ayu

" Transparency
hi normal guibg=000000
highlight clear SignColumn
hi LineNrAbove guifg=#CCCCCC ctermfg=white
hi LineNrBelow guifg=#CCCCCC ctermfg=white
set fillchars=""

let mapleader = " " 
nnoremap <leader>vv :Vex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
noremap <silent> <C-S> :update<CR>
inoremap <silent> <C-S> <ESC> :update<CR>

nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>
nnoremap <leader>fb <cmd>Telescope file_browser<CR>
nnoremap <leader>b <cmd>Telescope buffers<CR>

" Telescope git stuff
nnoremap <leader>gc <cmd>Telescope git_commits<CR>
nnoremap <leader>gb <cmd>Telescope git_branches<CR>

" Grep
nnoremap <leader>fr :lua require('telescope.builtin').lsp_references()<CR>
" nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("🔍 Grep for > ")})<CR>

nnoremap <C-p> <cmd>Telescope git_files<cr>
nnoremap <C-h> :cprev<CR>
nnoremap <C-l> :cnext<CR>
nnoremap <C-o> :copen<CR>
nnoremap <C-x> :cclose<CR>

" Symbols outline
nnoremap <leader>o :SymbolsOutline<CR>

" move code
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv


" Session
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>

set updatetime=300
set nobackup
set nowritebackup
set shortmess+=c

" not sure what this does
" vnoremap <leader>p "_dP
vnoremap <leader>y "+y

" Prettier
" command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Copilot remap
imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true


" Autoformat
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.html lua vim.lsp.buf.formatting_sync(nil, 1000)



" Whichkey
lua require("maximilianlloyd")

hi WhichKeyFloat ctermbg=BLACK ctermfg=BLACK
autocmd ColorScheme * highlight WhichKeyFloat ctermbg=NONE ctermfg=NONE
