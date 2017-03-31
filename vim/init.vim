set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set nobackup nowritebackup noswapfile
set showmode showcmd

set mouse=a

nnoremap - dd
nnoremap = :noh<CR>

iabbrev #i #include
iabbrev #d #define

nnoremap <CR> <C-E>
"nnoremap <Tab> <C-Y>
nnoremap <BackSpace> <C-Y>

"let g:jellybeans_overrides = {
"\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
"\}

nnoremap <C-n> :tabnext<CR>
nnoremap <C-p> :tabprev<CR>

let mapleader=","

" solarized colorscheme
"set background=light " or dark
"colorscheme solarized

set termguicolors
colorscheme my_evening
set cursorline
