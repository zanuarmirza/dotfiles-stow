return {
    'mhinz/vim-signify',
    config = function()
        vim.keymap.set("n", "<leader>gh", ":SignifyHunkDiff<CR>", {})
        vim.keymap.set("n", "<leader>gu", ":SignifyHunkUndo<CR>", {})
    end
}
