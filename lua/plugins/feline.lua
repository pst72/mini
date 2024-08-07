local one_monokai = {
    fg = '#abb2bf',
    bg = '#1e2024',
    green = '#00FF00',
    yellow = '#FFFF00',
    purple = '#c678dd',
    orange = '#FF8C00',
    peanut = '#778899',
    red = '#DC143C',
    aqua = '#00FFFF',
    darkblue = '#282c34',
    dark_red = '#8B0000',
}

local vi_mode_colors = {
    NORMAL = 'green',
    OP = 'green',
    INSERT = 'red',
    VISUAL = 'aqua',
    LINES = 'aqua',
    BLOCK = 'aqua',
    REPLACE = 'red',
    COMMAND = 'dark_red',
}

local c = {
    vim_mode = {
        provider = {
            name = 'vi_mode',
            opts = {
                show_mode_name = true,
                -- padding = "center", -- Uncomment for extra padding.
            },
        },
        hl = function()
            return {
                fg = require('feline.providers.vi_mode').get_mode_color(),
                bg = 'darkblue',
                style = 'bold',
                name = 'NeovimModeHLColor',
            }
        end,
        left_sep = 'block',
        right_sep = 'block',
    },
    macro = {
        provider = 'macro',
        hl = {
            fg = 'orange',
        },
    },
    gitBranch = {
        provider = 'git_branch',
        hl = {
            fg = 'purple',
            bg = 'darkblue',
            style = 'bold',
        },
        left_sep = 'block',
        right_sep = 'block',
    },
    gitDiffAdded = {
        provider = 'git_diff_added',
        hl = {
            fg = 'green',
            bg = 'darkblue',
        },
        left_sep = 'block',
        right_sep = 'block',
    },
    gitDiffRemoved = {
        provider = 'git_diff_removed',
        hl = {
            fg = 'red',
            bg = 'darkblue',
        },
        left_sep = 'block',
        right_sep = 'block',
    },
    gitDiffChanged = {
        provider = 'git_diff_changed',
        hl = {
            fg = 'fg',
            bg = 'darkblue',
        },
        left_sep = 'block',
        right_sep = 'block',
    },
    separator = {
        provider = '',
        hl = {
            fg = 'fg',
            bg = 'darkblue',
        },
        left_sep = 'block',
        right_sep = 'block',
    },
    fileinfo = {
        provider = {
            name = 'file_info',
            opts = {
                type = 'relative',
            },
        },
        hl = {
            style = 'bold',
            bg = 'darkblue',
        },
        left_sep = 'block',
        right_sep = 'block',
    },
    diagnostic_errors = {
        provider = 'diagnostic_errors',
        hl = {
            fg = 'red',
            bg = 'darkblue',
        },
    },
    diagnostic_warnings = {
        provider = 'diagnostic_warnings',
        hl = {
            fg = 'yellow',
            bg = 'darkblue',
        },
    },
    diagnostic_hints = {
        provider = 'diagnostic_hints',
        hl = {
            fg = 'aqua',
            bg = 'darkblue',
        },
    },
    diagnostic_info = {
        provider = 'diagnostic_info',
    },
    lsp_client_names = {
        provider = 'lsp_client_names',
        hl = {
            fg = 'purple',
            bg = 'darkblue',
            style = 'bold',
        },
        left_sep = 'block',
        right_sep = 'block',
    },
    file_type = {
        provider = {
            name = 'file_type',
            opts = {
                filetype_icon = true,
                case = 'titlecase',
            },
        },
        hl = {
            fg = 'red',
            bg = 'darkblue',
            style = { 'bold', 'italic' },
        },
        left_sep = 'block',
        right_sep = 'block',
    },
    file_encoding = {
        provider = 'file_encoding',
        hl = {
            fg = 'orange',
            bg = 'darkblue',
            style = 'italic',
        },
        left_sep = 'block',
        right_sep = 'block',
    },
    position = {
        provider = 'position',
        hl = {
            fg = 'green',
            bg = 'darkblue',
            style = 'bold',
        },
        left_sep = 'block',
        right_sep = 'block',
    },
    line_percentage = {
        provider = "%l/%L", --[[ 'line_percentage', ]]
        hl = {
            fg = 'green',
            bg = 'darkblue',
            style = 'bold',
        },
        left_sep = 'block',
        right_sep = 'block',
    },
    scroll_bar = {
        provider = 'scroll_bar',
        hl = {
            fg = 'yellow',
            style = 'bold',
        },
    },
}

local left = {
    c.vim_mode,
    c.macro,
    c.gitBranch,
    c.gitDiffAdded,
    c.gitDiffRemoved,
    c.gitDiffChanged,
    c.separator,
}

local middle = {
    c.fileinfo,
    c.diagnostic_errors,
    c.diagnostic_warnings,
    c.diagnostic_info,
    c.diagnostic_hints,
}

local right = {
    c.lsp_client_names,
    -- c.file_type,
    -- c.file_encoding,
    c.position,
    c.line_percentage,
    -- c.scroll_bar,
}

local components = {
    active = {
        left,
        middle,
        right,
    },
    inactive = {
        left,
        middle,
        right,
    },
}
return {
    {
        'freddiehaddad/feline.nvim',
        config = function()
            require('feline').setup {
                components = components,
                vi_mode_colors = vi_mode_colors,
                theme = one_monokai,
            }
        end,
    },
}
