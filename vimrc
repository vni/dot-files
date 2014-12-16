set mouse=a
set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
set number numberwidth=5
set nobackup nowritebackup noswapfile
set showmode showcmd

nnoremap - dd

set laststatus=2
"set statusline=\ \ \ \ \ %t\ %r\ %m%=\%l/%L\ %p%2%
set statusline=\ \ \ \ \ %f\ %r\ %m%=\%l/%L\ %P
set showtabline=2
"set tabline="%t"

filetype plugin on

set t_Co=256

let mapleader=","

set incsearch hlsearch
set scrolloff=2

nnoremap <silent> <F8> :NERDTreeToggle<CR>
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>T :tabclose<CR>
nnoremap <Leader>v :tabnew ~/.vimrc<CR>
nnoremap <Leader>V :source ~/.vimrc<CR>
"noremap <Up> <C-Y>
"noremap <Down> <C-E>
noremap <C-K> <C-Y>
noremap <C-J> <C-E>
nnoremap <CR> <C-E>
"nnoremap <Space> <C-F>
nnoremap <Tab> <C-Y>
nnoremap <BackSpace> <C-Y>


" zenburn colorscheme tweaks
let g:zenburn_high_Contrast = 1
let g:zenburn_alternate_Visual = 1
let g:zenburn_force_dark_Background = 1

"nnoremap <silent> <F10> :cscope add ~/local/cscope/uestub/cscope.out<CR>

function! CS(dbname)
	let csdb_name = $HOME . "/local/cscope/" . a:dbname . "/cscope.out"
	execute 'cscope add ' . csdb_name
endfunction

" nnoremap <silent> <Leader>etm   :call CS("etm")<CR>
" nnoremap <silent> <Leader>ue    :call CS("uestub")<CR>
" nnoremap <silent> <Leader>linux :call CS("linux")<CR>

command! CSetm    :call CS("etm")
command! CSue     :call CS("uestub")
command! CSnue    :call CS("new-uestub")
command! CSlinux  :call CS("linux")
command! CSdwm	  :call CS("dwm")
command! CSsqn	  :call CS("sequansd")

set cmdwinheight=15

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:RunShellCommand(cmdline)
	echo a:cmdline
	let expanded_cmdline = a:cmdline
	for part in split(a:cmdline, ' ')
		if part[0] =~ '\v[%#<]'
			let expanded_part = fnameescape(expand(part))
			let expanded_cmdline = substitude(expanded_cmdline, part, expanded_part, '')
		endif
	endfor
	" botright new
	tabnew
	setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
	call setline(1, 'You entered:    ' . a:cmdline)
	call setline(2, 'Expanded form:  ' . expanded_cmdline)
	call setline(3, substitute(getline(2), '.', '=', 'g'))
	execute '$read !' . expanded_cmdline
	setlocal nomodifiable
	1
endfunction

command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
silent command! -complete=shellcmd -nargs=+ Sh call s:RunShellCommand(<q-args>)
command! -complete=file -nargs=* Git call s:RunShellCommand('git ' . <q-args>)

" set cmdheight=3

""" " Add highlighting for function definition in C++
""" function EnhanceCppSyntax()
""" 	syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?$"
""" 	hi def link cppFuncDef Special
""" endfunction
""" autocmd Syntax cpp call EnhanceCppSyntax()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syn match	cCustomParen	"(" contains=cParen contains=cCppParen
" syn match	cCustomFunc	"\w\+\s*("	contains=cCustomParen
" hi def	link	cCustomFunc	Funcion
" hi Function	term=bold	gui=bold
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight Class and Function names
" syn match    cCustomParen    "(" contains=cParen contains=cCppParen
" syn match    cCustomFunc     "\w\+\s*(" contains=cCustomParen
" syn match    cCustomScope    "::"
" syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope
" 
" " hi def link cCustomFunc  Function
" " hi def link cCustomClass Function
" 
" hi def cCustomFunc  ctermfg=228 cterm=bold
" hi def cCustomClass ctermfg=228 cterm=bold

set incsearch hlsearch

highlight Visual    ctermfg=0      ctermbg=210  cterm=none
highlight VisualNOS ctermfg=0      ctermbg=210  cterm=none
highlight IncSearch ctermfg=0      ctermbg=200  cterm=none
highlight Search    ctermfg=none   ctermbg=none cterm=underline

nnoremap = :noh<CR>

"set exrc

syntax on
colorscheme my_jellybeans

function! MyTabLine()
	" numberwidth gap of spaces
	let s = '   '
	for i in range(tabpagenr('$'))
		let tab = i + 1
		let winnr = tabpagewinnr(tab)
		let buflist = tabpagebuflist(tab)
		let bufnr = buflist[winnr - 1]
		let bufname = bufname(bufnr)
		let bufmodified = getbufvar(bufnr, '&mod')

		let s .= '%' . tab . 'T'
		let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
		let s .= '  '
		let s .= (bufmodified ? '+' : '')
		let s .= (bufname != '' ? fnamemodify(bufname, ':t') : '[No Name]')
		let s .= '  '
	endfor

	let s .= '%#TabLineFill#'
	if tabpagenr('$') > 1
		let s .= '%=%#TabLine#%999X[close]'
	endif
	return s
endfunction
set tabline=%!MyTabLine()

function! ToggleCursorLine()
	if &cursorline == 1
		set nocursorline
	else
		set cursorline
	endif
endfunction
nnoremap <silent> \cl :call ToggleCursorLine()<CR>

"TagBar
let g:tagbar_usearrows = 1
nnoremap <F8> :TagbarToggle<CR>
nnoremap <silent> <F10> :qa<CR>

function! ToggleListMode()
    if &list == 0
        set list
    else
        set nolist
    endif
endfunction
nnoremap <silent> \lm :call ToggleListMode()<CR>

" no cursorline by default
"set cursorline

"indentLines
"nnoremap <Leader>il :IndentLinesToggle<CR>
let g:indentLine_char = '|'
let g:indentLine_first_char = '|'

set tabpagemax=100

hi CursorLine ctermbg=236

"set nowrap sidescroll=5
set listchars+=precedes:<,extends:>
set listchars+=tab:>-,trail:-
nnoremap <C-L> 2zl
nnoremap <C-H> 2zh

""" augroup vimrc_autocmds
"""    autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
"""    autocmd BufEnter * match OverLength /\%74v.*/
""" augroup END

set statusline+=[%{&fo}]

"set wrapscan

autocmd BufWinLeave ?* mkview
autocmd BufWinEnter ?* loadview

hi Search cterm=none ctermbg=172 ctermfg=black

hi CursorLine ctermbg=180 ctermfg=black

function! ToggleColorColumn()
        if &colorcolumn == 0
                set colorcolumn=81
        else
                set colorcolumn=0
        endif
endfunction
nnoremap <silent> \cc :call ToggleColorColumn()<CR>
