" based on sensible.vim
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'msanders/snipmate.vim'

" Use :help 'option' to see the documentation for the given option.

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

set nrformats-=octal
set shiftround

set ttimeout
set ttimeoutlen=50

set ignorecase
set smartcase
set incsearch
set hlsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

set laststatus=2
set ruler
set showcmd
set wildmenu

set scrolloff=3
set sidescrolloff=5
set display+=lastline

set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

set autoread
set fileformats+=mac

set history=1000
set tabpagemax=50
set viminfo='10,\"100,:20,%,n~/.viminfo

set hidden

set number
set cursorline
set colorcolumn=80

set textwidth=80
set tabstop=8
set shiftwidth=8
set noexpandtab

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

inoremap <C-U> <C-G>u<C-U>

colorscheme solarized
set background=dark

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    normal! z.
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" vim:set ft=vim et sw=2:
