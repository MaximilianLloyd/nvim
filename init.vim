call plug#begin('~/.config/nvim/plugged')

Plug 'marko-cerovac/material.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
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
Plug 'rust-lang/rust.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

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

" Airline
let g:airline_theme='ayu'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '>'
let g:airline#extensions#tabline#formatter = 'unique_tail'

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
colorscheme ayu
" Transparency
hi normal guibg=000000
highlight clear SignColumn

let mapleader = " "
nnoremap <leader>vv :Vex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
noremap <silent> <C-S> :update<CR>

" Telescope
lua << EOF
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
      file_sorter = require('telescope.sorters').get_fzy_sorter,
      prompt_prefix = ' >',
      color_devicons = true,

      file_previewer = require('telescope.previewers').vim_buffer_cat.new,
      grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
      qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

      mappings = {
        i = {
            ["<esc>"] = actions.close,
            ["<C-q>"] = actions.send_to_qflist,
        },
    },
  },
  pickers = {
  },
  extensions = {
    fzy_native = { 
        override_generic_sorter = false,
        override_file_sorter = true
    },
  }
}
require('telescope').load_extension('fzy_native')
EOF


" Window navigation
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>
nnoremap <leader>fc <cmd>Telescope git_commits<CR>
nnoremap <leader>fts <cmd>Telescope treesitter<CR>
nnoremap <leader>gb <cmd>Telescope git_branches<CR>

" Grep
" nnoremap <leader>fr :lua require('telescope.builtin').lsp_references()<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("🔍 Grep for > ")})<CR>

nnoremap <C-p> <cmd>Telescope git_files<cr>
nnoremap <C-h> :cprev<CR>
nnoremap <C-l> :cnext<CR>
nnoremap <C-o> :copen<CR>
nnoremap <C-x> :cclose<CR>

" move code
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" Nerdtree
let NERDTreeShowBookmarks=1
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Coc 
let g:coc_node_path = '/Users/maximilianlloyd/.nvm/versions/node/v16.13.0/bin/node'
nnoremap cf :CocFix<CR>
nnoremap gd :call CocActionAsync('jumpDefinition')<CR>
nnoremap cl :CocList<CR>
nnoremap co :CocOutline<CR>

" not sure what this does
" vnoremap <leader>p "_dP
vnoremap <leader>y "+y

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Copilot remap
imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

