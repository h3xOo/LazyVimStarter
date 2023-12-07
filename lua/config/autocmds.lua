local templates_path = vim.fn.stdpath('config') .. '/templates'
local tex_template = templates_path .. '/skeleton.tex'

local autocmd = vim.api.nvim_create_autocmd
local stat = vim.loop.fs_stat

if stat(tex_template) then
    autocmd(
        'BufNewFile',
        { pattern = '*.tex', command = '0r ' .. tex_template }
    )
end

autocmd(
    'FileType',
    { pattern = 'tex', command = 'setlocal spelllang=pl,en' }
)
autocmd(
    'FileType',
    { pattern = 'tex', command = 'setlocal spell' }
)

autocmd(
    'FileType',
    { pattern = 'ssa', command = 'syntax off' }
)

vim.api.nvim_create_autocmd('FileType', {
	pattern = { '*' },
	callback = function()
		vim.wo.conceallevel = 0
	end,
})
