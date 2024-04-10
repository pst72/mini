return {
  'rmagatti/alternate-toggler',
  -- local status_ok, alt = pcall(require, "alternate-toggler")
  -- if not status_ok then
  --     return
  -- end

  enabled = true,
  lazy = true,
  cmd = 'ToggleAlternate',
  opts = {
    alternates = {
      ['true'] = 'false',
      ['True'] = 'False',
      ['TRUE'] = 'FALSE',
      ['Yes'] = 'No',
      ['yes'] = 'no',
      ['YES'] = 'NO',
      ['1'] = '0',
      ['<'] = '>',
      ['('] = ')',
      ['['] = ']',
      ['{'] = '}',
      ['"'] = "'",
      ['""'] = "''",
      ['+'] = '-',
      ['==='] = '!==',
      ['=='] = '!=',
    },
  },
  vim.keymap.set('n', '\\a', '<cmd>ToggleAlternate<cr>', { desc = '[A]lternate' }),
}
