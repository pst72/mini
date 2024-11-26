return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "BufReadPost",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/nvim-treesitter-refactor",
		"nvim-treesitter/nvim-treesitter-context",
		"HiPhish/rainbow-delimiters.nvim",
		"RRethy/nvim-treesitter-endwise",
		"tadmccorkle/markdown.nvim",
		-- 'mfussenegger/nvim-ts-hint-textobject',
		"windwp/nvim-ts-autotag",
		"nvim-treesitter/playground",
	},
	config = function()
		vim.defer_fn(function()
			-- local settings = require("pst.core.settings")
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash",
					"cmake",
					"css",
					"html",
					"c",
					"dockerfile",
					"gitignore",
					"gitcommit",
					"git_rebase",
					"gitattributes",
					"git_config",
					"gitcommit",
					"gitignore",
					"diff",
					"javascript",
					"typescript",
					"tsx",
					"json",
					"lua",
					"markdown",
					"markdown_inline",
					"query",
					"python",
					"regex",
					"toml",
					"vim",
					"vimdoc",
					"yaml",
				},
				markdown = {
					enable = true,
				},
				ignore_install = {}, -- List of parsers to ignore installing
				highlight = {
					enable = true, -- false will disable the whole extension
					disable = {}, -- list of language that will be disabled
					additional_vim_regex_highlighting = false,
				},
				rainbow = {
					enable = true,
					-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
					extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
					max_file_lines = nil, -- Do not enable for files with more than n lines, int
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						scope_incremental = "<C-S-space>",
						node_incremental = "<C-space>",
						node_decremental = "<bs>",
					},
				},
				endwise = {
					enable = true,
				},
				indent = { enable = true },
				autopairs = { enable = true },
				textobjects = {
					select = {
						enable = true,
						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
							["al"] = "@loop.outer",
							["il"] = "@loop.inner",
							["ib"] = "@block.inner",
							["ab"] = "@block.outer",
							["ir"] = "@parameter.inner",
							["ar"] = "@parameter.outer",
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]f"] = "@function.outer",
							["]r"] = "@return.outer",
							["]c"] = "@class.outer",
							["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
							["]o"] = "@loop.*",
						},
						goto_next_end = {
							["]F"] = "@function.outer",
							["]C"] = "@class.outer",
						},
						goto_previous_start = {
							["[f"] = "@function.outer",
							["[r"] = "@return.outer",
							["[c"] = "@class.outer",
							["[z"] = { query = "@fold", query_group = "folds", desc = "Previous fold" },
							["[o"] = "@loop.*",
						},
						goto_previous_end = {
							["[F"] = "@function.outer",
							["[C"] = "@class.outer",
						},
					},
					lsp_interop = {
						enable = true,
						floating_preview_opts = {
							border = "rounded",
						},
						peek_definition_code = {
							["<leader>df"] = "@function.outer",
							["<leader>dF"] = "@class.outer",
							["<leader>dr"] = "@return.outer",
							["<leader>dm"] = "@method.inner",
						},
					},

					swap = {
						enable = true,
						swap_next = {
							["<leader>a"] = "@parameter.inner",
						},
						swap_previous = {
							["<leader>A"] = "@parameter.inner",
						},
					},
				},
				context = {
					enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
					max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
					min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
					line_numbers = true,
					multiline_threshold = 20, -- Maximum number of lines to show for a single context
					trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
					mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
					-- Separator between context and content. Should be a single character string, like '-'.
					-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
					separator = nil,
					zindex = 20, -- The Z-index of the context window
					on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
				},
				playground = {
					enable = true,
					disable = {},
					updatetime = 25,
					persist_queries = false,
					keybindings = {
						toggle_query_editor = "o",
						toggle_hl_groups = "i",
						toggle_injected_languages = "t",
						toggle_anonymous_nodes = "a",
						toggle_language_display = "I",
						focus_language = "f",
						unfocus_language = "F",
						update = "R",
						goto_node = "<CR>",
						show_help = "?",
					},
					query_linter = {
						enable = true,
						use_virtual_text = true,
						lint_events = { "BufWrite", "CursorHold" },
					},
				},
				refactor = {
					highlight_definitions = {
						enable = true,
						-- Set to false if you have an `updatetime` of ~100.
						clear_on_cursor_move = true,
					},
					highlight_current_scope = { enable = false },
					smart_rename = {
						enable = true,
						-- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
						keymaps = {
							smart_rename = "<leader>lr",
						},
					},
					navigation = {
						enable = true,
						-- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
						keymaps = {
							goto_definition = "gnd",
							list_definitions = "gnD",
							list_definitions_toc = "gO",
							goto_next_usage = "<a-*>",
							goto_previous_usage = "<a-#>",
						},
					},
				},
			})

			require("nvim-ts-autotag").setup({ opts = {} })
		end, 0)
	end,
}
