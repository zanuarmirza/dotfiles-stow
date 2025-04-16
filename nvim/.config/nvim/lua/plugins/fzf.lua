return {{
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("fzf-lua").setup({
            "telescope",
            winopts = {
                preview = {
                    layout = "vertical"
                }
            },
            files   = {
                { fzf_opts = { ['--keep-right'] = '' } }
            },
        })

        local m = require("fzf-lua")

        vim.keymap.set('n', '<leader>ff', "<cmd>FzfLua files<CR>") -- find files (fuzzy)
        vim.keymap.set('n', '<leader>fb', "<cmd>Fzflua buffers<CR>") -- show buffer
        vim.keymap.set('n', '<M-p>', "<cmd>FzfLua git_files<CR>") -- search files at git
        vim.keymap.set('n', '<M-P>', "<cmd>FzfLua commands<CR>") -- search files at git
        vim.keymap.set('n', '<leader>fr', "<cmd>FzfLua resume<CR>") -- show latest telescope result
        vim.keymap.set('n', 'gI', "<cmd>FzfLua lsp_implementations<CR>") -- list implementation
        -- vim.keymap.set('n', '<leader>fs', m.lsp_document_symbols, {}) -- show documents symbols
        vim.keymap.set('n', '<leader>gt', "<cmd>FzfLua git_status<CR>") -- show git status list
        vim.keymap.set('n', '<leader>/', "<cmd>FzfLua lgrep_curbuf<CR>") -- show git status list

        vim.keymap.set('n', '<leader>o', function()
            m.oldfiles({
                fzf_opts                = { ['--keep-right'] = '' },
                prompt_title            = 'Project History',
                cwd_only                = true,
                stat_file               = true, -- verify files exist on disk
                include_current_session = true, -- include bufs from current session
            })
        end, {})                        -- show oldfiles

        vim.keymap.set('n', '<leader>fg', function()
            m.grep({ search = vim.fn.input("Grep > ") });
        end)

        vim.keymap.set('n', '<leader>fG', function()
            m.grep({ search = vim.fn.input("Grep > "), rg_opts = '--line-number --column --color=always --hidden' });
        end)

        vim.keymap.set('n', '<leader>flg', function()
            m.live_grep();
        end)

        vim.keymap.set('n', '<leader>flG', function()
            m.live_grep({ rg_opts = '--multiline --line-number --column --color=always --hidden' });
        end)
    end
},
    -- optional
    { 'junegunn/fzf', build = function()
        vim.fn['fzf#install']()
    end
    },
}
