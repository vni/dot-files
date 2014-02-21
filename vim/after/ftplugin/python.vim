"setlocal foldmethod=indent
"setlocal foldmethod=syntax
setlocal foldtext=substitute(getline(v:foldstart), "\\t", "\ \ \ \ ", "g")
setlocal foldmethod=manual
setlocal foldcolumn=4

nnoremap <space> za
vnoremap <space> zf
