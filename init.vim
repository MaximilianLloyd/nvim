call plug#begin('~/.config/nvim/plugged')

Plug 'marko-cerovac/material.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'editorconfig/editorconfig-vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'github/copilot.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'sheerun/vim-polyglot'

Plug 'ryanoasis/vim-devicons'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Themes
Plug 'ayu-theme/ayu-vim'
Plug 'gruvbox-community/gruvbox'


Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


Plug 'styled-components/vim-styled-components'

call plug#end()

let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-eslint', 'coc-prettier']


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
" Don't wrap lines
set nowrap

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set incsearch
set noshowmode
" Extra column on the left for linting
set signcolumn=yes


" let g:material_style='deep ocean'
set termguicolors
let ayucolor="dark"

set background=dark
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_transparent_bg=1
colorscheme gruvbox
hi normal guibg=000000

let mapleader = " "
nnoremap <leader>vv :Vex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
noremap <silent> <C-S> :update<CR>

nnoremap <leader>ff <cmd>Telescope git_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Grep
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("🔍 Grep for > ")})<CR>

nnoremap <C-p> <cmd>Telescope git_files<cr>
nnoremap <C-h> :cprev<cr>
nnoremap <C-l> :cnext<cr>

" move code
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" Nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Coc 
nnoremap cf :CocFix<CR>

" not sure what this does
" vnoremap <leader>p "_dP
vnoremap <leader>y "+y

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Copilot remap
imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
