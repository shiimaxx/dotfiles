setl autoindent
setl backspace=2
setl cursorline
setl laststatus=2
setl expandtab
setl nohlsearch
setl nu
setl smartindent
setl title

au BufNewFile,BufRead *.sh   set tabstop=4 softtabstop=4 shiftwidth=4
au BufNewFile,BufRead *.py   set tabstop=4 softtabstop=4 shiftwidth=4
au BufNewFile,BufRead *.go   set noexpandtab tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.rb   set tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.md   set tabstop=4 softtabstop=4 shiftwidth=4
au BufNewFile,BufRead *.yml  set tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.html set tabstop=2 softtabstop=2 shiftwidth=2

nnoremap <silent><C-e> :NERDTreeToggle<CR>

"dein Scripts-----------------------------
if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  "call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
endif

filetype plugin indent on
syntax enable
setl background=dark
colorscheme inkpot
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar', 'unite']

let g:inkpot_black_background = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 4

if dein#check_install()
  call dein#install()
endif
