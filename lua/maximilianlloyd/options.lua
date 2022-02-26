local macOptions = require("maximilianlloyd.os.mac")
local linuxOptions = require("maximilianlloyd.os.linux")

local options = {
    clipboard = "unnamedplus",
    cmdheight = 2,
    completeopt = { "menuone", "noselect" },
    conceallevel = 0,
    fileencoding = "utf-8",
    mouse = "a",
	timeoutlen=500,
	ttimeoutlen=50,
	scrolloff=8,
    sidescrolloff=8,
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
    cursorline=true
}

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[
highlight CursorLine ctermfg=White ctermbg=1 cterm=bold
]]
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
vim.opt.shortmess:append "c"

local function applyOptions (_options)
    for k, v in pairs(_options) do
        vim.opt[k] = v
    end
end

applyOptions(options)

local sysname = vim.loop.os_uname().sysname

if (sysname == 'Mac') then
    print("Mac detected")
    applyOptions(macOptions)
elseif (sysname == 'Linux') then
    print("Linux detected")
    applyOptions(linuxOptions)
end
