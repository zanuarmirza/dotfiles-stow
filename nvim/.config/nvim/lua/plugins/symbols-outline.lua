return {
    "hedyhli/outline.nvim",
    config = function()
        -- Example mapping to toggle outline
        vim.keymap.set("n", "<leader>fs", "<cmd>Outline<CR>",
            { desc = "Toggle Outline" })

        require("outline").setup {
            outline_window = {
                position = "left"
            },
            -- Your setup opts here (leave empty to use defaults)
        }
    end,
}
