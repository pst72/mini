return {
  'akinsho/nvim-toggleterm.lua',
  config = function()
    local map = vim.api.nvim_set_keymap
    local buf_map = vim.api.nvim_buf_set_keymap

    require('toggleterm').setup {
      -- size can be a number or function which is passed the current terminal
      size = function(term)
        if term.direction == 'horizontal' then
          return 15
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<C-\>]],
      hide_numbers = true, -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = '1', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
      start_in_insert = true,
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      persist_size = true,
      persist_mode = false,
      direction = 'float', -- 'vertical' | 'horizontal' | 'window' | 'float',
      close_on_exit = true, -- close the terminal window when the process exits
      shell = vim.o.shell, -- change the default shell
      -- This field is only relevant if direction is set to 'float'
      float_opts = {
        -- The border key is *almost* the same as 'nvim_win_open'
        -- see :h nvim_win_open for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        border = 'curved', -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
        -- width = <value>,
        -- height = <value>,
        winblend = 3,
        highlights = {
          border = 'Normal',
          background = 'Normal',
        },
      },
    }
    map('t', '<ESC>', '<C-\\><C-n>', { noremap = true, silent = true }) -- back to normal mode in Terminal
    map('n', '<leader>tn', '<cmd>lua _NODE_TOGGLE()<cr>', { noremap = true, silent = true })
    map('n', '<leader>tl', '<cmd>lua _LUA_TOGGLE()<cr>', { noremap = true, silent = true })
    map('n', '<leader>tb', '<cmd>lua _BTOP_TOGGLE()<cr>', { noremap = true, silent = true })
    map('n', '<leader>tp', '<cmd>lua _PYTHON_TOGGLE()<cr>', { noremap = true, silent = true })
    map('n', '<leader>tg', '<cmd>lua _LAZYGIT_TOGGLE()<cr>', { noremap = true, silent = true })
    map('n', '<leader>th', '<cmd>ToggleTerm size=15 direction=horizontal<cr>', { noremap = true, silent = true })

    -- Better navigation to and from terminal
    local set_terminal_keymaps = function()
      local opts = { noremap = true }
      buf_map(0, 't', '<esc>', [[<C-\><C-n>]], opts)
      buf_map(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
      buf_map(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
      buf_map(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
      buf_map(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
    end
    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.api.nvim_create_autocmd('TermOpen', {
      pattern = 'term://*',
      callback = function()
        set_terminal_keymaps()
      end,
      desc = 'Mappings for navigation with a terminal',
    })

    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new { cmd = 'lazygit', hidden = true }
    function _LAZYGIT_TOGGLE()
      lazygit:toggle()
    end

    local node = Terminal:new { cmd = 'node', hidden = true }
    function _NODE_TOGGLE()
      node:toggle()
    end

    local lua = Terminal:new { cmd = 'lua', hidden = true }
    function _LUA_TOGGLE()
      lua:toggle()
    end

    local btop = Terminal:new { cmd = 'btop', hidden = true }
    function _BTOP_TOGGLE()
      btop:toggle()
    end

    local python = Terminal:new { cmd = 'bpython', hidden = true }
    function _PYTHON_TOGGLE()
      python:toggle()
    end
  end,
}
