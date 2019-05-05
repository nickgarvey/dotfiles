" A lot of this was pulled from https://github.com/amix/vimrc
" but I have cut a lot and made my own modifications
" - Nick Garvey

" execute pathogen#infect()

" Sets how many lines of history VIM has to remember
set history=700

" Pathogen (https://github.com/tpope/vim-pathogen)
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler_options = '-std=c++0x'
" Disable style warnings
let g:syntastic_python_checkers=['python']
let g:syntastic_mode_map = {'mode' : 'passive'}

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Enable syntax highlighting
syntax enable 

" Background colors
set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set wrap "Wrap lines

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Always show the status line
set laststatus=2

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %-5l\ Column:\ %c

" Remap VIM 0 to first non-blank character
map 0 ^

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Toggle paste mode (disables autoindentation)
set pastetoggle=<F2>

" Toggle character line
map <leader>l8 :set colorcolumn=80<cr>
map <leader>ll :set colorcolumn=100<cr>

" Enable omnicompletion
set omnifunc=syntaxcomplete#Complete

" Enable mouse usage if one exists
if has("mouse")
    set mouse=a
endif

" ctrl space drops to a terminal ('exit' to go back to vim)
nmap <Nul> :sh<cr>

" Show whitespace (thank you sburgess)
exec "set listchars=eol:\uB6,tab:\uBB\u2014,trail:\u2423,extends:>,precedes:<"
" sburgess: set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
nmap <leader>w :set list! list?<CR>

nmap <leader>t :set tabstop=8<cr>
nmap <leader>e :set textwidth=79<cr>

" Change autocomplete menu
highlight Pmenu ctermbg=52
highlight PmenuSel ctermbg=88

set nu

autocmd FileType php setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

set t_Co=256
colorscheme desert

autocmd BufWritePre *.py :%s/\s\+$//e

set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" have backspace actually work
set bs=indent,eol,start
