local M = {}
-- local toggle_diagnostics = function ()
--    if vim.diagnostic.is_disabled() then
--        vim.diagnostic.enable()
--    else
--        vim.diagnostic.disable()
--    end
-- end
--
-- vim.keymap.set('n', '\\d', toggle_diagnostics, { desc = 'Toggle Diagnostics' })
--
M.diagnostics_active = true
local toggle_diagnostics = function()
	diagnostics_active = not diagnostics_active
	if diagnostics_active then
		vim.diagnostic.enable()
	else
		vim.diagnostic.disable()
	end
end

vim.keymap.set("n", "\\d", toggle_diagnostics, { desc = "Toggle [D]iagnostics" })

-- move over a closing element in insert mode
M.escapePair = function()
	local closers = { ")", "]", "}", ">", "'", '"', "`", "," }
	local line = vim.api.nvim_get_current_line()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local after = line:sub(col + 1, -1)
	local closer_col = #after + 1
	local closer_i = nil
	for i, closer in ipairs(closers) do
		local cur_index, _ = after:find(closer)
		if cur_index and (cur_index < closer_col) then
			closer_col = cur_index
			closer_i = i
		end
	end
	if closer_i then
		vim.api.nvim_win_set_cursor(0, { row, col + closer_col })
	else
		vim.api.nvim_win_set_cursor(0, { row, col + 1 })
	end
end

-- Zoom into current window
M.zoomed = false

function M.toggle_zoom()
	if M.zoomed then
		vim.cmd("wincmd =")
		M.zoomed = false
	else
		vim.cmd("wincmd _")
		vim.cmd("wincmd |")
		M.zoomed = true
	end
end

vim.keymap.set("n", "\\z", M.toggle_zoom, { noremap = true, silent = true, desc = "Zoom" })

return M
