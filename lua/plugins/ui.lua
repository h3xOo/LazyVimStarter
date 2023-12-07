return {
    {
        "folke/noice.nvim",
        opts = function(_, opts)
            opts.presets.lsp_doc_border = true
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        event = 'VeryLazy',
        opts = function (_, opts)
            opts.sections.lualine_y = {
                { "progress", padding = { left = 1, right = 1 } },
            }
            opts.sections.lualine_z = { 'location' }
        end
    },
}

