return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  -- -@type Flash.Config
  opts = {
    modes = {
      char = {
        jump_labels = true,
      },
    },
    label = {
      rainbow = {
        enabled = true,
        shade = 5,
      }
    },
    remote_op = {
      restore = true,
        -- For `jump.pos = "range"`, this setting is ignored.
        -- `true`: always enter a new motion when doing a remote operation
        -- `false`: use the window's cursor position and jump target
        -- `nil`: act as `true` for remote windows, `false` for the current window
      motion = nil,
    },
  },
  -- stylua: ignore
  enabled = true,
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-f>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
