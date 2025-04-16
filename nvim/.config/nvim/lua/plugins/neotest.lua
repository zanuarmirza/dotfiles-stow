return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/neotest-go",
        "nvim-neotest/nvim-nio",
        "vim-test/vim-test",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-neotest/neotest-vim-test",
    },
    config = function()
        -- get neotest namespace (api call creates or returns namespace)
        local neotest_ns = vim.api.nvim_create_namespace("neotest")
        vim.diagnostic.config({
            virtual_text = {
                format = function(diagnostic)
                    local message =
                        diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
                    return message
                end,
            },
        }, neotest_ns)

        require("neotest").setup({
            -- your neotest config here
            adapters = {
                require("neotest-go"),
                require('rustaceanvim.neotest'),
                require("neotest-vim-test")({ ignore_filetypes = { "go", "rust" } }),
            },
        })

        vim.keymap.set('n', '<leader>td', function() require("neotest").run.run({ strategy = "dap" }) end)
        vim.keymap.set('n', '<leader>tr', function() require('neotest').run.run() end)
        vim.keymap.set('n', '<leader>to', function() require('neotest').output.open() end)
        vim.keymap.set('n', '<leader>TO', function() require('neotest').output_panel.toggle() end)
        vim.keymap.set('n', '<leader>ts', function() require('neotest').summary.toggle() end)
    end,
}
