" ================ General Configuration ================ 
syntax on                       "Turn on syntax highlighting
filetype off                    "Required

set nocompatible                "Be iMproved, required
set guioptions-=T		"Remove toolbar
set guioptions-=r		"Remove right hand scroll
set number			"Line numbers
set backspace=indent,eol,start	"Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down at the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

" ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Display tabs and trailing spaces visually
"set list listchars=tab:\ \ ,trail:Â·
set wrap       "Wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Completion =======================
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=.gem
set wildignore+=*.DAT
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Vundle ================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" colorschemes
Plugin 'Solarized'
Plugin 'molokai'
Plugin 'h80'

" file explorer
Plugin 'nerdtree'

" Easy Color
Plugin 'EasyColour'
" Tag Highlight
Plugin 'TagHighlight'

" Checkstyle
"Plugin 'java_checkstyle.vim'

" syntax highlighting
Plugin 'syntastic'

" coffee script
"Plugin 'vim-coffee-script'
"Plugin 'coffee.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ================ Visual Settings ================
"colorscheme molokai
"colorscheme superduper
if has('win32')
    set guifont=DejaVu_Sans_Mono:h10
elseif has('mac')
    set guifont=Monaco:h12
endif

" ================ Nerd Tree ================
" Open Nerd Tree with <Leader>n
map <Leader>n <esc>:NERDTreeToggle<cr>
" Reveal current file in NERDTree with <Leader>r
map <Leader>r <esc>:NERDTreeFind<cr>
" Open bookmark to class projects
map <Leader>o <esc>:NERDTreeFromBookmark 207<cr>
" Open bookmark to Vim settings
map <Leader>v <esc>:NERDTreeFromBookmark Vim<cr>

" ================ Tag Highlight ===============
" UpdateFileTypes
map <Leader>u <esc>:UpdateTypesFile<cr>

" ================ Coffee Script ================
" Compile the current file into a vertcally split screen
"map <Leader>cs <esc>:CoffeeCompile vert<cr>

" ================ Synastic ================
"mark syntax errors with :signs
let g:syntastic_enable_signs=1
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
"show the error list automatically
let g:syntastic_auto_loc_list=1
"don't care about warnings
let g:syntastic_quiet_messages={'level': 'warnings'}

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let b:syntastic_skip_checks = 0
"let g:syntastic_debug = 8

" Checkers
let g:syntastic_java_checkers = ['checkstyle']
let g:syntastic_java_checkstyle_classpath = '~/.vim/checkstyle-7.5-all.jar'
let g:syntastic_java_checkstyle_conf_file = '~/.vim/checks.xml'
let g:syntastic_mode_map = {'mode': 'active', 'active_filetypes':['java']}


"let g:syntastic_java_javac_classpath='/Users/jameshooks/Dropbox/School/csc207/hooksjam*'
"let g:syntastic_java_javac_classpath = 'C:\Users\LABIMD05\workspace\szz_lib\*;C:\Users\LABIMD05\workspace\backhoe-nomvn2\bin\classes'
"let g:syntastic_java_javac_delete_output = 0
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'passive_filetypes': ['java']}

" ================ Java Complete ================
autocmd FileType java setlocal omnifunc=javacomplete#Complete
" ====== Make tabs be addressable via Apple+1 or 2 or 3, etc
" Use numbers to pick the tab you want (like iTerm)
map <silent> <D-1> :tabn 1<cr>
map <silent> <D-2> :tabn 2<cr>
map <silent> <D-3> :tabn 3<cr>
map <silent> <D-4> :tabn 4<cr>
map <silent> <D-5> :tabn 5<cr>
map <silent> <D-6> :tabn 6<cr>
map <silent> <D-7> :tabn 7<cr>
map <silent> <D-8> :tabn 8<cr>
map <silent> <D-9> :tabn 9<cr>
