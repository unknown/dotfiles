local map = vim.keymap.set

-- diagnostics
map("n", "<leader>d", vim.diagnostic.open_float)
map("n", "]g", vim.diagnostic.goto_next)
map("n", "[g", vim.diagnostic.goto_prev)

map("n", "<leader>w", "<cmd>set wrap!<cr>")
