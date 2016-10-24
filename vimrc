setl autoindent
setl backspace=2
setl cursorline
setl noexpandtab
setl nohlsearch
setl nu
setl smartindent
setl title


au BufNewFile,BufRead *.py set tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.yml set tabstop=2 shiftwidth=2
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"dein Scripts-----------------------------
if &compatible
  set nocompatible
endif
set runtimepath+=/Users/yoshima/.cache/dein/repos/github.com/Shougo/dein.vim

call dein#begin('/Users/yoshima/.cache/dein')

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplcache')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('ciaranm/inkpot')
call dein#add('davidhalter/jedi-vim')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('scrooloose/nerdtree')

call dein#end()

filetype plugin indent on
syntax enable
setl background=dark
colorscheme inkpot
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:inkpot_black_background = 1

if dein#check_install()
  call dein#install()
endif
