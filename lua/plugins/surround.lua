return { {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    enabled = true,
    config = function()
        ---@diagnostic disable-next-line: missing-fields
        require('nvim-surround').setup {
            -- Configuration here, or leave empty to use defaults
        }
    end,
    },
}
