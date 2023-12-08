local is_inside_work_tree = {}
local Util = require('lazyvim.util')

local function live_grep_from_project_git_root()
    local function is_git_repo()
        vim.fn.system('git rev-parse --is-inside-work-tree')
        return vim.v.shell_error == 0
    end

    local function get_git_root()
        local dot_git_path = vim.fn.finddir('.git', '.;')
        return vim.fn.fnamemodify(dot_git_path, ':h')
    end

    local cwd = vim.fn.getcwd()
    if is_inside_work_tree[cwd] == nil then
        is_inside_work_tree[cwd] = is_git_repo()
    end

    local opts = {}
    if is_inside_work_tree[cwd] then
        opts = {
            cwd = get_git_root(),
            hidden = false,
        }
    end

    require('telescope.builtin').live_grep(opts)
end

local function find_files_from_project_git_root()
    local function is_git_repo()
        vim.fn.system('git rev-parse --is-inside-work-tree')
        return vim.v.shell_error == 0
    end

    local function get_git_root()
        local dot_git_path = vim.fn.finddir('.git', '.;')
        return vim.fn.fnamemodify(dot_git_path, ':h')
    end

    local cwd = vim.fn.getcwd()
    if is_inside_work_tree[cwd] == nil then
        is_inside_work_tree[cwd] = is_git_repo()
    end

    local opts = {}
    if is_inside_work_tree[cwd] then
        opts = {
            cwd = get_git_root(),
            hidden = false,
        }
    end

    require('telescope.builtin').find_files(opts)
end

return {
    'telescope.nvim',
    dependencies = {
        {
            'nvim-telescope/telescope-fzy-native.nvim',
            build = 'make -C deps/fzy-lua-native',
            config = function ()
                Util.on_load('telescope.nvim', function ()
                    require('telescope').load_extension('fzy_native')
                end)
            end,
        },
        {
            'nvim-telescope/telescope-file-browser.nvim',
            config = function ()
                Util.on_load('telescope.nvim', function ()
                    require('telescope').load_extension('file_browser')
                end)
            end
        },
    },

    keys = {
        { '<leader>gs', false },
        { ';t', function ()
            require('telescope.builtin').help_tags()
        end, desc = 'Telescope help tags' },
        { ';;', function ()
            require('telescope.builtin').resume()
        end, desc = 'Telescope resume' },
        { ';e', function ()
            require('telescope.builtin').diagnostics()
        end, desc = 'Telescope diagnostics' },
        { ';gs', function ()
            require('telescope.builtin').git_status()
        end, desc = 'Telescope git status' },
        { ';gc', function ()
            require('telescope.builtin').git_commits()
        end, desc = 'Telescope git commits' },
        { ';gb', function ()
            require('telescope.builtin').git_branches()
        end, desc = 'Telescope git branches' },
        { '\\\\', function ()
            require('telescope.builtin').buffers()
        end, desc = 'Telescope buffers' },
        { ';f', find_files_from_project_git_root, desc = 'Telescope find files' },
        { ';r', live_grep_from_project_git_root, desc = 'Telescope live grep' },
        { '<leader>sf', function ()
            local telescope = require('telescope')

            local function telescope_buffer_dir()
                return vim.fn.expand('%:p:h')
            end

            telescope.extensions.file_browser.file_browser({
                path = '%:p:h',
                cwd = telescope_buffer_dir(),
                respect_gitignore = false,
                hidden = true,
                grouped = true,
                previewer = false,
                initial_mode = 'normal',
                layout_config = {
                    height = 40,
                },
            })
        end,
        desc = 'Open File Browser in pwd of buffer'
        },
    },
    config = function (_, opts)
        local telescope = require('telescope')
        local actions = require('telescope.actions')
        local fb_actions = require('telescope').extensions.file_browser.actions
        opts.extensions = {
            file_browser = {
                theme = 'dropdown',
                hijack_netrw = true,
                mappings = {
                    ['n'] = {
                        ['N'] = fb_actions.create,
                        ['h'] = fb_actions.goto_parent_dir,
                        ['/'] = function()
                            vim.cmd('startinsert')
                        end,
                        ['<C-u>'] = function(prompt_bufnr)
                            for _ = 1, 10 do
                                actions.move_selection_previous(prompt_bufnr)
                            end
                        end,
                        ['<C-d>'] = function(prompt_bufnr)
                            for _ = 1, 10 do
                                actions.move_selection_next(prompt_bufnr)
                            end
                        end,
                    },
                },
            },
        }
        telescope.setup(opts)
    end
}
