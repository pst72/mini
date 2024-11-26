local detail = false
-- Declare a global function to retrieve the current directory
function _G.get_oil_winbar()
	local dir = require("oil").get_current_dir()
	if dir then
		return vim.fn.fnamemodify(dir, ":~")
	else
		-- If there is no current directory (e.g. over ssh), just show the buffer name
		return vim.api.nvim_buf_get_name(0)
	end
end
return {

	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		view_options = {
			show_hidden = true,
		},
		win_options = {
			winbar = "%!v:lua.get_oil_winbar()",
		},
		keymaps = {
			["gd"] = {
				desc = "Toggle file detail view",
				callback = function()
					detail = not detail
					if detail then
						require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
					else
						require("oil").set_columns({ "icon" })
					end
				end,
			},
		},
	},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons

	vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" }),
	vim.keymap.set("n", "<leader>-", "<cmd>Oil --float<cr>", { desc = "Open parent directory" }),
}