" Load plugins with vim-plug
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'janko/vim-test'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-crystalline'
Plug 'vimwiki/vimwiki'
call plug#end()

" Nerd tree shortcuts F4
nmap <F4> :NERDTreeToggle<CR>

" vim-test shortcuts
nmap <silent> <F5> :TestNearest<CR>
nmap <silent> <F6> :TestFile<CR>
nmap <silent> <F7> :TestSuite<CR>
nmap <silent> <F8> :TestLast<CR>
nmap <silent> <F9> :TestVisit<CR>


" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" Make Vim more useful
set nocompatible

filetype plugin on




" Statusbar config with vim-crystalline
function! StatusLine(current, width)
  let l:s = ''

  if a:current
    let l:s .= crystalline#mode() . crystalline#right_mode_sep('')
  else
    let l:s .= '%#CrystallineInactive#'
  endif
  let l:s .= ' %f%h%w%m%r '
  if a:current
    let l:s .= crystalline#right_sep('', 'Fill') . ' %{fugitive#head()}'
  endif

  let l:s .= '%='
  if a:current
    let l:s .= crystalline#left_sep('', 'Fill') . ' %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""}'
    let l:s .= crystalline#left_mode_sep('')
  endif
  if a:width > 80
    let l:s .= ' %{&ft}[%{&fenc!=#""?&fenc:&enc}][%{&ff}] %l/%L %c%V %P '
  else
    let l:s .= ' '
  endif

  return l:s
endfunction

function! TabLine()
  let l:vimlabel = has('nvim') ?  ' NVIM ' : ' VIM '
  return crystalline#bufferline(2, len(l:vimlabel), 1) . '%=%#CrystallineTab# ' . l:vimlabel
endfunction

let g:crystalline_enable_sep = 1
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_tabline_fn = 'TabLine'
let g:crystalline_theme = 'gruvbox'

set showtabline=2
set guioptions-=e
set laststatus=2
set background=dark
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

" vim wiki settings
let g:vimwiki_list = [{'path': '~/repos/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
