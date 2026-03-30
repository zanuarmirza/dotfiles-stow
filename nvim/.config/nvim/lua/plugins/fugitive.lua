vim.keymap.set("n", "<leader>gs", vim.cmd.Git);

vim.keymap.set("n", "<leader>gl", ":0Gclog -n1000<CR>")
vim.keymap.set("n", "<leader>gL", ":Gclog<CR>")

-- show log based on hash commit when using gcLog
vim.keymap.set("n", "<leader>GL", "viw\"+y:Gclog <C-r>+ <CR>")
vim.keymap.set("n", "<leader>ge", ":Gedit<CR>")

-- used nicely with gclog, show the vsplitdiff on current diff file
vim.keymap.set("n", "<leader>df", ":Gvdiffsplit <CR>")
-- used nicely with git blame, by placing the cursor to the commit hash in git blame
vim.keymap.set("n", "<leader>DF", "viwy <C-w>q :Gvdiffsplit <C-r>\"~1<CR>")

vim.keymap.set("n", "<leader>pd", ":Gvdiffsplit !~1<CR>")
vim.keymap.set("n", "cn", "<cmd>cnext<CR>zz", {})
return { 'tpope/vim-fugitive' }
