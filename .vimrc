if has('vim_starting')
	set nocompatible               " Be iMproved
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }

NeoBundle 'Yggdroot/indentLine'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'bling/vim-airline'
NeoBundle 't9md/vim-choosewin'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-session'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'tpope/vim-surround'

" NeoBundle 'zhaocai/GoldenView.Vim' "Always have a nice view for vim split windows

filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck
" let g:zenesque_colors=1
" colorscheme zenesque
" colorscheme telstar
" colorscheme up
colorscheme blacklight

" Numbers and Borders`
set number
set guioptions-=L
set guioptions-=r

"kill bell
set noerrorbells
set visualbell
set t_vb=
 
"stop shitting swps
set noswapfile
set nobackup
set nowritebackup

"easy align lynns:
vnoremap <silent> <Enter> :EasyAlign<Enter>

" Start interactive EasyAlign in visual mode
" vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign with a Vim movement
" nmap <Leader>a <Plug>(EasyAlign)

" stop undo files
set undofile
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

"Lynn Settings
let mapleader = ","

" hilight indention tabs
hi NonText ctermfg=darkgrey guifg=#565656
hi clear SpecialKey
hi link SpecialKey NonText
 
let g:indentLine_color_term=238
let g:indentLine_color_gui='#565656'
let g:indentLine_char='•'
 
set encoding=utf-8
set modeline                   " i don't even know
set modelines=5
set noshowmode                   " indicate insert, replace, visual
set showcmd                    " show info about current operation in status line
set hidden                     " keep buffers hidden when abandoned (don't unload them)
set ttyfast                    " indicate fast terminal connection, helps with mouse + redraw stuff
set ruler                      " show line + column number of cursor
set backspace=indent,eol,start
set laststatus=2               " always show status lines, even in non-focused splits
set history=1000
set undofile                   " store undo history in fs
set undoreload=10000
set cpoptions+=J               " sentence has to be followed by two spaces after . ! ?
set lazyredraw                 " don't redraw while using macros, registers, etc.
set matchtime=3                " duration of parens hilight in 1/10 seconds
set showbreak=↪                " string to put at start of lines that have been wrapped
set splitbelow                 " spltting a window will put the new window below the current one
set splitright                 " same as above but for horizontal splits
                               " set fillchars=diff:⣿
 
set nottimeout "these two options together determine whether to wait to receive mapping
set timeout
 
set autowrite         " write the contents of the file on each :next, :rewind, :make, etc.
set shiftround        " round indent to multiple of shiftwidth
set autoread          " automatically read changes in files from outside of vim (git pull, etc.)
set title             " set the window title to something meaningful
set nu                " show line numbers
set ignorecase
set smartcase         " override ignorecase if search pattern contains upper case letters
set incsearch         " hilight all search matches
set showmatch         " briefly jump to matching brackets on insert
set hlsearch          " hilight search results
set gdefault          " all regex matches are substituted by default. g toggles this behavior
set scrolloff=3       " minimum number of screen lines to keep above and below the cursor
set sidescroll=1      " minimum number of columns to scroll horizontaly
set sidescrolloff=10  " minimum number of screen lines to keep left and right of the cursor
set linebreak         " wrap lines at convenient points
 
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮
 
"use system clipboard
set clipboard=unnamed
 
if has("gui")
  set macmeta "use option (alt) as meta key
endif
 
 
"Make Vim able to edit crontab files again.
set backupskip=/tmp/*,/private/tmp/*
 
"Save when losing focus
"au FocusLost * :wa
 
" Tabs, spaces, wrapping {{{
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set wrap
"set textwidth=80
set formatoptions=qrn1
"set colorcolumn=+1
"}}}
 
"folding settings {{{
if v:version >= 600
  set nofoldenable
  set foldmethod=marker   "fold based on indent
  set printoptions=paper:letter
  set sidescrolloff=5
  set mouse=nvi
endif
"}}}
 
" Wildmenu completion {{{
 
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
 
" }}}

let g:session_autosave = 'no'
 
"Python/Django
set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code
 
"git
set wildignore=*.o,*.obj,.git,*.pyc,*~,fugitive*
 
"make <leader>l clear the highlight as well as redraw
nnoremap <leader>l :nohls<CR><C-L>
inoremap <leader>l <C-O>:nohls<CR> 

"Clojure/Leiningen
set wildignore+=classes
set wildignore+=lib

"NERDTree
nmap <silent> <C-a> :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index', 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json', '.*\.o$', 'db.db']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Choosewin
nmap  -  <Plug>(choosewin)
let g:choosewin_overlay_enable=1

" Unite
let g:unite_source_history_yank_enable=1
let g:unite_source_file_rec_max_cache_files=0
call unite#custom#source('file_mru,file_rec,file_rec/async,grepocate',
            \ 'max_candidates', 0)
call unite#custom#source('file_mru,file_rec,file_rec/async,grepocate',
            \ 'ignore_pattern',
            \ '\%(^\|/\)\.$\|\~$\|\.\%(o\|exe\|dll\|bak\|DS_Store\|zwc\|pyc\|sw[po]\|class\)$'.
            \ '\|\%(^\|/\)\%(\.hg\|\.git\|\.bzr\|\.svn\|\.sass-cache\|bower_components\|node_modules\|.tmp\|tags\%(-.*\)\?\)\%($\|/\)')

let g:unite_source_rec_async_command='ag --nocolor --nogroup --ignore ".hg" --ignore ".svn" --ignore ".git" --ignore ".bzr" --hidden -g ""'

"use ag for search
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
 
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>t :Unite -no-split -buffer-name=files -start-insert file_rec/async:!<cr>
nnoremap <leader>f :Unite -no-split -buffer-name=files -start-insert file<cr>
nnoremap <leader>r :Unite -no-split -buffer-name=mru -start-insert file_mru<cr>
nnoremap <leader>o :Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :Unite -no-split -buffer-name=yank history/yank<cr>
nnoremap <leader>b :Unite -no-split -buffer-name=buffer -start-insert buffer<cr>
nnoremap <leader>/ :Unite -no-quit -keep-focus grep:.<cr>
nnoremap <leader>s :Unite -quick-match buffer<cr>
 
" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

"for better split navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
set noea


