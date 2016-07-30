" Plugins ---------- {{{
execute pathogen#infect()
" }}}
" leader ---------- {{{
let mapleader="-"
let maplocalleader="#"
" }}}
" shortcuts ---------- {{{
" move line one below
noremap _ ddkP
" move line one above
noremap - ddp
" open vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" soure vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
" open/close fold
nnoremap <space> za
" move to the start of the line
nnoremap L $
" move to the end of the line
nnoremap H 0
" add qoutes around word
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
" add qoutes around word
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
" never use esc to return from insert mode
inoremap <esc> <nop>
" delete line in insert mode and stay in insert mode
inoremap <c-d> <esc>ddi
" return to normal mode
inoremap jk <esc>
" change word to uppercase
inoremap <c-u> <esc>bveUea
" surround visual selection with quoutes
vnoremap " <esc>a"<esc>`<i"<esc>`>ll
" surround visual selection with quoutes
vnoremap ' <esc>a'<esc>`<i'<esc>`>ll
" }}}
" Operator-pending mappings ---------- {{{
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap in[ :<c-u>normal! f[vi[<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
onoremap il[ :<c-u>normal! F]vi[<cr>
onoremap oo( :<c-u>normal! F(hviw<cr>
" }}}
" Typo corrections ---------- {{{
iabbrev adn and
iabbrev waht what
iabbrev tehn then
" }}}
" Global settings ---------- {{{
set number
set relativenumber
set showmatch
set autoindent
" }}}
" Statusline configuration ----------- {{{
" maybe extend this in future with 'setlocal' in groups
" for different file types
set statusline=%t 	" Filename
set statusline+=\ %y 	"FileType
set statusline+=%=	" Switch to the right side
set statusline+=Current:
set statusline+=%-4l	" Current line
set statusline+=Total:\ 
set statusline+=\ %-4L	" Total lines
" }}}
" c,h, cpp file setting ---------- {{{
augroup filetype_c
	autocmd!
	"prefix comment
	autocmd FileType c,cpp,h nnoremap <buffer> <localleader>c I//<space><esc>
	"wrap comment
	autocmd FileType c,cpp,h nnoremap <buffer> <localleader>C I/*<space><esc>A<space>*/<esc>
	"create empy test case
	autocmd FileType c,cpp,h nnoremap <buffer> <localleader>ct Ivoid<space>test_replace(void)<CR>{<CR>}<space>/*<space>end<space>test_replace<space>*/<esc>
	autocmd FileType c,cpp,h setlocal textwidth=78
	autocmd FileType c,cpp,h setlocal shiftwidth=4
	autocmd FileType c,cpp,h setlocal tabstop=4
	autocmd FileType c,cpp,h :iabbrev <buffer> iff if ()<left><left>
	autocmd FileType c,cpp,h :iabbrev <buffer> eif elseif ()<left>
	autocmd FileType c,cpp,h :iabbrev <buffer> ret return ();<left><left>
augroup END
" }}}
" Python file setting ---------- {{{
augroup filetype_python
	autocmd!
	autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
	autocmd FileType python :iabbrev <buffer> ra range ()<left>
	autocmd FileType python :iabbrev <buffer> range NOOOOOOO
	autocmd FileType python :iabbrev <buffer> iff if:<left>
	autocmd FileType python :iabbrev <buffer> if NOOOOOOOOO
augroup END
" }}}
" Text,Markdown file settings ---------- {{{
augroup filetype_txt
	autocmd!
	autocmd FileType text,markdown onoremap ih :<c-u>execute "normal! ?^[=-][=-]\\+$\r:nohlsearch\rkvg_"<cr>
	autocmd FileType text,markdown onoremap ah :<c-u>execute "normal! ?^[=-][=-]\\+$\r:nohlsearch\rg_vk0"<cr>
	autocmd FileType text,markdown onoremap in@ :<c-u>execute "normal! /\\S\\+@\\a\\+.\\a\\+\r:nohlsearch\rvE"<cr>
	autocmd BufNewFile,BufRead *.txt setlocal wrap " wrap text files
augroup END
" }}}
" Vimscript file settings ---------- {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
	autocmd FileType vim setlocal foldlevelstart=0
augroup END
" }}}
" PTU file settings ---------- {{{
augroup filetype_ptu
	autocmd!
	autocmd BufNewFile,BufRead *.ptu setlocal nowrap " wrap text files
	autocmd BufNewFile,BufRead *.ptu setlocal number " wrap text files
	autocmd BufNewFile,BufRead *.ptu setlocal autoindent " wrap text files
" }}}
