"==============================================================================
"                               ~ My vimrc ~
"==============================================================================
"
"  Author:      Harry Venables
"  Source:      https://github.com/hvenables/home_files_2.0
"
"------------------------------------------------------------------------------

" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible

" Required:
set runtimepath+=/Users/harry/.config/nvim/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/harry/.config/nvim')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
" Esstentials
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-repeat')
call dein#add('roman/golden-ratio')
call dein#add('easymotion/vim-easymotion')
call dein#add('scrooloose/syntastic')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-endwise')
call dein#add('tpope/vim-unimpaired')
call dein#add('tpope/vim-dispatch')
call dein#add('rking/ag.vim')
" Git
call dein#add('tpope/vim-fugitive')
" Ruby
call dein#add('vim-ruby/vim-ruby')
call dein#add('tpope/vim-rails')
call dein#add('kana/vim-textobj-user')
call dein#add('nelstrom/vim-textobj-rubyblock')
call dein#add('tpope/vim-bundler')
" Autopairs
call dein#add('jiangmiao/auto-pairs')
" RSpec
call dein#add('thoughtbot/vim-rspec')
call dein#add('jgdavey/tslime.vim')
" Coffeescript
call dein#add('kchmck/vim-coffee-script')
" Javascript
call dein#add('pangloss/vim-javascript')
" Elixir
call dein#add('elixir-lang/vim-elixir')
" Elm
call dein#add('lambdatoast/elm.vim')
" Gives DB access to vim
call dein#add('vim-scripts/dbext.vim')
" Fuzzy Searching
call dein#add('ctrlpvim/ctrlp.vim')
" Nice status bar
call dein#add('bling/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
" Vertical lines
call dein#add('Yggdroot/indentLine')
" Improves ITerm2 and tmux intergration
call dein#add('sjl/vitality.vim')
call dein#add('christoomey/vim-tmux-navigator')
" Enables Multiple Cursor
call dein#add('terryma/vim-multiple-cursors')
" Better whitespace handling
call dein#add('ntpeters/vim-better-whitespace')

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" Change <Leader>
let mapleader = ","

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" enhances the percent command
runtime macros/matchit.vim

" Escape from insert mode with jj
inoremap jj <esc>:w<CR>

" Color scheme
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized

" Airline status bar config
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0

set hidden        " Allow buffer change w/o saving
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set cursorline    " highlight the current line the cursor is on
set autoindent    " always set autoindenting on
set backspace=2   " Backspace deletes like most programs in insert mode
set mouse=a       " Enable mouse mode
set clipboard=unnamed

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


"==============================================================================
" Easy access to start of the line
nmap 0 ^

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>

" j and k will move down virtual line even when text is wrapped
nmap j gj
nmap k gk

" search next/previous -- center in page
nmap n nzz
nmap N Nzz

" Strip Whitespace
nnoremap <leader>ws :StripWhitespace<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Open a new tab
nmap <Leader>y :tabnew<CR>

"auto indent the file
nmap <Leader>i gg=G''

" Easymotion.vim mappings from https://github.com/easymotion/vim-easymotion

" Default is <leader><leader>
map <Leader>d <Plug>(easymotion-prefix)

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Rails.vim mappings
nmap <Leader>ae :AE<CR>
nmap <Leader>av :AV<CR>
nmap <Leader>re :RE<CR>
nmap <Leader>rv :RV<CR>

nmap <Leader>ec :Econtroller<space>
nmap <Leader>vc :Vcontroller<space>
nmap <Leader>em :Emodel<space>
nmap <Leader>vm :Vmodel<space>
nmap <Leader>ev :Eview<space>
nmap <Leader>vv :Vview<space>

command! Q q " bind :Q to :q
command! E e " bind :E to :e

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Vim fugitive maping
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>go :Git checkout<Space>

" Eval ruby files
map <leader>r :!ruby %<cr>

" Addes line numbers to :Explore
let g:netrw_bufsettings = "noma nomod nu nobl nowrap ro rnu"

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Fuzzy searching using ctrl p and silver searcher
  let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    " bind K to grep word under cursor
    nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
    " bind \ (backward slash) to grep shortcut
    command -nargs=+ -complete=file -bar Ag silent! grep!<args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif

endif

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

:let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Veritcal line config
let g:indentLine_color_term = 239
let g:indentLine_char = '|'

" Run specs in iTerm2
let g:rspec_runner = "os_x_iterm2"

" Tmux run rspec
" let g:rspec_command = 'call Send_to_Tmux("spring rspec {spec}\n")'
let g:rspec_command = "Dispatch bin/rspec {spec}"

"Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
