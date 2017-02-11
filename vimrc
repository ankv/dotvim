set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'sjl/gundo.vim'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'qpkorr/vim-bufkill'
Plugin 'altercation/vim-colors-solarized'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vimwiki/vimwiki'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" set no compatible with vi

" enable syntax highlighting
syntax on

" detect file type and enable loading the plugin file for specific file types
" filetype plugin on

" detect file type and enable loading the indent file for specific file types
filetype indent on

" show line numbers
set number

" enable relative numbering
set relativenumber

" show a visual line under the cursor's current line
" set cursorline

" setting how much column should be displayed for a tab. this only affect how
" existing text displays
set tabstop=2

" to control how many columns text is indented with the reindent operations (
" << and >> ) and automatic c-style indentation
set shiftwidth=2

" to control how many columns vim uses when you hit Tab in insert mode.
set softtabstop=2

" when set hitting tab in insert mode will produce the appropriate number of
" spaces
set expandtab

" always set autoindenting on
set autoindent

" wrap text after 80 chars
" set textwidth=80

" can edit or open new file if current buffer is not saved
" current buffer will get hide
set hidden

" smartsearch on override by \c \C
set smartcase

" highlight search terms
set hlsearch

" show search matches as you type
set incsearch

" delete with delete key mac
set backspace=indent,eol,start

" give us nice EOL ( end of line ) characters
" set listchars=eol:?�
" set list

" mapping leader key
let mapleader = ","

" mapping window switching keys with Ctrl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Invoke Ctrl-p with c-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Automatically update a file if it is changed externally
set autoread

" height of command bar
set cmdheight=1

" always show current position
set ruler

" backup, swap files
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" all mapping with leader
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" display the buffer list and then you can enter desired buffer num and hit
" enter to edit that buffer
nnoremap <F4> :buffers<CR>:buffer<Space>

" switch between current and previous buffer
"nnoremap 0 <C-^>

" quickly edit/reload vimrc file
nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" redraws the screen and removes any search highlighting
nnoremap <leader><space> :let @/=""<CR><C-l>

" to toggle tagbar
nnoremap <silent> <leader>t :TagbarToggle<CR>

" toggle nerdtree
nnoremap <silent> <leader>n :NERDTreeToggle<CR>

" delete buffer without closing window
nnoremap <silent> <leader>c :BD<CR>

" toggle minibufexplore
nnoremap <silent> <leader>mbe :MBEToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" all mapping with ;
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" map :quit
nnoremap <silent> ;q :quit<CR>

" map :write
nnoremap <silent> ;w :write<CR>

" for easy help after typing ;h type the help text
nnoremap ;h :help<space>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" all mapping with alt key or meta key <M-..>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" all mapping with function keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <F5> :GundoToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ignore files in nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ignore .pyc files
let NERDTreeIgnore = ['\.pyc$']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline status line configuraiton
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" to show current branch
let g:airline#extensions#branch#enabled=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  setting solarized color for mac terminal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:solarized_termcolors = 256
"set background=dark
"colorscheme solarized


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  setting for vimwiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" heading colors
hi VimwikiHeader1 guifg=#FF0000
hi VimwikiHeader2 guifg=#00FF00
hi VimwikiHeader3 guifg=#0000FF
hi VimwikiHeader4 guifg=#FF00FF
hi VimwikiHeader5 guifg=#00FFFF
hi VimwikiHeader6 guifg=#FFFF00
