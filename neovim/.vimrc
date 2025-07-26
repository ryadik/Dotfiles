" --- Основные настройки ---
set nocompatible          " Отключаем совместимость с vi
set number                " Показывать номера строк
set relativenumber        " Относительные номера строк
syntax on                 " Включить подсветку синтаксиса
filetype plugin indent on " Автодетектирование типа файлов
set tabstop=4             " Отображение таба как 2 пробела
set shiftwidth=4          " Автоотступы тоже 2 пробела
set expandtab             " Превращаем табы в пробелы
set autoindent            " Автоматические отступы
set smartindent           " Смарт-отступы для кода
set clipboard=unnamedplus " Работа с системным буфером обмена
set cursorline            " Подсвечивать текущую строку
set nowrap                " Не переносить строки
set scrolloff=10          " Отступ от края экрана при прокрутке

" --- Поиск ---
set ignorecase            " Игнорировать регистр при поиске
set smartcase             " Но учитывать регистр, если есть хотя бы одна заглавная
set incsearch             " Показ результата поиска при наборе
set hlsearch              " Подсветка результатов поиска

" --- Цвета и интерфейс ---
set termguicolors         " Поддержка 24-битных цветов
colorscheme desert        " Встроенная цветовая схема (можно поменять)

" --- Удобные биндинги ---
nnoremap <SPACE> :nohlsearch<CR>  " Пробел очищает подсветку поиска

" --- Автоматическое определение типов файлов ---
au BufRead,BufNewFile *.jsx,*.tsx set filetype=javascriptreact
au BufRead,BufNewFile *.ts,*.tsx set filetype=typescript

" --- Мини-интеграция с Prettier (если установлен глобально) ---
command! Prettier :%!prettier --stdin-filepath % --parser babel
