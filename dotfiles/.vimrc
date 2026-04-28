

"======"
" Мапы "

nmap <C-n> :NERDTreeToggle<CR>

"========"
" Основы "

set nocompatible                  " отключить режим совместимости с vi
filetype plugin indent on         " включить автозагрузку плагинов и отступов по типу файла
syntax on                         " включить подсветку синтаксиса
set number                        " показывать номера строк
set relativenumber                " относительные номера строк
set hidden                        " разрешить скрывать несохранённые буферы
set termguicolors                 " поддержка 24-bit цветов в терминале
" set cursorline                  " подсветка текущей строки
set tabstop=4                     " отображать таб как 4 пробела
set shiftwidth=4                  " ширина сдвига (>> <<) = 4
set expandtab                     " преобразовывать табы в пробелы
set smartindent                   " умные отступы для кода
set clipboard=unnamedplus         " использовать системный буфер обмена (+)
set mouse=a                       " включить мышь во всех режимах
set nowrap                        " выключает перенос строк

"=============="
" Для MarkDown "

let g:mkdp_auto_start = 1
let g:mkdp_browser = 'firefox'

"=============================="
" vim-plug (менеджер плагинов) "

call plug#begin('~/.vim/plugged')         " каталог для установки плагинов

"=========================="
" Просмотр MarkDown файлов "

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

"==============================="
" Древо файлов (обчный нёрдтри) "

Plug 'preservim/nerdtree'

"===================="
" Менеджер и утилиты "

Plug 'junegunn/vim-plug'                  " сам менеджер плагинов (в README указан способ установки)
Plug 'tpope/vim-sensible'                 " набор разумных дефолтов для vim

"==================="
" Навигация и поиск "

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy finder (компилируется/устанавливается)
Plug 'junegunn/fzf.vim'                   " интерфейс fzf для vim
Plug 'preservim/nerdtree'                 " древовидный файловый браузер

"================================="
" Подсветка, LSP и автодополнение "

Plug 'neoclide/coc.nvim', {'branch': 'release'}      " LSP-клиент и автокомплит (работает как расширение)

"========================="
" Удобства редактирования "

Plug 'tpope/vim-surround'                 " удобная работа с окружениями
Plug 'tpope/vim-commentary'               " простое комментирование строк/блоков
Plug 'jiangmiao/auto-pairs'               " автозакрытие скобок и кавычек

"====="
" Git "

Plug 'tpope/vim-fugitive'                 " мощная интеграция с git
Plug 'airblade/vim-gitgutter'             " отображение изменений гита в колонке (gutter)

"=============================="
" Статический анализ / linting "

Plug 'dense-analysis/ale'                 " асинхронный линтер/фиксер

"===="
" UI "

Plug 'itchyny/lightline.vim'              " лёгкая статус-строка

call plug#end()                           " завершить блок плагинов
