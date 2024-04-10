return {
  'SmiteshP/nvim-navic',
  enabled = true,
  lazy = true,
  dependencies = 'neovim/nvim-lspconfig',
  opts = {
    lsp = {
      auto_attach = true
    }
  }
}
