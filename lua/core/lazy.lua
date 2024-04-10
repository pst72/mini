local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Require lazy and pass the spec.
require("lazy").setup('../plugins',
    {
  defaults = {
    lazy = false,
  },
  lockfile = vim.fn.stdpath("cache") .. "/lazy-lock.json", -- lockfile generated after running update.
  install = {
    missing = true,
    -- colorscheme = { "habamax" },
  },
  ui = {
    -- a number <1 is a percentage., >1 is a fixed size
    size = { width = 0.9, height = 0.9 },
    wrap = true, -- wrap the lines in the ui
    border = "rounded",
    title_pos = "center", ---@type "center" | "left" | "right"
    custom_keys = {
      -- You can define custom key maps here. If present, the description will
      -- be shown in the help menu.
      -- To disable one of the defaults, set it to false.

--     ["<localleader>l"] = {
--       function(plugin)
--         require("lazy.util").float_term({ "lazygit", "log" }, {
--           cwd = plugin.dir,
--         })
--       end,
--       desc = "Open lazygit log",
--     },
-- 
--     ["<localleader>t"] = {
--       function(plugin)
--         require("lazy.util").float_term(nil, {
--           cwd = plugin.dir,
--         })
--       end,
--       desc = "Open terminal in plugin dir",
--     },
    },
  },
  checker = {
    -- automatically check for plugin updates
    enabled = false,
    notify = true, -- get a notification when new updates are found
    frequency = 3600, -- check for updates every hour
  },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = true,
    notify = false, -- get a notification when changes are found
  },
  performance = {
    rtp = {
      disabled_plugins = {
         "gzip",
         -- "matchit",
         -- "matchparen",
         "netrwPlugin",
         "tarPlugin",
         "tohtml",
         "tutor",
         "zipPlugin",
      },
    },
  },
  -- { import = 'core' },
  {},
})

