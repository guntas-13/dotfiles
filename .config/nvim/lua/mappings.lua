require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- basic remaps
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Copilot Accept
map('i', '<S-Tab>', function ()
  vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
end, { desc = 'Copilot Accept', noremap = true, silent = true })

-- Tmux navigator mappings (from image)
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>",  { desc = "window left" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "window right" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>",  { desc = "window down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>",    { desc = "window up" })
