syntax enable
colorscheme monokai

" Plugins {{{
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'stephpy/vim-php-cs-fixer'
" Plug 'vim-syntastic/syntastic'
Plug 'dense-analysis/ale'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()
" }}}
" General Set commands {{{
" --------------------------------------------------

set nocompatible        " don't bother with vi compatibility
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set updatetime=100
set number
set signcolumn=yes


" Folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level
" space open/closes folds
nnoremap <space> za
" }}}
" General maps {{{
" --------------------------------------------------

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>	

" edit vimrc and load vimrc bindings
nnoremap <leader>ev :sp $MYVIMRC<CR>
nnoremap <leader>rv :source $MYVIMRC<CR>

" save session, restore with mvim -S
nnoremap <leader>s :mksession<CR>


map <D-0> :only<CR>
" }}}
" Macvim settings {{{
" --------------------------------------------------

if has("gui_macvim")
    let macvim_hig_shift_movement = 1
endif
" }}}
" CtrlP {{{
" --------------------------------------------------
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
map <D-p> :CtrlP<CR>
map <D-P> :CtrlPBuffer<CR>

if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
  " open ack.vim
  nnoremap <leader>a :Ack 
endif
" }}}
" NERDTree {{{
" --------------------------------------------------

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


map <D-9> :NERDTreeToggle<CR>
" }}}
" PHP Setup {{{
" --------------------------------------------------

" It will generate the tags each time you save a PHP file.
au BufWritePost *.php silent! !eval '[ -f ".git/hooks/ctags" ] && .git/hooks/ctags' &


let g:php_cs_fixer_config_file = '.php_cs'
let g:php_cs_fixer_path = "./vendor/bin/php-cs-fixer"
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile() " fix on save


" }}}
" GitGutter {{{
" --------------------------------------------------
let g:gitgutter_sign_column_always = 1
let g:gitgutter_highlight_linenrs = 1
" }}}

" vim-syntastic/syntastic options
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php', 'phpstan']


let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
\   'php': ['php'],
\}
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1






" vim:foldmethod=marker:foldlevel=0
