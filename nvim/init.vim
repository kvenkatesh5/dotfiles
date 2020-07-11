" map leader
let mapleader = ";"

call plug#begin('~/.config/nvim/plugins') " base16 color schemes
"Plug 'chriskempson/base16-vim'
" colorschemes
Plug 'flazz/vim-colorschemes'
" file management (see hotkey for toggle)
Plug 'scrooloose/nerdtree' 
" tmux integration
Plug 'christoomey/vim-tmux-navigator' 
" Auto close parens, braces, brackets, etc
Plug 'jiangmiao/auto-pairs'
" Convenience for commenting things in and out
Plug 'scrooloose/nerdcommenter'
" Initialize plugin system
call plug#end()

" colorscheme
autocmd BufEnter * colorscheme gruvbox
autocmd BufEnter *.py colorscheme Tomorrow-Night
autocmd BufEnter *.cpp colorscheme cobalt
autocmd BufEnter *.txt colorscheme cobalt


" number
set number

" highlight the line the cursor is on
set cursorline

" search settings
set incsearch hlsearch
"nnoremap <space> :noh<cr>
"set hlsearch!
"nnoremap <C-f> :set hlsearch!<CR>
set ignorecase smartcase

" show cursor position at all times
set ruler

" allow (normal) backspacing over everything
set backspace=indent,eol,start

" tab settings
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" auto indentation
set autoindent

" fold method
"set foldmethod=indent
"set foldlevel=99
"nnoremap <space> za


" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" share clipboard with macOS
set clipboard=unnamed

" split behavior
set splitbelow
set splitright

" fix common vim typos
cmap Wq wq
cmap Q q
cmap W w

" fast escape
inoremap <silent> jj <esc>:set timeoutlen=500<cr>
vnoremap <silent> jj <esc>:set timeoutlen=500<cr>

" scroll (keep 5 line margins)
set sidescrolloff=5
set scrolloff=5

" I don't like the mouse in vim (alternate is 'set mouse=a')
set mousehide 
set mouse=

" column limits
set textwidth=100

" toggle NerdTree (using leader + n, alternate choice is leader + a)
nnoremap <leader>n :NERDTreeToggle<cr>
" close vim if the last window is NerdTree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" c++ makeprg and compile/run configs (made for competititve programming purposes)
autocmd FileType cpp set makeprg=g++\ -std=c++17\ -O2
function! CompileAndRunWithInput()
    write
    silent! make %
    redraw!
    cwindow
    if len(getqflist()) == 0
        exec '!time ./a.out < inputf.txt'
    endif
endfunction
nnoremap<F5> :call CompileAndRunWithInput()<CR>


function! CompileAndRunWithInputOuput()
    write
    silent! make %
    redraw!
    cwindow
    if len(getqflist()) == 0
        exec '!time ./a.out < inputf.txt > outputf.txt'
    endif
endfunction
nnoremap<F6> :call CompileAndRunWithInputOutput()<CR>

" java makeprg and compile/run configs
autocmd FileType java set makeprg=javac\ %
autocmd FileType java set errorformat=%A:%f:%l:\ %m,%-Z%p^,%-C%.%#
function! CompileJava()
    write
    silent! make
endfunction
nnoremap<F7> :call CompileJava()<CR>
