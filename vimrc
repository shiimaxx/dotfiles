filetype plugin on
syntax on

set backspace=indent,eol,start " set backspace=2
set cursorline
set encoding=utf-8
set laststatus=2
set shiftwidth=4
set tabstop=4
set title

inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Del>
inoremap <C-h> <BS>


" vim-plug ----------------------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'itchyny/lightline.vim'
call plug#end()


" vim-go ------------------------------------------------------------------
let g:go_fmt_autosave = 0
let g:go_fmt_command = "goimports"


" lightline.vim -----------------------------------------------------------
let g:lightline = { 'colorscheme': 'jellybeans' }

