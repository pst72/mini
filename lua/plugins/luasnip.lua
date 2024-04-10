local M = {
  'L3MON4D3/LuaSnip',
  dependencies = {
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
  },
  lazy = true,
  config = function()
    local ls = require 'luasnip'
    local vsc = require 'luasnip.loaders.from_vscode'
    local lua = require 'luasnip.loaders.from_lua'

    ls.config.set_config { history = true, updateevents = 'TextChanged,TextChangedI' }

    -- load lua snippets
    lua.load { path = os.getenv 'HOME' .. '/.config/nvim/snippets/' }
    -- load friendly-snippets
    -- this must be loaded after custom snippets or they get overwritte!
    -- https://github.com/L3MON4D3/LuaSnip/blob/b5a72f1fbde545be101fcd10b70bcd51ea4367de/Examples/snippets.lua#L497
    vsc.lazy_load()
    ls.filetype_extend('typescript', { 'javascript' })
    ls.filetype_extend('lua', { 'luadoc'})
    ls.filetype_extend('sh', { 'shelldoc'})
    ls.filetype_extend('python', { 'pydoc'})

    -- expansion key
    -- this will expand the current item or jump to the next item within the snippet.
    -- vim.keymap.set({ "i", "s" }, "<c-j>", function()
    --   if ls.expand_or_jumpable() then
    --     ls.expand_or_jump()
    --   end
    -- end, { silent = true })

    -- jump backwards key.
    -- this always moves to the previous item within the snippet
    -- vim.keymap.set({ "i", "s" }, "<c-k>", function()
    --   if ls.jumpable(-1) then
    --     ls.jump(-1)
    --   end
    -- end, { silent = true })

    -- selecting within a list of options.
    vim.keymap.set('i', '<c-h>', function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end)
  end,
}


return M
