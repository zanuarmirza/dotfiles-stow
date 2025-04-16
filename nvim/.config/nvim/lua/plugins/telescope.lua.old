local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local telescopeConfig = require("telescope.config")
telescope.load_extension('luasnip')

telescope.setup { defaults = {
        path_display = { "truncate" },
        mappings = {
            n = {
                ["<C-s>"] = actions.select_horizontal,
                ["q"] = actions.close
            }
        },
        initial_mode='normal',
        -- default argumento
        -- vimgrep_arguments = {
        --     "rg",
        --     "--color=never",
        --     "--no-heading",
        --     "--with-filename",
        --     "--line-number",
        --     "--column",
        --     "--smart-case"
        -- }
    },
    pickers = {
        buffers = {
            mappings = {
                n = {
                    ["x"] = actions.delete_buffer + actions.move_to_top, -- delete buffer at telescope buffer result
                }
            }
        },
        find_files = {
            initial_mode = 'insert',
            follow = true,
        }
        -- grep_string = {
        --     additional_args = {
        --         '--color=never',
        --         '--no-heading',
        --         '--hidden',
        --         '--with-filename',
        --         '--line-number',
        --         '--column',
        --         '--smart-case',
        --         '--multiline',
        --     },
        -- }
    },
}
vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) -- find files (fuzzy)
vim.keymap.set('n', '<leader>fb', builtin.buffers, {}) -- show buffer
vim.keymap.set('n', '<C-p>', builtin.git_files, {}) -- search files at git
vim.keymap.set('n', '<leader>fr', builtin.resume, {}) -- show latest telescope result
-- vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {}) -- show documents symbols
vim.keymap.set('n', '<leader>gt', builtin.git_status, {}) -- show git status list
vim.keymap.set('n', '<leader>o', function()
    builtin.oldfiles({
        prompt_title = 'Project History',
        cwd_only = true,
    })
end, {}) -- show oldfiles
-- install ripgrep when using macOS
-- standard grep string
vim.keymap.set('n', '<leader>fg', function()
    builtin.grep_string({ use_regex = false, search = vim.fn.input("Grep > ") });
end)
-- multiline regex grep string
vim.keymap.set('n', '<leader>fx', function()
    builtin.grep_string({ use_regex = true, additional_args = { '--multiline','--hidden','--case-sensitive' }, search = vim.fn.input("Grep > ")});
end)
-- standard live grep string
vim.keymap.set('n', '<leader>flg', function()
    builtin.live_grep({ initial_mode="insert", use_regex = false });
end)
-- multiline regex live grep string
vim.keymap.set('n', '<leader>flx', function()
    builtin.live_grep({ intial_mode="insert", use_regex = true, additional_args = { '--multiline' } });
end)

-- require("telescope").load_extension "file_browser"
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>e",
--   ":Telescope file_browser<CR>",
--   { noremap = true }
-- )
