setl autoindent
setl backspace=2
setl cursorline
setl laststatus=2
setl noexpandtab
setl nohlsearch
setl nu
setl smartindent
setl title

au BufNewFile,BufRead *.py set tabstop=8 expandtab shiftwidth=4 softtabstop=4
au BufNewFile,BufRead *.yml set tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.md set expandtab shiftwidth=4 softtabstop=4

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
call dein#add('itchyny/lightline.vim')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('plasticboy/vim-markdown')
call dein#add('scrooloose/nerdtree')

call dein#end()

filetype plugin indent on
syntax enable
setl background=dark
colorscheme inkpot
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:inkpot_black_background = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 4

if dein#check_install()
  call dein#install()
endif
