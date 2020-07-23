filetype plugin on
syntax on

" set backspace=2
set backspace=indent,eol,start
set cursorline
set encoding=utf-8
set laststatus=2
set shiftwidth=4
set tabstop=4
set title


" vim-plug --------------------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()


" vim-go ----------------------------------------------------------------
let g:go_fmt_autosave = 0
let g:go_fmt_command = "goimports"

