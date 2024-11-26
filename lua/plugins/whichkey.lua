return { -- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	event = "VimEnter", -- Sets the loading event to 'VimEnter'
	opts = {},
	-- Document existing key chains
	keys = {
		["<leader>n"] = { name = "[N]oice", _ = "which_key_ignore" },
		["<leader>g"] = { name = "[G]it", _ = "which_key_ignore" },
		["<leader>gt"] = { name = "[T]oggle", _ = "which_key_ignore" },
		["<leader>gh"] = { name = "[H]unks ", _ = "which_key_ignore" },
		["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
		["<leader>f"] = { name = "[F]ind", _ = "which_key_ignore" },
		["<leader>l"] = { name = "[L]sp", _ = "which_key_ignore" },
		["<leader>t"] = { name = "[T]erminal", _ = "which_key_ignore" },
		["<leader>j"] = { name = "[J]ag ", _ = "which_key_ignore" },
		["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
		["<localleader>n"] = { name = "[N]otes", _ = "which_key_ignore" },
		["<localleader>d"] = { name = "[D]evDocs", _ = "which_key_ignore" },
		-- ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
		["\\"] = { name = "[T]oggle", _ = "which_key_ignore" },
	},
}
