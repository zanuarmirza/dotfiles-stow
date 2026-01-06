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
        "nvim-neotest/neotest-jest",
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

        local neotest = require("neotest")
        neotest.setup({
            -- your neotest config here
            adapters = {
                require("neotest-go"),
                require('rustaceanvim.neotest'),
                require("neotest-vim-test")({ ignore_filetypes = { "go", "rust" } }),
                require("neotest-jest")({
                    jestCommand = "npm test --",
                    jestArguments = function(defaultArguments, context)
                        return defaultArguments
                    end,
                    jestConfigFile = "custom.jest.config.ts",
                    env = { CI = true },
                    cwd = function(path)
                        return vim.fn.getcwd()
                    end,
                    isTestFile = require("neotest-jest.jest-util").defaultIsTestFile,
                }),
            },
        })

        vim.keymap.set('n', '<leader>td', function() neotest.run.run({ strategy = "dap" }) end)
        vim.keymap.set('n', '<leader>tr', function() neotest.run.run() end)
        vim.keymap.set('n', '<leader>to', function() neotest.output.open() end)
        vim.keymap.set('n', '<leader>TO', function() neotest.output_panel.toggle() end)
        vim.keymap.set('n', '<leader>ts', function() neotest.summary.toggle() end)
    end,
}
