set nocompatible

syntax on

set number
set relativenumber

set shiftwidth=4
set tabstop=4

set expandtab

set nowrap

set hlsearch

set incsearch

set ignorecase
set smartcase

set autoindent

" Status line, clear on reload
set statusline=
" left side
set statusline=\ %F\ %M\ %Y\ %R
" divider
set statusline+=%=
" right side
set statusline+=\ ascii:\ %b\ row:\ %l\ col:\ %c\ percent:\ %p%%

set laststatus=2

let mapleader=" "

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
Plug 'tpope/vim-fugitive'
Plug 'github/copilot.vim'
" Need to modify ~/.vim/plugged/copilot-chat.vim/autoload/copilot_chat/auth.vim to fix an error
Plug 'DanBradbury/copilot-chat.vim'

call plug#end()

filetype plugin indent on

set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

" Key mappings
" Find files
nnoremap <leader>ff :FZF<CR>
" Ripgrep search
nnoremap <leader>rg :RG<CR>
" Ripgrep search with word under cursor
nnoremap <expr> <leader>rw ":RG \\<".expand('<cword>')."\\><CR>"

" Open a new Copilot Chat window
nnoremap <leader>cc :CopilotChatOpen<CR>

" Focus existing chat window
nnoremap <leader>cf :CopilotChatFocus<CR>

" Add visual selection to chat
vmap <leader>ca <Plug>CopilotChatAddSelection

" Reset chat conversation
nnoremap <leader>cr :CopilotChatReset<CR>
"
" Enable/disable Copilot Auto-completion
nnoremap <leader>cd :Copilot disable<CR>
nnoremap <leader>ce :Copilot enable<CR>

" Start a fugitive command
nnoremap <expr> <leader>g ":Git "

function! ToggleDiff()
  if &diff
    diffoff
  else
    diffthis
  endif
endfunction
"
" Map <C-n> followed by n to toggle numbers
nnoremap <leader>df :call ToggleDiff()<CR>
