" Vim text editor config file

" Don't use vi compatible mode
set nocompatible

" Pathogen plugin manager
execute pathogen#infect()

" Recognize filetypes
filetype plugin on

" Enable syntax highlighting
syntax on

" Enable 256 colors
set t_Co=256

" Leader key to press before custom commands
let mapleader = ','
let maplocalleader = ','

" Allow backspace and arrow keys to move across lines
set whichwrap+=<,>
set backspace=indent,eol,start

" Enable automatic line wrapping
set formatoptions+=wa

" Sync vim's clipboard with system clipboard
set clipboard=unnamed
set clipboard=unnamedplus

" Enable bash aliases
let $BASH_ENV = "~/.bash_aliases"

" Treat txt files as markdown
autocmd BufNewFile,BufReadPost *.txt set filetype=markdown
