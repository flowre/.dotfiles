setlocal makeprg=file=/tmp/$RANDOM.pdf\ &&\ pandoc\ %\ -o\ $file\ &&\ open\ $file
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
map <Leader>ba i\begin{align*}<Enter>
map <Leader>ea i\end{align*}<Enter>
map <Leader>bc i\begin{code}<Enter>
map <Leader>ec i\end{code}<Enter>
