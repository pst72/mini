-- vim.keymap.set("n", "<leader>dc", "<cmd>ColorizerToggle<CR>", { desc = "Toggle colorizer" })
return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		local status, colorizer = pcall(require, "colorizer")
		if not status then
			print("COLORIZER NOT LOADED")
			return
		end

		colorizer.setup({
			"*",
            default_options = {
                RGB      = true;         -- #RGB hex codes #909
                RRGGBB   = true;         -- #RRGGBB hex codes #654321
                names    = true;         -- "Name" codes like Blue Red
                RRGGBBAA = true;        -- #RRGGBBAA hex codes
                rgb_fn   = true;        -- CSS rgb() and rgba() functions
                hsl_fn   = true;        -- CSS hsl() and hsla() functions
                css      = true;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn   = true;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
                -- Available modes: foreground, background
                mode     = 'background'; -- Set the display mode.
              }
		})
	end,
	enabled = true,
	lazy = true,
	cmd = "ColorizerToggle",
}
