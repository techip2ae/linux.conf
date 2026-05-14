local opt = vim.opt

-- Отступы и табы
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- Интерфейс
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.termguicolors = true
opt.signcolumn = "yes"

-- Поиск
opt.ignorecase = true
opt.smartcase = true

-- Буфер обмена
opt.clipboard = "unnamedplus"

-- Мышь
opt.mouse = "a"

-- Лидер-клавиша (пробел)
vim.g.mapleader = " "
