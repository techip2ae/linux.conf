local keymap = vim.keymap.set

-- Сохранение и выход
keymap("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
keymap("n", "<C-q>", "<cmd>q!<CR>", { desc = "Force quit" })

-- Перемещение по строкам визуально приятнее
keymap("n", "j", "gj", { desc = "Move down visually" })
keymap("n", "k", "gk", { desc = "Move up visually" })

-- Удаление без копирования в регистр
keymap("n", "x", '"_x', { desc = "Delete char without yank" })

-- Окна
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split vertical" })
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split horizontal" })
keymap("n", "<leader>se", "<C-w>=", { desc = "Equal splits" })
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
