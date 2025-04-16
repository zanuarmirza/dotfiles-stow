local function showFugitiveGit()
    if vim.fn.FugitiveHead() ~= '' then
        vim.cmd [[
    Git
    " wincmd H  " Open Git window in vertical split
    " setlocal winfixwidth
    " vertical resize 31
    " setlocal winfixwidth
    setlocal nonumber
    setlocal norelativenumber
    ]]
    end
end
local function toggleFugitiveGit()
    if vim.fn.buflisted(vim.fn.bufname('fugitive:///*/.git//$')) ~= 0 then
        vim.cmd [[ execute ":bdelete" bufname('fugitive:///*/.git//$') ]]
    else
        showFugitiveGit()
    end
end
vim.keymap.set('n', '<F3>', toggleFugitiveGit, opts)
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
