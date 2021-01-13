" map leader
let mapleader = ";"
" filetype plugin
filetype plugin indent on
" reload configs command
if !exists("*ReloadConfigs")
  function ReloadConfigs()
      :source ~/.vimrc
      if has("gui_running")
          :source ~/.vimrc
          :source ~/.gvimrc
      endif
  endfunction
  command! Recfg call ReloadConfigs()
endif
" set default dark theme
set background=dark
colorscheme default
" nocompatible
set nocompatible
" use OS clipboard
set clipboard=unnamed
" enhance command line completion
set wildmenu
" enable backspace in insert mode
set backspace=indent,eol,start
set ttyfast
" backups and swap files
set noswapfile
set nowritebackup
set nobackup
" don't add empty lines at end of new file
set binary
set noeol
" syntax highlighting
syntax on
" highlight cursor line
set nocursorline
" disable error bells
set noerrorbells
" don't reset cursor to start of line when moving
set nostartofline
" search settings
set hls
set incsearch 
set nospell
set ignorecase smartcase
" show cursor position at all times
set ruler
" line numbers
set number
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set rnu
    autocmd BufLeave,FocusLost,InsertEnter * set nornu
augroup END
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
" split behavior
set splitbelow
set splitright
" fix common vim typos
cmap Wq wq
cmap Q q
cmap W w
" fast escape in insert mode
inoremap <silent> jj <esc>:set timeoutlen=500<cr>
" scroll (keep 5 line margins)
set sidescrolloff=5
set scrolloff=3
" set mouse
set mousehide 
set mouse=a
" show filename in window titlebar
set title
" show the (partial) command as it's being typed
set showcmd
" Plugins
call plug#begin('~/.vim/plugged')
" vim-tmux integration
Plug 'christoomey/vim-tmux-navigator'
call plug#end()