call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ntk148v/vim-horizon'
Plug 'tpope/vim-commentary'
Plug 'dart-lang/dart-vim-plugin'
Plug 'kien/ctrlp.vim'
" Plug ':help NERDTreeMappingspreservim/nerdtree'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

set termguicolors
set number

" Provides tab-completion for all file related tasks
set path+=**
set wildmenu

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

colorscheme horizon
" autocmd vimenter * NERDTree
