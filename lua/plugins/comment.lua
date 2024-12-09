vim.keymap.set(
	{ "n", "v" },
	"<leader>c",
	":norm gcc<cr>",
	-- "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",
	{ desc = "Comment out line" }
)
return {
	"numToStr/Comment.nvim",
	opts = {
		toggler = {
			line = "gcc",
			block = "gbc",
		},
		opleader = { line = "gc", block = "gb" },
		extra = { above = "gcO", below = "gco", eol = "gcA" },
		mappings = {
			-- operator-pending mapping
			-- Includes:
			--  `gcc`               -> line-comment  the current line
			--  `gcb`               -> block-comment the current line
			--  `gc[count]{motion}` -> line-comment  the region contained in {motion}
			--  `gb[count]{motion}` -> block-comment the region contained in {motion}
			basic = true,
			-- extra mapping
			-- Includes `gco`, `gcO`, `gcA`
			extra = true,
		},
	},
	enabled = false,
}
