source ~/.vim/bundle/vim-plug/plug.vim
call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/a.vim'
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'zhaocai/GoldenView.Vim'
Plug 'Yggdroot/indentLine'
Plug 'Shougo/neocomplete.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 't9md/vim-choosewin'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-scriptease'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'wesQ3/vim-windowswap'
Plug 'SirVer/ultisnips'
Plug 'edkolev/tmuxline.vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }
Plug 'arcticicestudio/nord-vim'

" Langs
Plug 'Rip-Rip/clang_complete'
Plug 'klen/python-mode'
Plug 'davidhalter/jedi-vim'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'elzr/vim-json', {'for' : 'json'}

call plug#end()


" General
set nocompatible
syntax on
" filetype off
filetype plugin indent on

set ttyfast
set ttymouse=xterm2
set ttyscroll=3

set laststatus=2
set encoding=utf-8
set fileencodings=utf-8
set autoread
set autowrite
set smartindent
set autoindent
set cindent
set expandtab
set smarttab
set shiftwidth=2
set hlsearch
set incsearch
set backspace=indent,eol,start

set noerrorbells
set number
set showcmd
set linebreak
set splitright
set splitbelow
set hidden
set fileformats=unix,dos,mac
set smartcase
set ignorecase
set nobackup
set noswapfile
set noshowmatch
set noshowmode
set nocursorcolumn
set nocursorline

set lazyredraw
set softtabstop=2
set tabstop=2
set shiftround
set shiftwidth=2
set pumheight=10
set wildignore=*.pyc,*.o
set completeopt-=preview

if $TMUX == ''
    set clipboard+=unnamed
endif

if has('mouse')
  set mouse=a
endif

syntax enable
set t_Co=256
let g:rehash256=1
set background=dark
colorscheme nord

" Choosewin
nmap = <Plug>(choosewin)

" Tagbar
map <Leader>t :TagbarToggle<CR>

" Keep the cursor in the same place after yank
vmap y ygv<Esc>

" Jump to start and end of line using the home row keys
nnoremap H 0
nnoremap L $

" Easier redo
nnoremap U <C-r>

" NERDTree tabs toggle
nmap <leader>] :NERDTreeToggle<CR>

" Find files
nnoremap `f :find<Space>

" Fast saving
nmap <leader>w :w!<cr>

" Center the screen
nnoremap <space> zz

" Do not show stupid q: window
map q: :q

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <F5> :source $MYVIMRC<CR>

" Window navigation
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h

" Split window vertically-horizontally
nmap <leader>v <C-w>v<C-w>l
nmap <leader>s <C-w>s<C-w>j

" Navigate buffers
nnoremap <silent> 'b :ls<CR>
nnoremap <silent> <leader>b :bd<CR>

" New Tab
nmap <Leader>n :tabnew<CR>

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Tab selection
nmap <leader>0 <Plug>AirlineSelectPrevTab
nmap <leader>- <Plug>AirlineSelectNextTab

" Split Swap
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>

" open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

" File Type Settings
au BufNewFile,BufRead *.vim setlocal noet ts=2 sw=2 sts=2
au BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
au BufNewFile,BufRead *.md setlocal noet ts=4 sw=4
autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2

augroup filetypedetect
  au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
augroup END

" Paste mode toggle
set pastetoggle=<F2>

" Plugin Settings
let g:windowswap_map_keys = 0 "prevent default bindings
let g:goldenview__enable_default_mapping = 0
let g:vim_json_syntax_conceal = 0
let g:acp_enableAtStartup = 0
let g:indentLine_conceallevel = 2

" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#auto_completion_start_length = 3
let g:neocomplete#enable_camel_case_completion = 1

if !exists('g:neocomplete#sources')
    let g:neocomplete#sources = {}
endif

let g:neocomplete#sources._ = ['buffer', 'member', 'tag', 'file', 'dictionary']
let g:neocomplete#sources.go = ['omni']

" disable sorting
call neocomplete#custom#source('_', 'sorters', [])

" Airline
let g:airline_theme = 'nord'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:tmuxline_powerline_separators = 0
set laststatus=2
set t_Co=256

function! AirlineInit()
  let g:airline_section_y = airline#section#create(['ffenc', ''])
endfunction
autocmd VimEnter * call AirlineInit()

" NERDTree
let g:NERDTreeMapChangeRoot="`"
let NERDTreeMinimalUI=1
let g:NERDTreeWinPos = "right"

" Prettier
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#tab_width = 2

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Clang
let s:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
if isdirectory(s:clang_library_path)
    let g:clang_library_path=s:clang_library_path
endif

" CtrlP
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 10
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_mruf_max=450
let g:ctrlp_max_files=0
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_match_window = 'bottom,order:btt,min:10,max:10,results:10'

let g:ctrlp_buftag_types = {
      \ 'markdown'   : '--language-force=markdown --markdown-types=hik',
      \ }

" delimitMate
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'

