" map leader
let mapleader = ";"

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if !exists("*ReloadConfigs")
  function ReloadConfigs()
      :source ~/.vimrc
      if has("gui_running")
          :source ~/.gvimrc
      endif
  endfunction
  command! Recfg call ReloadConfigs()
endif


call plug#begin() " colorschemes
Plug 'flazz/vim-colorschemes'
call plug#end()

set termguicolors

" search settings
set hls
set incsearch 
set nospell
set ignorecase smartcase

"" backups and swap files
set noswapfile
set nowritebackup
set nobackup

" show cursor position at all times
set ruler

" number
set number
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set rnu
    autocmd BufLeave,FocusLost,InsertEnter * set nornu
augroup END

" allow (normal) backspacing over everything
set backspace=indent,eol,start

" tab settings
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" auto indentation
set autoindent

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
set scrolloff=3

" set mouse
set mousehide 
set mouse=a

" brackets
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}

" cd into competitive programming workspace
cd ~/wkspace/src/

" c++ compilation and run
autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++14 % -Wshadow -Wall -o %:r<CR>
autocmd filetype cpp nnoremap <F10> :!%:r<CR>
autocmd filetype cpp nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $


