return {
    -- add dracula
    {
        "Mofiqul/dracula.nvim",
        lazy = false,
        config = function()
            vim.cmd [[colorscheme dracula]]
        end
    },
    -- Configure LazyVim to load dracula
}
