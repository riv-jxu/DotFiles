set nocompatible

syntax on

set number
set relativenumber

set shiftwidth=2
set tabstop=2

set expandtab

set nowrap

set hlsearch

set incsearch

set ignorecase
set smartcase

set autoindent

function! ToggleNumber()
  if &number && &relativenumber
    set nonumber norelativenumber
  else
    set number relativenumber
  endif
endfunction

" Map <C-n> followed by n to toggle numbers
nnoremap <C-n><C-n> :call ToggleNumber()<CR>

call plug#begin()

" List your plugins here
Plug 'ghifarit53/tokyonight-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

