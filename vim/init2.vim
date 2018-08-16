set mouse=a
set incsearch
set hlsearch
set ruler
set showmode
set showcmd
set laststatus=2
set cindent
set hidden
set t_Co=256

set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set showtabline=2
set number numberwidth=4

set nocompatible

filetype plugin on

nnoremap - dd
nnoremap <CR> <C-e>
nnoremap <Backspace> <C-y>
nnoremap = :noh<CR>
nnoremap <C-n> :tabnext<CR>
nnoremap <C-p> :tabprevious<CR>
vnoremap <C-y> "+y
nnoremap <C-h> 0"+P
nnoremap <F2> :buffers<CR>
nnoremap <F3> :buffers<CR>:buffer<Space>
nnoremap <F9> :Lexplore<CR>
nnoremap <F10> :qa<CR>

iabbrev #i #include
iabbrev #d #define
iabbrev #e #endif

"colorscheme pablo
"colorscheme koehler
"colorscheme gruvbox
let g:alduin_Shout_Aura_Whisper = 1
colorscheme alduin

" netrw
let g:netrw_winsize=20
let g:netrw_liststyle=3
let g:netrw_altv=1

let mapleader=","
nnoremap <Leader>cc <Esc>0i//<Esc>
