return {
	vim.keymap.set(
		{ "v", "n", "s" },
		"<leader>sw",
		'<cmd>Telescope grep_string pattern="<cword>"<cr>',
		{ desc = "Grep Word/s Under Cursor" }
	),

	vim.keymap.set("i", "<ESC>", "<ESC>", { desc = "fast <Esc>" }),
	-- better indenting
	vim.keymap.set("v", "<", "<gv", { desc = "Indent left" }),
	vim.keymap.set("v", ">", ">gv", { desc = "Indent right" }),
	-- paste over currently selected text without yanking it
	vim.keymap.set("v", "p", '"_dP', { desc = "Paste without yanking" }),
	vim.keymap.set("v", "P", '"_dP', { desc = "Paste without yanking" }),
	-- Remap for dealing with visual line wraps
	vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true }),
	vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true }),
	-- Move selected text
	vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv", { desc = "Move Selection Down 1 line" }),
	vim.keymap.set("x", "K", ":m '<-2<CR>gv=gv", { desc = "Move Selection Up 1 line" }),
	vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Selection Down 1 line" }),
	vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Selection Up 1 line" }),
	-- make current file executable
	vim.keymap.set("n", "cx", "<cmd>!chmod +x %<CR>", { desc = "Make current file executable" }),

	-- Keywordprg
	vim.keymap.set("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" }),

	-- Commenting
	vim.keymap.set("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" }),
	vim.keymap.set("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" }),

	-- Better window navigation
	vim.keymap.set("n", "<C-h>", "<C-w>h"),
	vim.keymap.set("n", "<C-j>", "<C-w>j"),
	vim.keymap.set("n", "<C-k>", "<C-w>k"),
	vim.keymap.set("n", "<C-l>", "<C-w>l"),
	vim.keymap.set("n", "<C=>", "<C-w>="),

	-- Resize with arrows
	vim.keymap.set("n", "<M-k>", ":resize -5<CR>", { desc = "Resize Up" }),
	vim.keymap.set("n", "<M-j>", ":resize +5<CR>", { desc = "Resize Down" }),
	vim.keymap.set("n", "<M-h>", ":vertical resize -5<CR>", { desc = "Resize Left" }),
	vim.keymap.set("n", "<M-l>", ":vertical resize +5<CR>", { desc = "Resize Right" }),

	-- Centre Focus on middle screen
	vim.keymap.set("n", "G", "G$zz"),
	vim.keymap.set("n", "gg", "gg0"),
	vim.keymap.set("n", "n", "nzz"),
	vim.keymap.set("n", "N", "Nzz"),
	vim.keymap.set("n", "}", "}zz"),
	vim.keymap.set("n", "{", "{zz"),
	vim.keymap.set("n", "*", "*zz"),
	vim.keymap.set("n", "#", "#zz"),
	vim.keymap.set("n", "%", "%zz"),
	vim.keymap.set("n", "<C-i>", "<C-i>zz"), --
	vim.keymap.set("n", "<C-o>", "<C-o>zz"), --

	vim.keymap.set("n", "<Esc>", "<cmd>noh<cr>", { desc = "Clear highlights" }),

	vim.keymap.set("n", "+", "<C-a>", { desc = "Increment" }),
	vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement" }),

	vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select All" }),

	-- Toggle various options
	vim.keymap.set("n", "\\C", "<cmd>set cursorcolumn!<cr>", { desc = "Toggle CursorColumn" }),
	vim.keymap.set("n", "\\c", "<cmd>set cursorline!<cr>", { desc = "Toggle CursorLine" }),
	vim.keymap.set("n", "\\w", "<cmd>set wrap!<cr>", { desc = "Toggle Wrap" }),
	vim.keymap.set("n", "\\s", "<cmd>set spell!<cr>", { desc = "Toggle Spell" }),
	vim.keymap.set("n", "\\n", "<cmd>set number!<cr>", { desc = "Toggle number" }),
	vim.keymap.set("n", "\\r", "<cmd>set relativenumber!<cr>", { desc = "Toggle Relative Number" }),
	vim.keymap.set("n", "\\g", "<cmd>Glow<cr>", { desc = "Toggle Glow" }),
	-- vim.keymap.set('n', '\\z', '<cmd>MIniMisc.zoom()<cr>', { desc = 'Toggle Zoom' }),

	-- Jump to Top of Context
	vim.keymap.set("n", "\\h", function()
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
	end, { desc = "Toggle Inlay Hints" }),

	vim.keymap.set("n", "<localleader>l", "<cmd>Lazy<cr>", { desc = "Open Lazy" }),
	vim.keymap.set("n", "<localleader>r", '<cmd>lua require("lazy").reload(){}<cr>', { desc = "Reload Lazy" }),

	-- Jump to next Sentence
	vim.keymap.set("n", "]s", ")", { desc = "Next Sentence" }),
	vim.keymap.set("n", "[s", "(", { desc = "Prev Sentence" }),

	-- Jump to next Paragraph
	vim.keymap.set("n", "]p", "}", { desc = "Next Paragraph" }),
	vim.keymap.set("n", "[p", "{", { desc = "Prev Paragraph" }),

	vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" }),
	vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" }),
	-- Move through Quickfix list
	vim.keymap.set("n", "[q", "<cmd>cprev<cr>zvzz", { desc = "Previous quickfix item" }),
	vim.keymap.set("n", "]q", "<cmd>cnext<cr>zvzz", { desc = "Next quickfix item" }),
	vim.keymap.set("n", "[l", "<cmd>lprev<cr>zvzz", { desc = "Previous loclist item" }),
	vim.keymap.set("n", "]l", "<cmd>lnext<cr>zvzz", { desc = "Next loclist item" }),

	vim.keymap.set("n", "<leader>w", "<cmd>write!<cr>", { desc = "Save File" }),
	vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>", { desc = "Quit" }),
	vim.keymap.set("n", "<leader>x", "<cmd>bdelete!<CR>", { desc = "Close the buffer you are in." }),
	vim.keymap.set("n", "<leader>ls", "<cmd>source %<cr>", { desc = "Source File " }),
	vim.keymap.set("n", "<leader>li", "<cmd>LspInfo <cr>", { desc = "Lsp Info " }),
	vim.keymap.set("n", "<leader>lm", "<cmd>Mason <cr>", { desc = "Mason" }),

	-- Jump to Top of Context
	vim.keymap.set("n", "[c", function()
		require("treesitter-context").go_to_context(vim.v.count1)
	end, { desc = "Jump to Top of Context" }),

	-- vim.keymap.set("n", "<Leader>p", function()
	-- 	vim.ui.select({
	-- 		"buf_lines",
	-- 		"buffers",
	-- 		"cli",
	-- 		"commands",
	-- 		"diagnostic",
	-- 		"explorer",
	-- 		"files",
	-- 		"git_branches",
	-- 		"git_commits",
	-- 		"git_files",
	-- 		"hit_hunks",
	-- 		"grep",
	-- 		"grep_live",
	-- 		"help",
	-- 		"hipatterns",
	-- 		"history",
	-- 		"hl_groups",
	-- 		"keymaps",
	-- 		"list",
	-- 		"lsp",
	-- 		"marks",
	-- 		"oldfiles",
	-- 		"options",
	-- 		"registers",
	-- 		"resume",
	-- 		"spellsuggest",
	-- 		"treesitter",
	-- 	}, { prompt = "Pick " }, function(choice)
	-- 		return vim.cmd({ cmd = "Pick", args = { choice } })
	-- 	end)
	-- end, { desc = "[Mini.pick] PickTelescope ..." }),

	-- navigation
	vim.keymap.set("n", "]h", function()
		require("gitsigns").nav_hunk("next")
		vim.api.nvim_feedkeys("zz", "n", false)
	end, { desc = "Next hunk" }),

	vim.keymap.set("n", "[h", function()
		require("gitsigns").nav_hunk("prev")
		vim.api.nvim_feedkeys("zz", "n", false)
	end, { desc = "Previous hunk" }),

	-- actions
	vim.keymap.set("n", "<leader>hs", function()
		require("gitsigns").stage_hunk()
	end, { desc = "Stage hunk" }),
	vim.keymap.set("n", "<leader>hr", function()
		require("gitsigns").reset_hunk()
	end, { desc = "Reset hunk" }),
	vim.keymap.set("v", "<leader>hs", function()
		require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
	end, { desc = "Stage hunk (selected)" }),
	vim.keymap.set("v", "<leader>hr", function()
		require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
	end, { desc = "Reset hunk (selected)" }),
	vim.keymap.set("n", "<leader>hS", function()
		require("gitsigns").stage_buffer()
	end, { desc = "Stage buffer" }),
	vim.keymap.set("n", "<leader>hu", function()
		require("gitsigns").undo_stage_hunk()
	end, { desc = "Undo stage hunk" }),
	vim.keymap.set("n", "<leader>hR", function()
		require("gitsigns").reset_buffer()
	end, { desc = "Reset buffer" }),
	vim.keymap.set("n", "<leader>hp", function()
		require("gitsigns").preview_hunk()
	end, { desc = "Preview hunk" }),
	vim.keymap.set("n", "<leader>hb", function()
		require("gitsigns").blame_line()
	end, { desc = "Blame line" }),
	vim.keymap.set("n", "<leader>hd", function()
		require("gitsigns").diffthis()
	end, { desc = "Git diff" }),
	vim.keymap.set("n", "<leader>hD", function()
		require("gitsigns").diffthis("~")
	end, { desc = "Git diff (HEAD)" }),

	-- Git text object
	vim.keymap.set({ "o", "x" }, "ih", "<cmd>Gitsigns select_hunk<cr>", { desc = "Select Git hunk" }),

	-- telescope git pickers
	vim.keymap.set("n", "<leader>gc", function()
		require("telescope.builtin").git_bcommits()
	end, { desc = "Git commits (current buffer)" }),
	vim.keymap.set("n", "<leader>gC", function()
		require("telescope.builtin").git_commits()
	end, { desc = "Git commits (current directory)" }),
	vim.keymap.set("v", "<leader>gC", function()
		require("telescope.builtin").git_bommits_range()
	end, { desc = "Git commits (range)" }),
	vim.keymap.set("n", "<leader>gb", function()
		require("telescope.builtin").git_branches()
	end, { desc = "Git branches" }),
	vim.keymap.set("n", "<leader>gs", function()
		require("telescope.builtin").git_status()
	end, { desc = "Git status" }),
	vim.keymap.set("n", "<leader>gS", function()
		require("telescope.builtin").git_stash()
	end, { desc = "Git stash" }),
	vim.cmd([[nmap rw :%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]]),
	vim.cmd([[vmap rw :%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]]),

	vim.keymap.set("n", "<leader>di", "<cmd>InspectTree<cr>", { desc = "Inspect" }),
	vim.keymap.set("n", "<leader>dc", "<cmd>ColorizerToggle<cr>", { desc = "Colorizer" }),
	vim.keymap.set("n", "<leader>dn", "<cmd>TSNodeUnderCursor<cr>zvzz", { desc = "Node Under Cursor" }),
	vim.keymap.set("n", "]f", "<cmd>TSTextobjectGotoNextStart @function.outer<cr>zz", { desc = "Next Function" }),
	vim.keymap.set("n", "[f", "<cmd>TSTextobjectGotoPrevStart @function.outer<cr>zz", { desc = "Next Function" }),

	-- move over a closing element in insert mode
	vim.keymap.set("i", "<C-l>", function()
		return require("core.utils").escapePair()
	end),
}
