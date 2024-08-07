return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({

			signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
			numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
			linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff = true, -- Toggle with `:Gitsigns toggle_word_diff`
			attach_to_untracked = true,
			current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			preview_config = {
				-- Options passed to nvim_open_win
				border = "rounded",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation

				map("n", "]h", function()
					if vim.wo.diff then
						return "]h"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				map("n", "[h", function()
					if vim.wo.diff then
						return "[h"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				-- Actions
				map("n", "<leader>ghs", gs.stage_hunk, { desc = "Stage Hunk" })
				map("n", "<leader>ghr", gs.reset_hunk, { desc = "Reset Hunk" })
				map("v", "<leader>ghs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Stage Hunk" })
				map("v", "<leader>ghr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Reset Hunk" })
				map("n", "<leader>ghS", gs.stage_buffer, { desc = "Stage Buffer" })
				map("n", "<leader>ghu", gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })
				map("n", "<leader>ghR", gs.reset_buffer, { desc = "Reset Buffer" })
				map("n", "<leader>ghp", gs.preview_hunk, { desc = "Attach Gitsigns" })
				map("n", "<leader>ghb", function()
					gs.blame_line({ full = true })
				end, { desc = "Blame Line" })
				map("n", "<leader>ga", gs.attach, { desc = "Attach Gitsigns" })
				map("n", "<leader>gd", gs.detach, { desc = "Detach Gitsigns" })
				map("n", "<leader>gtb", gs.toggle_current_line_blame, { desc = "Toggle Git blame line" })
				map("n", "<leader>gtd", gs.toggle_deleted, { desc = "Toggle deleted" })
				map("n", "<leader>gtl", gs.toggle_linehl, { desc = "Toggle line highlight" })
				map("n", "<leader>gtn", gs.toggle_numhl, { desc = "Toggle number highlight" })
				map("n", "<leader>gts", gs.toggle_signs, { desc = "Toggle signs" })
				map("n", "<leader>gtw", gs.toggle_word_diff, { desc = "Toggle word diff" })
				map("n", "<leader>ghd", gs.diffthis, { desc = "Diff this" })
				map("n", "<leader>ghD", function()
					gs.diffthis("~")
				end, { desc = "Diff this ~" })

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
			end,
		})
	end,
}
