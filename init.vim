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

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ayu-theme/ayu-vim'


Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()


let g:airline_theme='ayu_dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

set scrolloff=8
set number
set relativenumber


set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set noshowmode

" let g:material_style='deep ocean'
set termguicolors
let ayucolor="dark"
colorscheme ayu

let mapleader = " "
nnoremap <leader>vv :Vex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

nnoremap <leader>ff <cmd>Telescope git_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <C-p> <cmd>Telescope git_files<cr>
nnoremap <C-h> :cprev<cr>
nnoremap <C-l> :cnext<cr>

" To fix on windows
set t_ut=""


" Nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
