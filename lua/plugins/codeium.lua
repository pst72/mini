local M = {
  'Exafunction/codeium.vim',
  config = function()
    vim.keymap.set('i', '<A-]>', function()
      return vim.fn['codeium#CycleCompletions'](1)
    end, { expr = true })
    vim.keymap.set('i', '<A-[>', function()
      return vim.fn['codeium#CycleCompletions'](-1)
    end, { expr = true })
    vim.keymap.set('i', '<A-x>', function()
      return vim.fn['codeium#Clear']()
    end, { expr = true })
    vim.keymap.set('i', '<A-g>', function()
      return vim.fn['codeium#Accept']()
    end, { expr = true })
  end,
  enabled = true,
}
-- Codeium keymaps
-- vim.g.codeium_enabled = false
vim.g.codeium_disable_bindings = 1
vim.g.codeium_no_map_tab = 0

return M

