return
{
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    },
    config = function()
    require("noice").setup({
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    })
    end,
    vim.keymap.set('n', '<leader>nt', '<cmd>NoiceTelescope<cr>', { desc = 'Telescope Noice' }),
    vim.keymap.set('n', '<leader>nm', '<cmd>messages<cr>', { desc = 'Noice Messages' }),
    vim.keymap.set('n', '<leader>nd', '<cmd>NoiceDismiss<cr>', { desc = 'Dismiss Messages' }),
    vim.keymap.set('n', '<leader>ns', '<cmd>NoiceStats<cr>', { desc = 'Noice Stats' }),
    vim.keymap.set('n', '<leader>nh', '<cmd>NoiceHistory<cr>', { desc = 'History Noice' }),
    vim.keymap.set('n', '<leader>ne', '<cmd>NoiceErrors<cr>', { desc = 'Noice Errors' }),
    vim.keymap.set('n', '<leader>nl', '<cmd>NoiceLast<cr>', { desc = 'Last Noice' }),

}