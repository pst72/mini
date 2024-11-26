return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",

			build = "make",

			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-symbols.nvim" },
		{ "nvim-telescope/telescope-ui-select.nvim" },

		{ "nvim-tree/nvim-web-devicons" },
	},
	config = function()
		local actions = require("telescope.actions")
		local action_layout = require("telescope.actions.layout")
		local trouble = require("trouble.sources.telescope")
		-- [[ Configure Telescope ]]
		-- See `:help telescope` and `:help telescope.setup()`
		require("telescope").setup({
			-- You can put your default mappings / updates / etc. in here
			--  All the info you're looking for is in `:help telescope.setup()`
			--
			defaults = {
				mappings = {
					i = {
						["<esc><esc>"] = "close",
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-Up>"] = actions.results_scrolling_up,
						["<C-Down>"] = actions.results_scrolling_down,
						["<PageUp>"] = actions.preview_scrolling_up,
						["<PageDown>"] = actions.preview_scrolling_down,
						["<C-q>"] = actions.send_selected_to_qflist,
						["<C-l>"] = actions.send_to_qflist,
						["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
						["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
						["<cr>"] = actions.select_default,
						["<c-v>"] = actions.select_vertical,
						["<c-s>"] = actions.select_horizontal,
						["<c-t>"] = trouble.open,
						["<c-P>"] = action_layout.toggle_preview,
						["<c-o>"] = action_layout.toggle_mirror,
						-- ['<c-h>'] = actions.which_key,
						["<c-n>"] = actions.cycle_history_next,
						["<c-p>"] = actions.cycle_history_prev,
						["<c-x>"] = actions.delete_buffer,
					},
					n = {
						["<c-t>"] = trouble.open,
						["<PageUp>"] = actions.preview_scrolling_up,
						["<PageDown>"] = actions.preview_scrolling_down,
					},
				},
				prompt_prefix = "  ",
				preview = {
					mime_hook = function(filepath, bufnr, opts)
						---@diagnostic disable-next-line: redefined-local
						local is_image = function(filepath)
							local image_extensions = { "png", "jpg" } -- Supported image formats
							local split_path = vim.split(filepath:lower(), ".", { plain = true })
							local extension = split_path[#split_path]
							return vim.tbl_contains(image_extensions, extension)
						end
						if is_image(filepath) then
							local term = vim.api.nvim_open_term(bufnr, {})
							local function send_output(_, data, _)
								for _, d in ipairs(data) do
									vim.api.nvim_chan_send(term, d .. "\r\n")
								end
							end
							vim.fn.jobstart({
								"feh", -- "catimg",
								filepath, -- Terminal image viewer command
							}, { on_stdout = send_output, stdout_buffered = true, pty = true })
						else
							require("telescope.previewers.utils").set_preview_message(
								bufnr,
								opts.winid,
								"Binary cannot be previewed"
							)
						end
					end,
				},
				selection_caret = " ",
				layout_strategy = "flex",
				layout_config = {
					width = 0.95,
					height = 0.85,
					preview_cutoff = 120,
					prompt_position = "bottom",
					horizontal = {
						preview_width = function(_, cols, _)
							if cols > 200 then
								return math.floor(cols * 0.4)
							else
								return math.floor(cols * 0.6)
							end
						end,
					},
					vertical = { width = 0.9, height = 0.95, preview_height = 0.5 },
					flex = { horizontal = { preview_width = 0.9 } },
				},
			},
			-- pickers = {}
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		-- Enable telescope extensions, if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "projects")
		pcall(require("telescope").load_extension, "ui-select")

		-- See `:help telescope.builtin`
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]  [H]elp" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]  [K]eymaps" })
		vim.keymap.set("n", "<leader>sc", builtin.commands, { desc = "[S]  [C]ommands" })
		vim.keymap.set("n", "<leader>sa", builtin.autocommands, { desc = "[S]  [A]utoCommands" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]  [F]iles" })
		vim.keymap.set("n", "<leader>sm", builtin.marks, { desc = "[S]  [M]arks" })
		vim.keymap.set("n", "<leader>st", builtin.tags, { desc = "[S]  [T]ags" })
		vim.keymap.set("n", "<leader>sv", builtin.vim_options, { desc = "[S]  [S]elect Vim Options" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]  <c[W]ord>" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]  [G]rep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]  [D]iagnostics" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]  [R]esume" })
		vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]  Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Git Files" })
		vim.keymap.set("n", "<leader>sp", "<cmd>Telescope projects<cr>", { desc = "[S]  [P]rojects" })
		vim.keymap.set("n", "<C-s>", builtin.symbols, { desc = "[S]earch [S]ymbols" })
		vim.keymap.set("n", "<leader>dt", builtin.treesitter, { desc = "[D]ocument [T]reesitter" })
		vim.keymap.set("n", "<leader>fj", builtin.jumplist, { desc = "[F]  [J]umplist" })
		vim.keymap.set("n", "<leader>fr", builtin.registers, { desc = "[F]  [R]egisters" })
		vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git Status" })
		vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git Commits" })

		-- Slightly advanced example of overriding default behavior and theme
		vim.keymap.set("n", "<leader>/", function()
			-- You can pass additional configuration to telescope to change theme, layout, etc.
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

		-- Also possible to pass additional configuration options.
		--  See `:help telescope.builtin.live_grep()` for information about particular keys
		vim.keymap.set("n", "<leader>s/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[S]  [/] in Open Files" })

		-- Include installed Pickers
		vim.keymap.set("n", "<leader>ss", function()
			builtin.builtin({ include_extensions = true })
		end, { desc = "[S]  [S]elect Telescope" })

		-- Include installed Pickers
		vim.keymap.set("n", "<leader>fc", function()
			builtin.colorscheme({
				enable_preview = true,
				layout_config = { --[[ width = 0.5 ]]
				},
			})
		end, { desc = "[F]  [C]olorscheme" })

		-- Include All Sections of Man Pages
		vim.keymap.set("n", "<leader>fM", function()
			builtin.man_pages({ sections = { "ALL" } }) -- choice between 'ALL' or '1'
		end, { desc = "[F]ind [M]an Pages (ALL)" })

		-- Include All Sections of Man Pages
		vim.keymap.set("n", "<leader>fm", function()
			builtin.man_pages({ sections = { "1" } }) -- choice between 'ALL' or '1'
		end, { desc = "[F]ind [M]an Pages normal" })

		--  Find existing buffers
		vim.keymap.set("n", "<leader><leader>", function()
			builtin.buffers({ ignore_current_buffer = true }) -- don't show current buffer
		end, { desc = "[ ][ ] All open Buffers" })

		-- Shortcut for searching your neovim configuration files
		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]  [N]eovim files" })
	end,
}
