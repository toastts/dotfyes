local map = vim.keymap.set
map("n", "-", require("oil").open, { desc = "open parent directory" })
map('n', '<Space>', '<cmd>:nohlsearch<CR>', { silent = true, desc = "clear search highlights"})
map("n", "<C-p>", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true, desc = "file finding named after ctrl-p" })
map("n", "<C-f>", "<cmd>lua require('fzf-lua').live_grep()<CR>", { silent = true, desc = "live ripgrep" })
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

