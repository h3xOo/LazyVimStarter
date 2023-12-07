return {
    {
        'rebelot/kanagawa.nvim',
        lazy = false,
        enabled = false,
        priority = 1000,
        opts = {
            compile = true,
            undercurl = true,
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true},
            statementStyle = { bold = true },
            typeStyle = {},
            transparent = false,
            dimInactive = false,
            terminalColors = true,
            colors = {
            palette = {},
            theme = { wave = {}, lotus = {}, dragon = {},
                all = {
                    ui = {
                        bg_gutter = 'none'
                        }
                    }
                },
            },
            overrides = function(colors)
                return {}
            end,
            theme = 'wave',
            background = {
                dark = 'wave',
                light = 'lotus'
            },
        },
    },
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        lazy = false,
        enabled = false,
        opts = {
            flavour = 'macchiato'
        },
    },
    {
        'ellisonleao/gruvbox.nvim',
        priority = 1000,
        lazy = false,
    },
    {
        'LazyVim/LazyVim',
        opts = {
            colorscheme = 'gruvbox'
        }
    }
}
