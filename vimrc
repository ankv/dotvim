" Vundle Plugin Settings ------------------------------------{{{
set nocompatible              " be iMproved, required
filetype off " Require for Vundle functioning
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-surround'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-unimpaired'
" this plugin is required by vim-session
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-vinegar'
Plugin 'posva/vim-vue'

" All of your Plugins must be added before the following line
call vundle#end()            " required

"}}}

" Vim General Settings ---------------------------------------------------{{{

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

" ignore case while searching
set ignorecase

" highlight search terms
set hlsearch

" show search matches as you type
set incsearch

" Fix backspace key to delete in insert mode
set backspace=2

" to display status line always
set laststatus=2

" give us nice EOL ( end of line ) characters
" set listchars=eol:?�
" set list

" mapping leader key apart from "\" key
let mapleader = ","

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

" Treat all numerals as decimal
set nrformats=

" absolute number when in insert mode otherwise relative numbering
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" setting list
set listchars=eol:¬
set list

"}}}

" solarzied colorscheme settings {{{
colorscheme solarized
set background=dark
set guifont=Monospace,Monaco:h12
"}}}

" Ctrl-p Plugin Settings ----{{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"}}}

" Airline Plugin Settings ----------------------{{{

" to show current branch
let g:airline#extensions#branch#enabled=1

"}}}

" Vim-Session Plugin Settings -------------------{{{
let g:session_autosave = 'no'
let g:session_autoload = 'no'
"}}}

" Netrw Settings ------------------------{{{

" netrw will save no history or bookmarks
let g:netrw_dirhistmax = 0

"}}}

" Syntastic Plugin Settings ------------------{{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"}}}

" Mappings ----------------------------------------------------------------{{{

" mapping to generate tags
" for python projects
nnoremap <leader>tp :!ctags -R --fields=+l --languages=python --python-kinds=-iv -f ./tags ./<CR>

" mapping window switching keys with Ctrl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" toggle relative numbering with <leader>n
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <leader>n :call NumberToggle()<cr>

" quickly edit/reload vimrc file
nnoremap <leader>ev :tabnew $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC <bar> AirlineRefresh<CR>

" removes any search highlighting
nnoremap <silent> <space> :nohl<CR>:redraw!<CR>

" open file:line_no under cursor in new window
" nnoremap <F8> <C-w>F<CR>

" map :quit
nnoremap <silent> <leader>q :quit<CR>
nnoremap <silent> <leader>Q :quit!<CR>

" map :quitall
nnoremap <silent> <leader>E :qall!<CR>

" map :only
nnoremap <silent> <leader>o :only<CR>

" map window split
nnoremap <silent> <leader>ss <C-w>v
nnoremap <silent> <leader>sh <C-w>s

" map :write
nnoremap <silent> <leader>w :write<CR>

" switch to normal mode by pressing jk while in insert mode
inoremap jk <ESC>

" load previous buffer
nnoremap <leader>l :b#<CR>

" laod competitive programming template
nnoremap <leader>cpt :-1read $HOME/.vim/.template_cp.cpp<CR>/main()<CR>:nohl<CR>o

" press <C-u> in insert mode to convert current word into caps
inoremap <C-u> <Esc>viwgUea

" Enable simple form of dot repetition over visual line selections. Start from
" begining of line
xnoremap . :norm.<CR>

" Typing Q with a visual line selectio in effect will execute the q macro over
" just the selected lines
" xnoremap Q :'<,'>:normal @q<CR>

" run command on current line and replace it with the output
nnoremap Q !!sh<CR>

"grep for word using operator pending mode
nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
xnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
    let saved_unnamed_register = @@
    let saved_yank_register = @"

    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif

    silent execute "grep! -R " . shellescape(@@) . " *"
    copen

    let @@ = saved_unnamed_register
    let @" = saved_yank_register
endfunction
" }}}

" FileType Specific Settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
