set modelines=0   " Turn off modelines
set hidden        " Allow buffer change w/o saving
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set autowrite     " Automatically :write before running commands
set cursorline    " highlight the current line the cursor is on
set autoindent    " always set autoindenting on
set backspace=2   " Backspace deletes like most programs in insert mode
set mouse=a       " Enable mouse mode
set clipboard=unnamed
set encoding=utf-8

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Line number config
set relativenumber
set number

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Stop vim creating backups
set nobackup
set nowritebackup
set noswapfile

" Improve performance with large files
set ttyfast
set lazyredraw

" flashes matching brackets or parentheses
set showmatch

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" When scrolling off-screen do so 3 lines at a time, not 1
set scrolloff=3

" Softtabs, 2 spaces
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Adding special characters to word def
set iskeyword+=@-@
set iskeyword+=?

" Improves searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

" Color scheme
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized

