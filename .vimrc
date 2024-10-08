syntax on
set incsearch
set ignorecase
set smartcase
set autoindent
set number
set ruler
set splitright
set relativenumber

set wildmode=longest:full,full
" set wildignorecase

nnoremap <SPACE> <Nop>
let mapleader = " "
" d is for delete
nnoremap x "_x
nnoremap X "_X
nnoremap c "_c
nnoremap C "_C
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
vnoremap c "_c

if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
  nnoremap <leader>d "+d
  nnoremap <leader>D "+D
  vnoremap <leader>d "+d
else
  set clipboard=unnamed
  nnoremap <leader>d "*d
  nnoremap <leader>D "*D
  vnoremap <leader>d "*d
endif

nnoremap <leader>w <C-w>
