vim.api.nvim_create_autocmd("FileType", {
        pattern = {"python"},
        callback = function()
            require('swenv.api').auto_venv()
        end
    })
return {
    'AckslD/swenv.nvim',

    config = function()
        require('swenv').setup()
    end,
   {
    vim.keymap.set('n', '\\v', function ()
       require('swenv.api').pick_venv()
    end, { desc = '[V]irtualenv' })
    }

}
