" map leader
let mapleader = ";" 
call plug#begin('~/.config/nvim/plugins')
Plug 'scrooloose/nerdtree' " file management
Plug 'vim-airline/vim-airline' " status bar
Plug 'christoomey/vim-tmux-navigator' " tmux integration
" Auto close parens, braces, brackets, etc
Plug 'jiangmiao/auto-pairs'
" Convenience for commenting things in and out
Plug 'scrooloose/nerdcommenter'
" deus colorscheme
Plug 'ajmwagar/vim-deus' 
" LSP + autocomplete

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

" tab settings
set shiftwidth=4
set tabstop=4
set softtabstop=0
set expandtab
"set smarttab

" Automatic indentation is good
set autoindent

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" share clipboard w macOS
set clipboard=unnamed

" split behavior
set splitbelow
set splitright 

" fix my common vim typos
cmap Wq wq
cmap Q q
cmap W w

" fast escape
inoremap <silent> jk <esc>:set timeoutlen=500<cr>
vnoremap <silent> jk <esc>:set timeoutlen=500<cr>

" Scroll (keep 3 line margins)
set sidescrolloff=3
set scrolloff=3

" For now, I don't like the mouse in vim (alternate is 'set mouse=a')
set mousehide 
set mouse=

" Colorscheme
colorscheme deus

" Column limits
set textwidth=110

" Zoom vim pane (leader - and leader =)
" Ctrl-w = rebalances
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" python3 (use system)
let g:python3_host_prog = '/usr/local/bin/python3'

" toggle NerdTree (using leader + n, alternate choice is leader + a)
nnoremap <leader>n :NERDTreeToggle<cr>
" close vim if the last window is NerdTree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" LSP + autocomplete
" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()
" set completeopt=noinsert,menuone,noselect

" Wkspace read off template
autocmd BufNewFile ~/wkspace/*.cpp 0r ~/wkspace/template.cpp
"c++ makeprg
autocmd FileType c         set makeprg=gcc\ -Wall\ -O2
autocmd FileType cpp       set makeprg=g++\ -std=c++11\ -Wall\ -O2
autocmd FileType python    set makeprg=python3

" Save, compile and run files
function! CompileAndRun()
  write
  silent! make %
  redraw!
  cwindow
  if len(getqflist()) == 0
    exec '!time ./a.out'
  endif
  if !empty(glob('a.out'))
      exec '!rm ./a.out'
  endif
endfunction
nnoremap <leader>b :call CompileAndRun()<CR>
