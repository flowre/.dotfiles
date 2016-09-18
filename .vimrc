" Vim text editor customization file

set nocompatible              " be iMproved, required
filetype off                  " required

" Leader key to press before custom commands
" Must be before Vundle
let mapleader = ','
let maplocalleader = ','

" Begin Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim' " Required for Vundle
Plugin 'godlygeek/tabular' " Required before vim-markdown
Plugin 'plasticboy/vim-markdown'
Plugin 'vim-pandoc/vim-pandoc'
"Plugin 'vim-pandoc/vim-pandoc-syntax'
"Plugin '907th/vim-auto-save'
"Plugin 'flazz/vim-colorschemes'
"Plugin 'tpope/vim-fugitive'

" End Vundle
call vundle#end()            " Required
filetype plugin indent on    " Required

" Pathogen plugin manager
"execute pathogen#infect()

" vim-markdown setttings
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1

" vim-pandoc settings
let g:pandoc#modules#disabled = ["folding", "spell"]
"let g:pandoc#syntax#conceal#use = 0
"let g:pandoc#syntax#style#emphases = 1
"let g:pandoc#command#autoexec_on_writes = 1
"let g:pandoc#command#autoexec_command = "Pandoc --tab-stop=8! pdf"

" Enable 256 colors
set t_Co=256

" Enable syntax highlighting
syntax on
colorscheme dawn

" Enable automatic line wrapping
set formatoptions+=wa

" Enable Python indenting (do we need this?)
filetype indent plugin on

" Sync vim's clipboard with system clipboard
set clipboard=unnamed
set clipboard=unnamedplus

" Enable bash aliases
let $BASH_ENV = "~/.bash_aliases"

" Insert current date and time
map <Leader>d "=strftime("%a %m/%d/%y, %X")<CR>p

" Enter inserts newline in normal mode
nmap <CR> o<ESC>

" TODO: map that converts === and --- style headers to #

" Allow backspace to delete end of lines in insert mode
set backspace=indent,eol,start

" Markdown/latex notes
autocmd BufNewFile,BufReadPost *.txt set filetype=markdown
command -nargs=? L !file=$(echo % | md5sum | cut -c -8).pdf;
		\ pdflatex <args> -jobname file -output-directory /tmp % && open %:r.pdf
command -nargs=? P !file=/tmp/$(echo % | md5sum | cut -c -8).pdf;
		\ pandoc % -o $file <args> && open $file

map <Leader>d i**Definition:**<Space>
map <Leader>t i**Theorem:**<Space>
map <Leader>p i*Proof:*<Space>
map <Leader>q i**Question:**<Space>
map <Leader>a i*Answer:*<Space>
map <Leader>ba i\begin{align*}<Enter>
map <Leader>ea i\end{align*}<Enter>
map <Leader>bc i\begin{code}<Enter>
map <Leader>ec i\end{code}<Enter>
