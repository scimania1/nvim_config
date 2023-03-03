local options = {
	-- guicursor = "",
	smartcase = true,
	shiftwidth = 2,
	breakindent = true,
	completeopt = { "menuone", "noselect", "noinsert" },
  wildmenu = true,
	tabstop = 2,
	softtabstop = 2,
	expandtab = true,
	cursorline = true,
	cursorlineopt = "both",
	fileencoding = "UTF-8",
	foldenable = false,
	number = true,
	rnu = true,
	mouse = "a",
	wrap = false,
	hlsearch = false,
	incsearch = true,
	ignorecase = true,
	scrolloff = 8,
	termguicolors = true,
	cmdheight = 1,
	signcolumn = "yes",
	whichwrap = "bs<>[]hl",
	timeoutlen = 800,
	updatetime = 500,
	list = true,
}

vim.opt.shortmess:append("c")
for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.opt.listchars:append("eol:↴")

vim.g.mapleader = " "
