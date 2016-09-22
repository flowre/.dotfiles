setlocal makeprg=file=$RANDOM.pdf;\ pdflatex\ -jobname\ $file\ -output-directory\ /tmp\ %\ &&\ open\ $file
