set nocompatible              " be iMproved
filetype off                  " required!

" Custom settings
let mapleader="_"

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode
set hlsearch                      " activate search result highlighting
set wildignore+=tags,doc,tmp,log
set number
set nocompatible      " Do not be compatible with Vi - be iMproved
set laststatus=2      " Always show status bar

"set backupdir^=~/.vim/_backup//    " where to put backup files.
"set directory^=~/.vim/_temp//      " where to put swap files.
set t_Co=256
set term=rxvt-unicode-256color
set termencoding=utf-8
set encoding=utf-8

set mouse+=a

" tmux knows the extended mouse mode
set ttymouse=xterm2

" no freakin' end of line
set noeol

" Use curl to get plug.vim if not exists
if empty(glob("~/.vim/autoload/plug.vim"))
  execute '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

let g:syntastic_auto_loc_list=1
let g:syntastic_enable_balloons = 1
let g:syntastic_check_on_open=0
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:loaded_netrw       = 0
let g:loaded_netrwPlugin = 0



" My bundles here:
" original repos on GitHub
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'Lokaltog/vim-easymotion'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'rking/ag.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-markdown'
Plug 'kchmck/vim-coffee-script'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'flazz/vim-colorschemes'
Plug 'rizzatti/dash.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'elixir-lang/vim-elixir'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-unimpaired'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'bronson/vim-trailing-whitespace'
Plug 'DepthDeluxe/Todo.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()

filetype plugin indent on

" Custom settings 2
set guifont=Inconsolata\ for\ Powerline:h14
set encoding=utf-8

"let g:solarized_termtrans=1
colorscheme solarized
set background=dark
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set listchars=nbsp:¬,extends:»,precedes:«,trail:•
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

set cursorline                  " Highlight current line

highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode
highlight clear CursorLineNr    " Remove highlight color from current line number


autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType ruby let &colorcolumn=80
autocmd VimEnter * wincmd p
" check if file has been changed
autocmd WinEnter * checktime
autocmd CursorHold * checktime

map <C-F> :Ack<space>

" copy paste
set clipboard=unnamed

"  scroll left and right when 'nowrap':
map <C-L> 20zl " Scroll 20 characters to the right
map <C-H> 20zh " Scroll 20 characters to the left

syntax on

map <C-t> :FZF<CR>

" Gitgutter Icons
let g:gitgutter_sign_added = '✭'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '◄'
let g:gitgutter_sign_removed_first_line = '◄'
let g:gitgutter_sign_modified_removed = '▼'

let g:airline_powerline_fonts = 1
"highlight GitGutterAdd guifg=green
"highlight GitGutterChange guifg=yellow
"highlight GitGutterDelete guifg=red
"highlight GitGutterChangeDelete guifg=yellow


hi NonText ctermbg=none
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi cursorline guibg=NONE ctermbg=NONE


"NerdTree
let g:nerdtree_tabs_open_on_new_tab = 1
let g:nerdtree_tabs_autoclose = 1
let NERDTreeShowHidden=1

"Split direction
set splitbelow
set splitright

"ignores case sensitivitie
set ignorecase
