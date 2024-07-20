local map = vim.keymap.set
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

map('n', '<Space>', '<cmd>:nohlsearch<CR>', { silent = true, desc = "clear search highlights" })
map("n", "-", require("oil").open, { desc = "open parent directory" })

map("n", "<Leader>ft", "<cmd>Lspsaga term_toggle<CR>")
map("t", "<Leader>ft", "<cmd>Lspsaga term_toggle<CR>")

map("n", "<C-p>", "<cmd>lua require('fzf-lua').files({})<CR>",
  { silent = true, desc = "file finding named after ctrl-p" })
local rg_opts =
'\'--line-number --column --with-filename --no-heading --color=never --smart-case --max-columns=4096 -e\''
map("n", "<C-f>",
  "<cmd>lua require('fzf-lua').live_grep({ rg_opts = " .. rg_opts .. "})<CR>",
  { silent = true, desc = "live ripgrep" })
map("n", "<Leader>ht", "<cmd>lua require('fzf-lua').helptags({prompt = ' '})<CR>",
  { silent = true, desc = "fzf [h]elp[t]ags" })
map("n", "<Leader>hl", "<cmd>lua require('fzf-lua').highlights({prompt = ' '})<CR>",
  { silent = true, desc = "fzf [h]elp[t]ags" })
