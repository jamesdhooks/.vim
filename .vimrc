syntax on                       "Turn on syntax highlighting
filetype off                    "Required

" ================ Vundle ================
" Brief help :h
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

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

" Syntax highlighting
Plugin 'syntastic'

" Git wrapper
Plugin 'fugitive.vim'
" Ant
"Plugin 'Ant'
"Plugin 'mcant.vim'

call vundle#end()       
filetype plugin indent on

" =============== General ================
set nocompatible                "Be iMproved, required
set guioptions-=T		"Remove toolbar
set guioptions-=r		"Remove right hand scroll
set number			"Line numbers
set cursorline
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

" ================ Folding ================
"set foldenable    " disable folding
"set foldlevel=20
"set foldnestmax=10
"set foldmethod=indent

" open and close folds
nnoremap <space> za
nnoremap <space>o zA

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

" ================ Visual Settings ================
colorscheme molokai
colorscheme superduper
if has('win32')
    set guifont=DejaVu_Sans_Mono:h10
elseif has('mac')
    set guifont=Monaco:h12
endif

" ================ Splitting and Movement ================
" remap movement to move by column layout
nnoremap j gj
nnoremap k gk
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>q <C-w>s<C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j

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
map <Leader>u <esc>:UpdateTypesFile<cr>

" ================ Fugitive ================
map <Leader>a :call AddAndCommit()<cr>
func! AddAndCommit()
:Git add -u
:Gcommit
endfun
" ================ Compile ================
map <F5> :call CompilePackage()<CR>
map <F6> :call RunFile()<CR>
func! CompilePackage()
silent exec "w"
silent exec "!javac -sourcepath %p:h:h:h/src -d %:p:h:h:h/bin %:p:h/*.java"
silent exec "!java -cp %:p:h:h:h/bin %:p:h:t/"."%:t:r"
endfun

func! RunFile()
silent exec "w"
silent exec "!java -cp %:p:h:h:h/bin %:p:h:t/"."%:t:r"
endfun

func! CompileJava()
exec "w"
if &filetype == 'java'
exec "!javac %"
exec "!time java -cp %:p:h %:t:r"
endif
endfunc

func! CompileRunGcc()
exec "w"
if &filetype == 'c'
exec "!gcc % -o %<"
exec "!time ./%<"
elseif &filetype == 'cpp'
exec "!g++ % -o %<"
exec "!time ./%<"
elseif &filetype == 'java'
exec "!javac %"
exec "!time java -cp %:p:h %:t:r"
elseif &filetype == 'sh'
exec "!time bash %"
elseif &filetype == 'python'
exec "!time python2.7 %"
elseif &filetype == 'html'
exec "!firefox % &"
elseif &filetype == 'go'
exec "!go build %<"
exec "!time go run %"
elseif &filetype == 'mkd'
exec "!~/.vim/markdown.pl % > %.html &"
exec "!firefox %.html &"
endif
endfunc

" ================ Synastic ================
map <Leader>c <esc>:SyntasticCheck<cr>
"mark syntax errors with :signs
let g:syntastic_enable_signs=1
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
"show the error list automatically
"let g:syntastic_auto_loc_list=1
"don't care about warnings
"let g:syntastic_quiet_messages={'level': 'warnings'}

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Debug
"let g:syntastic_debug = 8
"let b:syntastic_skip_checks = 0

" Checkers
let g:syntastic_java_checkers = ['checkstyle']
let g:syntastic_java_checkstyle_classpath = '~/.vim/checkstyle-7.5-all.jar'
let g:syntastic_java_checkstyle_conf_file = '~/.vim/checks.xml'
let g:syntastic_mode_map = {'mode': 'active', 'active_filetypes':['java']}

" Colors
" SyntasticErrorSign
" SyntasticWarningSign
" SyntasticStyleErrorSigh
" SyntasticStyleWarningSign
" SyntasticErrorLine
" SyntasticWarningLine
" SyntasticStyleErrorLine
" SyntasticStyleWarningLine

"hi SyntasticErrorSign ctermfg=100 ctermbg=100 guifg=#F6437F guibg=#252929
"hi SyntasticStyleErrorSign ctermfg=100 ctermbg=100 guifg=#F6437F guibg=#252929
"hi SyntasticWarningSign ctermfg=100 ctermbg=100 guifg=#F6437F guibg=#252929
"hi SyntasticStyleWarningSign ctermfg=100 ctermbg=100 guifg=#F6437F guibg=#203345
hi SyntasticStyleWarningSign ctermfg=100 ctermbg=100 guifg=#2c96fd guibg=#203345
hi SyntasticStyleWarningLine ctermfg=100 ctermbg=100 guibg=#39382f

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
