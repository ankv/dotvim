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
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'qpkorr/vim-bufkill'
Plugin 'altercation/vim-colors-solarized'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'suan/vim-instant-markdown'
Plugin 'szw/vim-maximizer'
Plugin 'tpope/vim-surround'
Plugin 'tomlion/vim-solidity'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-unimpaired'
" this plugin is required by vim-session
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'


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
filetype plugin on

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

" wrap long lines with indentation
set breakindent
set showbreak=\\\\\

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

" to display status line always
set laststatus=2

" give us nice EOL ( end of line ) characters
" set listchars=eol:?�
" set list

" mapping leader key apart from "\" key
" let mapleader = ","

" mapping window switching keys with Ctrl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Invoke Ctrl-p with c-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Automatically update a file if it is changed externally
" More advanced setup at bottom
" set autoread

" height of command bar
set cmdheight=1

" always show current position
set ruler

" backup, swap files
set nobackup
set nowb
set noswapfile

" absolute number when in insert mode otherwise relative numbering
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" toggle relative numbering with <C-n>
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" all mapping with leader
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" display the buffer list and then you can enter desired buffer num and hit
" enter to edit that buffer
" nnoremap <F4> :buffers<CR>:buffer<Space>

" quickly edit/reload vimrc file
nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" redraws the screen and removes any search highlighting
nnoremap <leader><space> :let @/=""<CR><C-l>

" to toggle tagbar
nnoremap <silent> <leader>t :TagbarToggle<CR>

" delete buffer without closing window
nnoremap <silent> <leader>c :BD<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" all mapping with <leader>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" map :quit
nnoremap <silent> <leader>q :quit<CR>

" map :write
nnoremap <silent> <leader>w :write<CR>

" for easy help after typing ;h type the help text
" nnoremap <silent> <leader>h :help<space>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" all mapping with alt key or meta key <M-..>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" all mapping with function keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <F5> :GundoToggle<CR>

" open file:line_no under cursor in new window
" nnoremap <F8> <C-w>F<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable simple form of dot repetition over visual line selections. Start from
" begining of line
xnoremap . :norm.<CR>

" Typing Q with a visual line selectio in effect will execute the q macro over
" just the selected lines
xnoremap Q :'<,'>:normal @q<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" In General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat all numerals as decimal
set nrformats=

" Autosave and Autoread
" Autosave will automatically save to disk the currently edited buffer upon
" leaving insert mode as well as after a text edit has occurred
" Autoread will automatically update an open buffer if it has been changed
" outside the current edit session, usually by an external program

set autoread
augroup autoSaveAndRead
  autocmd!
  autocmd TextChanged,InsertLeave,FocusLost * silent! wall
  autocmd CursorHold * silent! checktime
augroup END

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
" settings for vim-sessions plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:session_autosave = 'no'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Syntastic Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
