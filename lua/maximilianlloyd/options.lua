local options = {
	timeoutlen=500,
	ttimeoutlen=50,
	scrolloff=8,
	number=true,
	relativenumber=true,
	ic=true,
	hls=false,
	hidden=true,
	tabstop=4,
	softtabstop=4,
	shiftwidth=4,
	expandtab=true,
	smartindent=true,
	errorbells=false,
	swapfile=false,
	backup=false,
	undodir="/home/max/.vim/undodir",
	wrap=false,
	undofile=true,
	signcolumn="yes",
	incsearch=true,
	showmode=true,
}


vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end
