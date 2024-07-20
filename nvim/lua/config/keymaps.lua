-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Salir del modo de inserción con 'jk'
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })

-- Guardar con 'leader w'
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true, desc = "Save file" })

-- Salir con 'leader q'
vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true, silent = true, desc = "Quit file" })

-- Telekasten keymaps with 'n' prefix
vim.keymap.set(
  "n",
  "<leader>nn",
  '<cmd>lua require("telekasten").new_note()<CR>',
  { noremap = true, silent = true, desc = "New note" }
)
vim.keymap.set(
  "n",
  "<leader>nd",
  '<cmd>lua require("telekasten").find_daily_note()<CR>',
  { noremap = true, silent = true, desc = "Find daily note" }
)
vim.keymap.set(
  "n",
  "<leader>nw",
  '<cmd>lua require("telekasten").find_weekly_note()<CR>',
  { noremap = true, silent = true, desc = "Find weekly note" }
)
vim.keymap.set(
  "n",
  "<leader>ng",
  '<cmd>lua require("telekasten").search_notes()<CR>',
  { noremap = true, silent = true, desc = "Search notes" }
)
vim.keymap.set(
  "n",
  "<leader>nl",
  '<cmd>lua require("telekasten").follow_link()<CR>',
  { noremap = true, silent = true, desc = "Follow link" }
)
vim.keymap.set(
  "n",
  "<leader>nb",
  '<cmd>lua require("telekasten").show_backlinks()<CR>',
  { noremap = true, silent = true, desc = "Show backlinks" }
)
vim.keymap.set(
  "n",
  "<leader>ni",
  '<cmd>lua require("telekasten").insert_link()<CR>',
  { noremap = true, silent = true, desc = "Insert link" }
)
