set autoindent cindent
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

iabbrev #i #include
iabbrev #d #define

imap  I#include "A"
imap  I#include <A>
" 

highlight Visual       ctermfg=black ctermbg=210
highlight IncSearch    ctermfg=black ctermbg=210 cterm=none
highlight Search       ctermfg=black ctermbg=210 cterm=none

syntax match jkCxxFunctionName /^\w\+::\~\?\w\+(/me=e-1
"highlight jkCxxFunctionName ctermfg=155
highlight jkCxxFunctionName ctermfg=155 cterm=none
"highlight link jkCxxFunctionName Type

syntax keyword cType u8 u16 u32 u64 s8 s16 s32 s64

syntax on
colorscheme my_jellybeans
