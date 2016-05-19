" based on sensible.vim
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'chriskempson/base16-vim'

"Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'easymotion/vim-easymotion'

Plugin 'davidhalter/jedi-vim'
Plugin 'ternjs/tern_for_vim'

Plugin 'mrtazz/DoxygenToolkit.vim'

Plugin 'tpope/vim-sleuth'
Plugin 'majutsushi/tagbar'
if has('gui_running')
  Plugin 'bling/vim-airline'
  Plugin 'kien/ctrlp.vim'
  Plugin 'scrooloose/syntastic'
endif

call vundle#end()

" Use :help 'option' to see the documentation for the given option.

let mapleader = "\<space>"

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

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

set splitright

set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

set autoread
set fileformats+=mac

set history=1000
set tabpagemax=50
if !has('nvim')
  set viminfo='10,\"100,:20,%,n~/.viminfo
else
  set viminfo='10,\"100,:20,%
endif

set hidden

set number
set cursorline
set colorcolumn=80

set tabstop=4
set shiftwidth=4
set expandtab

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

inoremap <C-U> <C-G>u<C-U>

let base16colorspace=256
colorscheme base16-default
set background=dark

au BufRead,BufNewFile *.md setlocal filetype=markdown
autocmd Filetype mail setlocal textwidth=80 spell
autocmd Filetype text setlocal textwidth=80 spell
autocmd Filetype help setlocal nospell
autocmd Filetype gitcommit setlocal textwidth=72 spell
autocmd Filetype markdown setlocal textwidth=80 spell

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

let g:tex_flavor = "latex"
let g:airline#extensions#tabline#enabled = 1
let g:ctrlp_cmd = 'CtrlPBuffer'



if has('gui_running')
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  set guioptions-=r
  set guioptions-=L
  set guioptions-=m
  set guioptions-=T
  set guioptions-=e

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 0
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 1
  let g:syntastic_python_python_exec = '/path/to/python3'
  let g:syntastic_javascript_checkers=['jsl']
  let g:syntastic_javascript_jsl_args= "-conf /home/sahaltran02/bin/jsl.conf"
  let g:syntastic_mode_map = {
    \ "mode": "passive",
    \ "active_filetypes": ["javascript"],
    \ "passive_filetypes": [] }
endif

map <Tab> <C-W>W
nmap <BS> <C-^>
nmap <Del> :TagbarClose<cr> :bd<cr>

runtime! ftplugin/man.vim
nnoremap K :Man <cword><cr>
nmap <F8> :TagbarToggle<CR>

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "2"
let g:jedi#popup_select_first = 0
"let g:EasyMotion_do_mapping = 0
let g:tagbar_type_javascript = {
    \ 'ctagsbin' : '/home/douwe/node_modules/.bin/jsctags'
    \ }

nnoremap <Leader>o :CtrlPBuffer<CR>
nnoremap <Leader>r "_diwP
nnoremap <Leader>w :w<CR>
nnoremap <Leader>f :lnext<CR>
nnoremap <Leader>F :ll<CR>

nmap <leader>s <Plug>(easymotion-s)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)

nnoremap <leader>p :set tabstop=4 shiftwidth=4 expandtab<cr>
nnoremap <leader>l :set tabstop=8 shiftwidth=8 noexpandtab<cr>

set tags=./tags;

" vim:set ft=vim et sw=2:
