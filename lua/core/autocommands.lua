-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = {
    'qf',
    'query',
    'help',
    'helpgrep',
    'man',
    'notify',
    'lspinfo',
    'spectre_panel',
    'startuptime',
    'tsplayground',
    'checkhealth',
    'PlenaryTestPopup',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<CR>', { buffer = event.buf, silent = true })
  end,
})
-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  -- group = augroup("auto_create_dir"),
  callback = function(event)
    if event.match:match '^%w%w+://' then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
  end,
})

-- Restore cursor position
-- vim.cmd [[
--     augroup remember-cursor-position
--         autocmd!
--         autocmd BufReadPost * if line ("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
--      augroup END
--     ]]

vim.g.cursorhold_updatetime = 250
vim.cmd [[
  au CursorHoldI * stopinsert
  au InsertEnter * let updaterestore=&updatetime | set updatetime=10000
  au InsertLeave * let &updatetime=updaterestore
]]

-- Go to Last Location when opening a buffer
vim.api.nvim_create_autocmd('BufReadPost', {
    -- group = vim.api.nvim_create_augroup('mariasolos/last_location', { clear = true }),
    desc = 'Go to the last location when opening a buffer',
    callback = function(args)
        local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
        local line_count = vim.api.nvim_buf_line_count(args.buf)
        if mark[1] > 0 and mark[1] <= line_count then
            vim.cmd 'normal! g`"zz'
        end
    end,
})

-- Highlight Yanked Text
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Hilight Matching Paren
local highlight_paren = vim.api.nvim_create_augroup('BufWinEnter', { clear = true })
vim.api.nvim_create_autocmd('BufWinEnter', {
  callback = function()
    vim.cmd([[highlight MatchParen cterm=bold guifg=blue guibg=yellow]])
  end,
  group = highlight_paren,
  pattern = '*',
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ 'VimResized' }, {
  callback = function()
    vim.cmd 'tabdo wincmd ='
  end,
})

-- Fixes Autocomment
vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
  callback = function(event)
    if not vim.b[event.buf].view_activated then
      local filetype = vim.api.nvim_get_option_value('filetype', { buf = event.buf })
      local buftype = vim.api.nvim_get_option_value('buftype', { buf = event.buf })
      local ignore_filetypes = { 'gitcommit', 'gitrebase', 'svg', 'hgcommit' }
      if buftype == '' and filetype and filetype ~= '' and not vim.tbl_contains(ignore_filetypes, filetype) then
        vim.b[event.buf].view_activated = true
        vim.cmd.loadview { mods = { emsg_silent = true } }
      end
    end
    vim.cmd 'set formatoptions-=cro'
  end,
})

-- local cc_default_hi = vim.api.nvim_get_hl_by_name("ColorColumn", true)
-- vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "BufEnter" }, {
--     callback = function()
--         local cc = tonumber(vim.api.nvim_win_get_option(0, "colorcolumn"))
--         if cc ~= nil then
--             local lines = vim.api.nvim_buf_get_lines(0, vim.fn.line "w0", vim.fn.line "w$", true)
--             local max_col = 0
--             for _, line in pairs(lines) do
--                 max_col = math.max(max_col, vim.fn.strdisplaywidth(line))
--             end
--             if max_col <= cc then
--                 vim.api.nvim_set_hl(0, "ColorColumn", { bg = "None" })
--             else
--                 vim.api.nvim_set_hl(0, "ColorColumn", cc_default_hi)
--             end
--         end
--     end,
-- })
