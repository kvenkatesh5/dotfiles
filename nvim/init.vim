" map leader
let mapleader = ";"

call plug#begin('~/.config/nvim/plugins')
Plug 'scrooloose/nerdtree' " file management

" Initialize plugin system
call plug#end()

" number
set number

" highlight the line the cursor is on.
set cursorline

" show cursor position at all times
set ruler

" allow (normal) backspacing over everything in insert mode
set backspace=indent,eol,start

" share clipboard w macOS
set clipboard=unnamed

" split behavior
set splitbelow
set splitright

" fix my common vim typos
cmap Wq wq
cmap Q q

" fast escape
inoremap <silent> jk <esc>:set timeoutlen=500<cr>
vnoremap <silent> jk <esc>:set timeoutlen=500<cr>

" toggle NerdTree
nnoremap <leader>a :NERDTreeToggle<cr>
" close vim if the last window is NerdTree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
