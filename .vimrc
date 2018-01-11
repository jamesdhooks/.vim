syntax on                       "Turn on syntax highlighting
set encoding=utf-8
scriptencoding utf-8
set noshowmode

" ================ Vundle ================
" Brief help :h
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" colorschemes
Plugin 'Solarized'
Plugin 'molokai'
Plugin 'h80'

" file explorer
Plugin 'scrooloose/nerdtree'

" Better commenting
Plugin 'scrooloose/nerdcommenter'

" Tag Highlight
Plugin 'TagHighlight'

" Syntax highlighting
Plugin 'syntastic'

" Git wrapper
Plugin 'fugitive.vim'

" Airline status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"Plugin 'Rainbow-Parenthesis'
Plugin 'rainbow_parentheses.vim'

"Auto-Pairs
"Plugin 'Auto-Pairs'
Plugin 'jiangmiao/auto-pairs'

if has('win32') || has('mac')
    " Easy Color
    Plugin 'EasyColour'
    "You complete me
    Plugin 'Valloric/YouCompleteMe'

    "Omni & dispath
    Plugin 'OmniSharp/omnisharp-vim'
    Plugin 'tpope/vim-dispatch.git'
endif

" Fullscreen
Plugin 'gvimfullscreen_win32'

" Tabbar
"Plugin 'Tabbar'
Plugin 'drmingdrmer/vim-tabbar'

call vundle#end()
filetype plugin indent on

" =============== General ================
set nocompatible                "Be iMproved, required
set guioptions-=T		"Remove toolbar
set guioptions-=m   "Remove menubar
set guioptions-=r		"Remove right hand scroll
set guioptions-=L
set number			"Line numbers
set cursorline
set backspace=indent,eol,start	"Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down at the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set t_vb=                       "No flash
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
if has('win32') || has('mac')
    set shiftwidth=4
    set softtabstop=4
    set tabstop=4
else
    set shiftwidth=4
    set softtabstop=4
    set tabstop=4
endif
set expandtab

" Display tabs and trailing spaces visually
"set list listchars=tab:\ \ ,trail:ÃÂ·
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
"colorscheme superduper
if has('win32') || has('mac')
    colorscheme simpleduper
else
    colorscheme molokai
endif

if has('win32')
    set guifont=DejaVu\ Sans\ Mono\ for\ PowerLine:h10
    au GUIEnter * simalt ~x
elseif has('mac')
    set guifont=DejaVu_Sans_Mono_for_Powerline:h12
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

" ================ Directory ================
set autochdir

" ================ Python ================
nnoremap <F9> :!python -B %<cr>
nnoremap <leader>5 :!python3 %:t <cr>

" ================ Whitespace ================
" Strips whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>g <esc>gg=G``<cr>

" ================ Nerd Tree ================
" Open Nerd Tree with <Leader>n
map <Leader>n <esc>:NERDTreeToggle<cr>
" Reveal current file in NERDTree with <Leader>r
map <Leader>r <esc>:NERDTreeFind<cr>
" Open bookmark to class projects
map <Leader>o <esc>:NERDTreeFromBookmark School<cr>
" Open bookmark to Vim settings
map <Leader>v <esc>:NERDTreeFromBookmark Vim<cr>
" Open bookmark to Hood project
map <Leader>h <esc>:NERDTreeFromBookmark Hood<cr>

let NERDTreeIgnore=['\.meta$']

hi Directory guifg=CadetBlue4

" ================ Tag Highlight ===============
map <Leader>u <esc>:UpdateTypesFile<cr>

" ================ Fugitive ================
map <Leader>s <esc>:Gstatus<cr>
map <Leader>a <esc>:Git add -u<cr>:Gcommit<cr>
map <Leader>p <esc>:Git push<cr>

" ================ FullScreen ================
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

" ================ Auto Pairs ================
"let g:AutoPairsShortcutFastWrap='<Leader-E>'

" ================ Rainbow ================
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" ================ Tab bar ================
hi TabLineFill guifg=gray22 guibg=grey
hi TabLine     guifg=gray90 guibg=SteelBlue4
hi TabLineSel  guifg=gray90 guibg=PaleTurquoise4
"hi TabLineSel  guifg=gray90 guibg=CadetBlue4

" ================ Airline ================
"let g:airline#extensions#tabline#enabled = 1

let g:airline_powerline_fonts=1
let g:airline_theme = 'raven'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" ================ Synastic ================
map <Leader>c <esc>:SyntasticCheck<cr>
"mark syntax errors with :signs
let g:syntastic_enable_signs=0
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
"show the error list automatically
"let g:syntastic_auto_loc_list=1
"don't care about warnings
let g:syntastic_quiet_messages={'level': 'warnings'}
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_debug = 8
"let b:syntastic_skip_checks = 0

" Checkers
let g:syntastic_python_checker_args = '--ignore=E225'
let g:syntastic_java_checkers = ['checkstyle', 'javac']
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

hi SyntasticStyleWarningSign ctermfg=100 ctermbg=100 guifg=#2c96fd guibg=#203345
hi SyntasticStyleWarningLine ctermfg=100 ctermbg=100 guibg=#39382f

" ================ You Complete Me ================
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_min_num_identifier_candidate_chars = 3
" Completion comes with . or <C-Space> "let g:ycm_auto_trigger = 0
"let g:ycm_filetype_whitelist = {'csharp':1, 'python':1, 'cpp':1}

" ====== Make tabs be addressable via Apple+1 or 2 or 3, etc
" Use numbers to pick the tab you want (like iTerm)
map <silent> <C-1> 1gt<cr>
map <silent> <C-2> 2gt<cr>
map <silent> <C-3> :tabn 3<cr>
map <silent> <C-4> :tabn 4<cr>
map <silent> <C-5> :tabn 5<cr>
map <silent> <C-6> :tabn 6<cr>
map <silent> <C-7> :tabn 7<cr>
map <silent> <C-8> :tabn 8<cr>
map <silent> <C-9> :tabn 9<cr>

map <silent> <C-t> :tabnew<cr>

" CTRL-Tab is next tab
noremap <C-Tab> :<C-U>tabnext<CR>
inoremap <C-Tab> <C-\><C-N>:tabnext<CR>
cnoremap <C-Tab> <C-C>:tabnext<CR>
" CTRL-SHIFT-Tab is previous tab
noremap <C-S-Tab> :<C-U>tabprevious<CR>
inoremap <C-S-Tab> <C-\><C-N>:tabprevious<CR>
cnoremap <C-S-Tab> <C-C>:tabprevious<CR>

" ================ Java Compile ================
map <F5> :call SilentCompilePackage()<CR>
map <F6> :call CompilePackage()<CR>

func! SilentCompilePackage()
    silent exec "w"
    silent exec "!javac -sourcepath %p:h:h:h/src -d %:p:h:h:h/bin %:p:h/*.java"
    silent exec "!java -cp %:p:h:h:h/bin %:p:h:t/"."%:t:r"
endfunc

func! CompilePackage()
    exec "w"
    exec "!javac -sourcepath %p:h:h:h/src -d %:p:h:h:h/bin %:p:h/*.java"
    exec "!java -cp %:p:h:h:h/bin %:p:h:t/"."%:t:r"
endfunc

func! RunFile()
    silent exec "w"
    silent exec "!java -cp %:p:h:h:h/bin %:p:h:t/"."%:t:r"
endfunc

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
