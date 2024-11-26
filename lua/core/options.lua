-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
-- [[ Setting options ]]
vim.cmd("filetype plugin indent on")
vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Vim Options
vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.virtualedit = "block"
vim.opt.completeopt = {
	"menu",
	"menuone",
	-- 'noinsert',
	"noselect",
} -- mostly just for cmp
vim.opt.conceallevel = 1 -- so that `` is visible in markdown files
-- vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.pumheight = 15 -- pop up menu height
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showmatch = true -- show matching tags
vim.opt.showtabline = 1 -- always show tabs
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.copyindent = true -- Copy the previous indentation on indenting
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 300 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 250 -- faster completion (4000ms default)
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert 2 spaces for a tab
vim.opt.cursorline = true -- highlight the current line
vim.opt.cursorlineopt = "number,screenline" --  number, screenline' -- can be 'line','screenline','number'
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.laststatus = 3
vim.opt.showcmd = true
vim.opt.ruler = false
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}" -- always show the sign column, otherwise it would shift the text each time
vim.opt.colorcolumn = "80" -- always show the 80th column
vim.opt.wrap = true -- display lines as one long line
vim.opt.scrolloff = 16 -- was 8, is one of my fav
vim.opt.sidescrolloff = 8
vim.opt.fillchars.eob = " "
vim.opt.shortmess:append("csI")
vim.opt.whichwrap:append("b,s,<,>,[,],h,l")
vim.opt.iskeyword:append("-")
vim.opt.path:append(".,,*,**,;,/home/pi72/.local/share/nvim/**/*") -- Finding files - Search down into folders
vim.opt.wildignore:append("*/node_modules/*")
vim.o.wildmode = "longest:full,lastused"
vim.o.autochdir = true
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("tab:<->")
vim.opt.listchars:append("eol:↴")
vim.opt.spelllang = "en_us"
vim.opt.grepprg = "rg --hidden --vimgrep --smart-case"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- return {}
