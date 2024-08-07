vim.g.mapleader = " "
vim.g.maplocalleader = ","

for _, source in ipairs({
	"core.options",
	"core.autocommands",
	"core.keymap",
	"core.icons",
	"core.lazy",
	"core.utils",
}) do
	local status_ok, fault = pcall(require, source)
	if not status_ok then
		vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault)
	end
end
-- vim.cmd.colorscheme('midnight')
