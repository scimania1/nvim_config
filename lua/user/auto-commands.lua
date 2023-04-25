local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

local remove_format = vim.api.nvim_create_augroup("RemoveFormatOptions", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
	group = remove_format,
	pattern = "*",
})

local format_document = vim.api.nvim_create_augroup("Format Document", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.lsp.buf.format()
	end,
	group = format_document,
	pattern = "*",
})
