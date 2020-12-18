" Load plugins with vim-plug
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'janko/vim-test'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Plug 'rbong/vim-crystalline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'dense-analysis/ale'
call plug#end()

" Plugin Settings

" vim-airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16_gruvbox_dark_hard'

" vim wiki settings
let g:vimwiki_list = [{'path': '~/repos/vimwiki/',
											\ 'syntax': 'markdown', 'ext': '.md'}]
" nerdtree settings
nmap <F4> :NERDTreeToggle<CR>

" vim-test shortcuts
nmap <silent> <F5> :TestNearest<CR>
nmap <silent> <F6> :TestFile<CR>
nmap <silent> <F7> :TestSuite<CR>
nmap <silent> <F8> :TestLast<CR>
nmap <silent> <F9> :TestVisit<CR>

" Ale settings
let g:ale_fixers = {
	\ '*': ['remove_trailing_lines', 'trim_whitespace'],
	\ 'go': ['gofmt'],
	\ 'python': ['autopep8']}

let g:ale_fix_on_save = 1
let g:ale_sign_error = "◉"
let g:ale_sign_warning = "◉"


" vim-crystalline settings
"function! StatusLine(current, width)
"	let l:s = ''
"
"	if a:current
"		let l:s .= crystalline#mode() . crystalline#right_mode_sep('')
"	else
"		let l:s .= '%#CrystallineInactive#'
"	endif
"	let l:s .= ' %f%h%w%m%r '
"	if a:current
"		let l:s .= crystalline#right_sep('', 'Fill') . ' %{fugitive#head()}'
"	endif
"
"	let l:s .= '%='
"	if a:current
"		let l:s .= crystalline#left_sep('', 'Fill') . ' %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""}'
"		let l:s .= crystalline#left_mode_sep('')
"	endif
"	if a:width > 80
"		let l:s .= ' %{&ft}[%{&fenc!=#""?&fenc:&enc}][%{&ff}] %l/%L %c%V %P '
"	else
"		let l:s .= ' '
"	endif
"
"	return l:s
"endfunction
"
" function! TabLine()
" 	let l:vimlabel = has('nvim') ?	' NVIM ' : ' VIM '
" 	return crystalline#bufferline(2, len(l:vimlabel), 1) . '%=%#CrystallineTab# ' . l:vimlabel
" endfunction
"
" let g:crystalline_enable_sep = 1
" let g:crystalline_statusline_fn = 'StatusLine'
" let g:crystalline_tabline_fn = 'TabLine'
" let g:crystalline_theme = 'gruvbox'
"
" gruvbox colour scheme settings
set background=dark
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
syntax on
highlight Normal ctermbg=None
"

" Enable line numbers
set number relativenumber
" Highlight current line
set cursorline
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Make Vim more useful
set nocompatible

filetype plugin on

" Enhance command-line completion
set wildmenu
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" TAB settings as per vimcast
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab

if has("autocmd")
  " Enable file type detection
  filetype on

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=2 sts=2 sw=2 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml
endif



" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch




set showtabline=2
set guioptions-=e
set laststatus=2


" Macros
"
" " Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
	let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
	if l:tabstop > 0
		let &l:sts = l:tabstop
		let &l:ts = l:tabstop
		let &l:sw = l:tabstop
	endif
	call SummarizeTabs()
endfunction

function! SummarizeTabs()
	try
		echohl ModeMsg
		echon 'tabstop='.&l:ts
		echon ' shiftwidth='.&l:sw
		echon ' softtabstop='.&l:sts
		if &l:et
			echon ' expandtab'
		else
			echon ' noexpandtab'
		endif
	finally
		echohl None
	endtry
endfunction
