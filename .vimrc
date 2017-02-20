" Vim text editor config file

set nocompatible
execute pathogen#infect()
set t_Co=256
filetype plugin indent on
syntax on

set mouse=a
map <ScrollWheelUp> 3<C-Y>
map <S-ScrollWheelUp> <C-U>
map <ScrollWheelDown> 3<C-E>
map <S-ScrollWheelDown> <C-D>
nnoremap <C-j> :bn<CR>
nnoremap <C-k> :bp<CR>
nnoremap <C-c> :bd<CR>
nnoremap <C-q> :q<CR>
nnoremap <C-p> :e 
nnoremap ; :
let mapleader = ','
let maplocalleader = ','

set whichwrap+=<,>,[,]
set backspace=indent,eol,start
set formatoptions+=wa
set clipboard=unnamed
set clipboard=unnamedplus
