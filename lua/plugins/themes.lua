vim.o.termguicolors = true
return {
	"EdenEast/nightfox.nvim",
	priority = 1000,
	config = function()
		-- vim.cmd 'colorscheme nightfox'
		-- vim.cmd 'colorscheme duskfox'
		-- vim.cmd 'colorscheme nordfox'
		-- vim.cmd 'colorscheme terafox'
		vim.cmd 'colorscheme carbonfox'
	end,
}
-- return {
-- 	"sam4llis/nvim-tundra",
-- 	priority = 1000,
-- 	config = function()
-- 		require('nvim-tundra').setup({})
-- 		vim.opt.background = 'dark' -- set this to dark or light
-- 		vim.cmd 'colorscheme tundra'
-- 	end,
-- }
-- return {
-- 	"folke/tokyonight.nvim",
-- 	branch = "main",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd 'colorscheme tokyonight-night'
-- 		-- vim.cmd 'colorscheme tokyonight-storm'
-- 		-- vim.cmd 'colorscheme tokyonight-moon'
-- 	end,
-- }
-- return {
-- 	"rebelot/kanagawa.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd("colorscheme kanagawa-wave")
-- 		-- vim.cmd("colorscheme kanagawa-dragon")
-- 	end,
-- }
-- return {
--   'nyoom-engineering/oxocarbon.nvim',
-- 	priority = 1000,
--   config = function()
--     vim.opt.background = 'dark' -- set this to dark or light
--     vim.cmd 'colorscheme oxocarbon'
--   end,
-- }
-- return {
-- 	-- Theme inspired by Atom
-- 	'navarasu/onedark.nvim',
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd.colorscheme 'onedark'
-- 	end,
-- }
-- return {
--   'catppuccin/nvim',
--   name = 'catppuccin',
--   priority = 1000,
--   config = function()
--     vim.cmd 'colorscheme catppuccin-mocha'
--     -- vim.cmd 'colorscheme catppuccin-macchiato'
--     -- vim.cmd 'colorscheme catppuccin-frappe'
--   end,
-- }
-- return {
--   'dasupradyumna/midnight.nvim',
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme 'midnight'
--   end,
-- }
