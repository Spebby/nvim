vim.g.mapleader = " "

-- :wq as root
vim.cmd([[command! -nargs=0 WW :execute 'w !doas tee % >/dev/null' | q!]])

-- delete highlighted without yanking
vim.api.nvim_set_keymap("x", "x", '"_d', { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>we", ":wincmd w<CR>", { desc = "Cycle next window" })
vim.keymap.set("n", "<Leader>wi", ":wincmd W<CR>", { desc = "Cycle prev window" })
