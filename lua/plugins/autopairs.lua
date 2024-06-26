local M = {
  'windwp/nvim-autopairs',
  config = function()
    -- Setup nvim-cmp.
    local status_ok, npairs = pcall(require, 'nvim-autopairs')
    if not status_ok then
      return
    end

    npairs.setup {
      check_ts = true, -- treesitter integration
      ts_config = {
        lua = { 'string', 'source' },
        javascript = { 'string', 'template_string' },
        java = false,
      },
      disable_filetype = { 'TelescopePrompt', 'guihua', 'guihua_rust', 'clap_input' },
      fast_wrap = {
        map = '<M-e>',
        chars = { '{', '[', '(', '<', "'", '"' },
        highlight = 'PmenuSel',
        highlight_grey = 'LineNr',
        check_comma = true,
        offset = 0,
      },
    }

    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    local cmp_status_ok, cmp = pcall(require, 'cmp')
    if not cmp_status_ok then
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done {})
    end
  end,

}
return M
