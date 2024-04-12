vim.keymap.set("n", "<localleader>di", "<cmd>DevdocsInstall<cr>", { desc = "Install DevDocs " })
vim.keymap.set("n", "<localleader>dU", "<cmd>DevdocsUninstall<cr>", { desc = "UnInstall DevDocggs " })
vim.keymap.set({ "n", "v" }, "<localleader>dO", "<cmd>DevdocsOpen<cr>", { desc = "Open DevDocs " })
vim.keymap.set({ "n", "v" }, "<localleader>dF", "<cmd>DevdocsOpenFloat<cr>", { desc = "Open DevDocs in Float " })
vim.keymap.set(
	{ "n", "v" },
	"<localleader>do",
	"<cmd>DevdocsOpenCurrent<cr>",
	{ desc = "Open Current filetype DevDocs " }
)
vim.keymap.set(
	{ "n", "v" },
	"<localleader>df",
	"<cmd>DevdocsOpenCurrentFloat<cr>",
	{ desc = "Open Current filetype DevDocs in Float " }
)
vim.keymap.set("n", "<localleader>du", "<cmd>DevdocsUpdate<cr>", { desc = "Update DevDocs " })
return {
	"luckasRanarison/nvim-devdocs",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	enabled = true,
	lazy = true,
	cmd = {
		"DevdocsInstall",
		"DevdocsUninstall",
		"DevdocsOpen",
		"DevdocsOpenFloat",
		"DevdocsOpenCurrent",
		"DevdocsOpenCurrentFloat",
		"DevdocsUpdate",
	},
	opts = {
		dir_path = vim.fn.stdpath("data") .. "/devdocs", -- installation directory
		telescope = {}, -- passed to the telescope picker
		float_win = { -- passed to nvim_open_win(), see :h api-floatwin
			relative = "editor",
			height = 25,
			width = 100,
			border = "rounded",
		},
		wrap = false, -- text wrap, only applies to floating window
		previewer_cmd = "glow", -- for example: "glow"
		cmd_args = { "s", "dark", "w", "80" }, -- example using glow: { "-s", "dark", "-w", "80" }
		cmd_ignore = {}, -- ignore cmd rendering for the listed docs
		picker_cmd = true, -- use cmd previewer in picker preview
		picker_cmd_args = { "s", "dark", "w", "80" }, -- example using glow: { "-s", "dark", "-w", "50" }
		mappings = { -- keymaps for the doc buffer
			open_in_browser = "",
		},
		ensure_installed = {}, -- get automatically installed
		after_open = function(bufnr)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "q", ":close<CR>", {})
			vim.api.nvim_buf_set_keymap(bufnr, "n", "<Esc>", ":close<CR>", {})
		end, -- callback that runs after the Devdocs window is opened. Devdocs buffer ID will be passed in
	},
}
