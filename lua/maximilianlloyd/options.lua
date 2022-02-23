local macOptions = require("maximilianlloyd.os.mac")
local linuxOptions = require("maximilianlloyd.os.linux")

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
	wrap=false,
	undofile=true,
	signcolumn="yes",
	incsearch=true,
	showmode=true,
}

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
vim.opt.shortmess:append "c"

local function applyOptions (_options)
    for k, v in pairs(_options) do
        vim.opt[k] = v
    end
end

applyOptions(options)

local isMac = vim.fn.has("macunix")
local isLinux = vim.fn.has("linux")

if (isMac) then
    print("Mac detected")
    applyOptions(macOptions)
elseif (isLinux) then
    print("Linux detected")
    applyOptions(linuxOptions)
end
