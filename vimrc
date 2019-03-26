" vim-plug --------------------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
Plug 'mattn/sonictemplate-vim'
Plug 'ryanolsonx/vim-lsp-javascript'
Plug 'ryanolsonx/vim-lsp-python'
Plug 'ryanolsonx/vim-lsp-typescript'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'previm/previm'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
call plug#end()


" vim -------------------------------------------------------------------
set autoindent
set backspace=2
set cursorline
set encoding=utf-8
set expandtab
set laststatus=2
set nohlsearch
set number
set smartindent
set title

set background=dark
colorscheme solarized

au BufNewFile,BufRead *.sh   set tabstop=4 softtabstop=4 shiftwidth=4
au BufNewFile,BufRead *.py   set tabstop=4 softtabstop=4 shiftwidth=4
au BufNewFile,BufRead *.rb   set tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.md   set tabstop=4 softtabstop=4 shiftwidth=4
au BufNewFile,BufRead *.yml  set tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.yaml set tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.html set tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.go   set tabstop=4 noexpandtab   shiftwidth=4

filetype plugin indent on
syntax on

inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-e> <End>
inoremap <C-d> <Del>
inoremap <C-h> <BS>


" vim-lsp ---------------------------------------------------------------
if executable('bingo')
  augroup LspGo
    au!
    autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'bingo',
      \ 'cmd': {server_info->['bingo', '-mode', 'stdio']},
      \ 'whitelist': ['go'],
      \ })
    autocmd FileType go nnoremap <buffer> <silent> <C-]> :LspDefinition<cr>
  augroup END
endif
if executable('pyls')
  " pip install python-language-server
  augroup LspPython
    au!
    autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'pyls',
      \ 'cmd': {server_info->['pyls']},
      \ 'whitelist': ['python'],
      \ })
    autocmd FileType python nnoremap <buffer> <silent> <C-]> :LspDefinition<cr>
  augroup END
endif
if executable('typescript-language-server')
  augroup LspTypeScript
    au!
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript', 'typescript.tsx'],
        \ })
    autocmd FileType typescript setlocal omnifunc=lsp#complete
  augroup END
endif

let g:lsp_async_completion = 1

" let g:lsp_log_verbose = 0
" let g:lsp_log_file = expand('~/vim-lsp.log')


" asynccomplete ---------------------------------------------------------
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)

"let g:asyncomplete_auto_popup = 1
let g:asyncomplete_remove_duplicates = 1
let g:asyncomplete_smart_completion = 1

" let g:asyncomplete_log_file = expand('~/asyncomplete.log')


" previm ----------------------------------------------------------------
let g:previm_open_cmd = 'open -a Vivaldi'


" nerdtree --------------------------------------------------------------
nnoremap <silent><C-e> :NERDTreeToggle<CR>


" ale -------------------------------------------------------------------
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

let g:ale_open_list = 1

let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\}

let g:ale_fixers = {
\   'go': ['goimports'],
\}

autocmd FileType go let g:ale_fix_on_save = 1

let g:ale_python_flake8_options = '--ignore=E121,E123,E126,E226,E24,E402,E704,W503,W504 --max-line-length=120'
let g:ale_python_flake8_use_global = 1


