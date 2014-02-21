"" " Highlight Class and Function names
"" syn match    cCustomParen    "(" contains=cParen contains=cCppParen
"" syn match    cCustomFunc     "\w\+\s*(" contains=cCustomParen
"" syn match    cCustomScope    "::"
"" syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope
"" 
"" hi def link cCustomFunc  Function
"" hi def link cCustomClass Function
"" 
"" " hi def cCustomFunc  ctermfg=228 cterm=bold
"" " hi def cCustomClass ctermfg=228 cterm=bold
"" 
"" syn keyword cCustomMat huy pizda
"" hi cCustomMat cterm=bold ctermfg=186
"" echom "after/syntax/c.vim"
