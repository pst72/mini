return {
  'ellisonleao/glow.nvim',
  config = function ()
    require('glow').setup{
      glow_path = '/usr/bin/glow',
      install_path = vim.fn.stdpath('data') .. '/glow',
      style = 'dark',
      border = 'rounded',
      pager = false,
      -- width = 80,
      -- height = 100,
      width_ratio = 0.95,
      height_ratio = 0.95,

    }
  end,
  enabled = true,
  lazy = true,
  cmd = 'Glow',
}
