return { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        {
            'L3MON4D3/LuaSnip',
            build = (function()
                if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
                    return
                end
                return 'make install_jsregexp'
            end)(),
        },
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline',
        'rafamadriz/friendly-snippets',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'onsails/lspkind.nvim',
    },
    config = function()
        -- See `:help cmp`
        local cmp = require 'cmp'
        local cmp_buffer = require('cmp_buffer')
        local lspkind = require 'lspkind'
        local luasnip = require 'luasnip'
        -- luasnip.config.setup {}

        cmp.setup {
            window = {
                completion = {
                    winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                    col_offset = -3,
                    side_padding = 0
                }
            },
            ---@diagnostic disable-next-line: missing-fields
            formatting = {
                fields = { 'menu', 'kind', 'abbr' },
                format = lspkind.cmp_format {
                    with_text = true,
                    maxwidth = 50,
                    mode = 'symbol',
                    show_labelDetails = true,
                    menu = {
                        buffer = 'Buf:',
                        nvim_lsp = 'Lsp:',
                        nvim_lua = 'Lua:',
                        path = 'P:',
                        luasnip = 'Snip:',
                    },
                },
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            completion = { completeopt = 'menu,menuone,noselect,preview' },

            -- For an understanding of why these mappings were
            -- chosen, you will need to read `:help ins-completion`
            --
            -- No, but seriously. Please read `:help ins-completion`, it is really good!
            mapping = {
                ['<PageUp>'] = cmp.mapping.scroll_docs(-4),
                ['<PageDown>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.close(),
                ['<CR>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false,
                },
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            },
            sources = {
                { name = 'nvim_lsp' },
                {
                    name = 'buffer',
                    option = {
                        keyword_length = 3,
                        get_bufnrs = function()
                            return vim.api.nvim_list_bufs()
                        end,
                    },
                },
                { name = 'luasnip' },
                { name = 'nvim_lua' },
                { name = 'nvim_lsp_signature_help' },
                { name = 'path' },
            },
            sorting = {
                comparators = {
                    function(...) return cmp_buffer:compare_locality(...) end,
                    -- The rest of your comparators...
                }
            }
        }
        -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' },
            },
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' },
            }, {
                { name = 'cmdline' },
            }),
        })
    end,
}
