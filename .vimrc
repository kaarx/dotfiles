" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'kaarx/lightline-gruvbox-darker.vim'
Plug 'fatih/vim-go'
Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()


set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>


" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

set relativenumber

" Enable syntax highlighting
syntax on

set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

set cursorline

" Show matching brackets when text indicator is over them
set showmatch 

" How many tenths of a second to blink when matching brackets
set mat=2

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch    

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" Show invisible characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

set laststatus=2
set noshowmode

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


let g:gitgutter_grep                    = 'grep'
let g:gitgutter_map_keys                = 0
let g:gitgutter_sign_added              = '▎'
let g:gitgutter_sign_modified           = '▎'
let g:gitgutter_sign_modified_removed   = '▶'
let g:gitgutter_sign_removed            = '▶'
let g:gitgutter_sign_removed_first_line = '◥'
nmap [g <Plug>GitGutterPrevHunkzz
nmap ]g <Plug>GitGutterNextHunkzz
nmap <Leader>p <Plug>GitGutterPreviewHunk
nmap <Leader>+ <Plug>GitGutterStageHunk
nmap <Leader>- <Plug>GitGutterUndoHunk

let g:lightline = {}
let g:lightline.colorscheme='gruvbox_darker'
set noshowmode  " to get rid of thing like --INSERT--
set noshowcmd  " to get rid of display of last command
set shortmess+=F  " to get rid of the file name displayed in the command line bar
