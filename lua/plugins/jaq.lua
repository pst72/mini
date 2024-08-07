return {
	"is0n/jaq-nvim",
	-- Use a protected call so we don't error out on first use
	-- local status_ok, jaq = pcall(require, "jaq-nvim")
	-- if not status_ok then
	--   return
	-- end
	enabled = true,
	lazy = true,
	cmd = "Jaq",
	opts = {
		-- jaq.setup({
		-- Commands used with 'Jaq'
		cmds = {
			-- Uses external commands such as 'g++' and 'cargo'
			external = {
				typescript = "deno run %",
				javascript = "node %",
				-- markdown = 'glow %',
				markdown = "frogmouth %",
				python = "python3 %",
				rust = "rustc % && ./$fileBase && rm $fileBase",
				cpp = "g++ % -o $fileBase && ./$fileBase",
				go = "go run %",
				sh = "sh %",
				-- lua = 'lua %',
			},
			-- Uses internal commands such as 'source' and 'luafile'
			internal = {
				lua = "luafile %",
				vim = "source %",
			},
		},
		keys = {
			{ "<leader>jj", "<cmd>Jaq<cr>", desc = "Run Code in Float" },
			{ "<F10>", "<cmd>Jaq<cr>", desc = "Run Code in Float" },
			{ "<leader>jh", "<cmd>Jaq terminal<cr>", desc = "Run Code in Terminal" },
			{ "<leader>js", "<cmd>Jaq internal<cr>", desc = "Source Internal Code " },
			{ "<leader>jq", "<cmd>Jaq quickfix<cr>", desc = "Run Code in QuickFix" },
			{ "<leader>jb", "<cmd>Jaq bang<cr>", desc = "Run Code in StatusLine" },
		},
		behavior = {
			-- Start in insert mode
			startinsert = true,
			-- Default UI used (see `Usage` for options)
			default = "float",
			-- Switch back to current file
			-- after using Jaq
			wincmd = false,
		},
		-- UI settings
		ui = {
			-- Floating Window / FTerm settings
			float = {
				-- Floating window border (see ':h nvim_open_win')
				border = "rounded",
				-- Num from `0 - 1` for measurements
				height = 0.8,
				width = 0.8,
				x = 0.5,
				y = 0.5,
				-- Highlight group for floating window/border (see ':h winhl')
				border_hl = "FloatBorder",
				float_hl = "Normal",
				-- Floating Window Transparency (see ':h winblend')
				blend = 0,
			},
			terminal = {
				-- Position of terminal
				position = "bot",
				-- Open the terminal without line numbers
				line_no = false,
				-- Size of terminal
				size = 20,
			},
			toggleterm = {
				-- Position of terminal, one of "vertical" | "horizontal" | "window" | "float"
				position = "vertical",
				-- Size of terminal
				size = 20,
			},
			quickfix = {
				-- Position of quickfix window
				position = "bot",
				-- Size of quickfix window
				size = 20,
			},
		},
	},
	vim.keymap.set("n", "<leader>jj", "<cmd>Jaq<cr>", { desc = "Run Code in Float" }),
	vim.keymap.set("n", "<F10>", "<cmd>Jaq<cr>", { desc = "Run Code in Float" }),
	vim.keymap.set("n", "<leader>jh", "<cmd>Jaq terminal<cr>", { desc = "Run Code in Terminal" }),
	vim.keymap.set("n", "<leader>js", "<cmd>Jaq internal<cr>", { desc = "Source Internal Code " }),
	vim.keymap.set("n", "<leader>jq", "<cmd>Jaq quickfix<cr>", { desc = "Run Code in QuickFix" }),
	vim.keymap.set("n", "<leader>jb", "<cmd>Jaq bang<cr>", { desc = "Run Code in StatusLine" }),
}
