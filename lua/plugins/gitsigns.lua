return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({

            signcolumn = true,          -- Toggle with `:Gitsigns toggle_signs`
            numhl = true,               -- Toggle with `:Gitsigns toggle_numhl`
            linehl = false,             -- Toggle with `:Gitsigns toggle_linehl`
            word_diff = true,           -- Toggle with `:Gitsigns toggle_word_diff`
            attach_to_untracked = true,
            current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
            },
            current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
            preview_config = {
                -- Options passed to nvim_open_win
                border = "rounded",
                style = "minimal",
                relative = "cursor",
                row = 0,
                col = 1,
            },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation

                map("n", "]h", function()
                    if vim.wo.diff then
                        return "]h"
                    end
                    vim.schedule(function()
                        gs.next_hunk()
                    end)
                    return "<Ignore>"
                end, { expr = true })

                map("n", "[h", function()
                    if vim.wo.diff then
                        return "[h"
                    end
                    vim.schedule(function()
                        gs.prev_hunk()
                    end)
                    return "<Ignore>"
                end, { expr = true })

                -- Actions
                map("n", "<leader>hs", gs.stage_hunk)
                map("n", "<leader>hr", gs.reset_hunk)
                map("v", "<leader>hs", function()
                    gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end)
                map("v", "<leader>hr", function()
                    gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end)
                map("n", "<leader>hS", gs.stage_buffer)
                map("n", "<leader>hu", gs.undo_stage_hunk)
                map("n", "<leader>hR", gs.reset_buffer)
                map("n", "<leader>hp", gs.preview_hunk)
                map("n", "<leader>hb", function()
                    gs.blame_line({ full = true })
                end)
                map("n", "<leader>gtb", gs.toggle_current_line_blame, { desc = 'Toggle Git blame line' })
                map("n", "<leader>gtd", gs.toggle_deleted, { desc = 'Toggle deleted' })
                map("n", "<leader>gtl", gs.toggle_linehl, { desc = 'Toggle line highlight' })
                map("n", "<leader>gtn", gs.toggle_numhl, { desc = 'Toggle number highlight' })
                map("n", "<leader>gts", gs.toggle_signs, { desc = 'Toggle signs' })
                map("n", "<leader>gtw", gs.toggle_word_diff, { desc = 'Toggle word diff' })
                map("n", "<leader>hd", gs.diffthis)
                map("n", "<leader>hD", function()
                    gs.diffthis("~")
                end)

                -- Text object
                map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
            end,
        })
    end,
}
