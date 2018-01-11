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
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-endwise')
call dein#add('tpope/vim-unimpaired')
call dein#add('tpope/vim-dispatch')
call dein#add('tpope/vim-sleuth')

call dein#add('neomake/neomake')

call dein#add('rking/ag.vim')
" Git
call dein#add('tpope/vim-fugitive')
" Ruby
call dein#add('vim-ruby/vim-ruby')
call dein#add('tpope/vim-rails')
call dein#add('kana/vim-textobj-user')
call dein#add('nelstrom/vim-textobj-rubyblock')
call dein#add('tpope/vim-bundler')
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

call dein#add('Konfekt/FoldText')
call dein#add('Konfekt/FastFold')

" Opening from quicksplit
call dein#add('yssl/QFEnter')

" Highlight when yanking
call dein#add('machakann/vim-highlightedyank')

call dein#add('Shougo/deoplete.nvim')
call dein#add('fishbullet/deoplete-ruby')

call dein#add('radenling/vim-dispatch-neovim')

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

" deoplete.nvim
if has('nvim')
  let g:deoplete#enable_at_startup = 1

  let g:deoplete#omni#input_patterns = {}
  if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
  endif
  " let g:deoplete#disable_auto_complete = 1
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

  let g:deoplete#omni#functions = {}
  let g:deoplete#omni#functions.ruby = [
    \ 'fishbullet#deoplete-ruby',
  \]
endif

"use <tab> for completion
function! TabWrap()
    if pumvisible()
        return "\<C-N>"
    elseif strpart( getline('.'), 0, col('.') - 1 ) =~ '^\s*$'
        return "\<tab>"
    elseif &omnifunc !~ ''
        return "\<C-X>\<C-O>"
    else
        return "\<C-N>"
    endif
endfunction
" power tab
imap <silent><expr><tab> TabWrap()
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Airline status bar config
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_section_z = '%{strftime("%a %d %b, %H:%M:%S")}'
function! UpdateTime(timer)
  call airline#update_statusline()
endfunction
let g:airline#extensions#clock#timer = timer_start(1000, 'UpdateTime', {'repeat':-1})

set modelines=0
set hidden        " Allow buffer change w/o saving
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
" set laststatus=2  " Always display the status line
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
" Autosave on changing focus
:au FocusLost * silent! wa
autocmd BufLeave,FocusLost silent! wall


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

" make opening and closing of folds easier
nmap <Leader>z zO
nmap <Leader>c zc

" search next/previous -- center in page
nmap n nzz
nmap N Nzz

" jump between methods
nmap <Leader>k [m
nmap <Leader>j ]m

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

nmap <Leader>sv :Server<CR>
nmap <Leader>ksv :Server!-<CR>
nmap <Leader>co :Console<CR>

" Stop spring
nmap <Leader>ss :!spring stop<CR>

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

" Navigating from terminal
nmap <leader>tr :vsp<CR>:terminal<CR>
nmap <leader>tn :tabnew<CR>:terminal<CR>
nmap <leader>tc :vsp<CR>:terminal<CR> rails c<CR>
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

nmap <leader>gr :GoldenRatioResize<CR>

" Eval ruby files
map <leader>r :!ruby %<cr>

" Toggle Paste
nnoremap <leader>p :set invpaste paste?<CR>
imap <leader>p <C-O>:set invpaste paste?<CR>
set pastetoggle=<leader>p

" Hash rocket removal command
command! -range=% RemoveHashRocket silent execute <line1>.','.<line2>.'s/:\(\w\+\)\s*=>\s*/\1: /g'
nmap <Leader>hr :RemoveHashRocket<CR>

" Custom commands for navigating with ctags
map <Leader>[ :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <Leader>] :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Copy filepath
nmap <Leader>fp :let @+=@%<CR>

" Function for jumping to webpages from vim
function! Goto(site)
    let l:site = a:site
    if l:site !~? '^https\?:\/\/'
        let l:site = 'https://' . l:site
    endif

    call netrw#BrowseX(l:site, netrw#CheckIfRemote())
endfun

command! -nargs=1 GoToSite call Goto(<f-args>)
command! -nargs=1 GoToDevDocs call Goto('http://devdocs.io/#q=' . <f-args>)
command! -nargs=1 GoToWordDevDocs call Goto('http://devdocs.io/#q=' . expand(<f-args>))
command! -nargs=1 GoToNephos call Goto('https://cloud.tagadab.com/backoffice/search?utf8=%E2%9C%93&search_type=fuzzy&search_value=' . <f-args> . '&commit=Perform+Search')
command! -nargs=1 GoToTickets call Goto('https://ticket.tagadab.com/search?utf8=%E2%9C%93&search=' . <f-args>)
command! -nargs=1 GoToConcord call Goto('https://admin.tagadab.com/pacman/search/search?search_value=' . <f-args> . '&search_param=generic&search=Search')
command! -nargs=1 GoToGitlab call Goto('http://git.tagadab.com/apps/' . <f-args> . '/pipelines')

nnoremap <Leader>g :GoToSite<space>
nnoremap <Leader>d :GoToDevDocs<space>
nnoremap <Leader>df :GoToWordDevDocs<space><cword><CR>
nnoremap <Leader>np :GoToNephos<space>
nnoremap <Leader>tt :GoToTickets<space>
nnoremap <Leader>cc :GoToConcord<space>
nnoremap <Leader>gt :GoToGitlab<space>

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

" " Folding
" set foldmethod=syntax
" let g:vimsyn_folding='af'
" let ruby_fold = 1
" let g:tex_fold_enabled=1
" set foldlevel=0
" set foldenable
" set foldlevelstart=0
" " specifies for which commands a fold will be opened
" set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo


" nnoremap <silent> zr zr:<c-u>setlocal foldlevel?<CR>
" nnoremap <silent> zm zm:<c-u>setlocal foldlevel?<CR>

" nnoremap <silent> zR zR:<c-u>setlocal foldlevel?<CR>
" nnoremap <silent> zM zM:<c-u>setlocal foldlevel?<CR>

" " Change Option Folds
" nnoremap zi  :<c-u>call <SID>ToggleFoldcolumn(1)<CR>
" nnoremap coz :<c-u>call <SID>ToggleFoldcolumn(0)<CR>
" nmap     cof coz

" function! s:ToggleFoldcolumn(fold)
"   if &foldcolumn
"     let w:foldcolumn = &foldcolumn
"     silent setlocal foldcolumn=0
"     if a:fold | silent setlocal nofoldenable | endif
"   else
"       if exists('w:foldcolumn') && (w:foldcolumn!=0)
"         silent let &l:foldcolumn=w:foldcolumn
"       else
"         silent setlocal foldcolumn=4
"       endif
"       if a:fold | silent setlocal foldenable | endif
"   endif
"   setlocal foldcolumn?
" endfunction

" Neomake Config
" brew install elixir
autocmd! BufWritePost *.ex Neomake elixir

if executable('rubocop') == 1
  " gem install rubocop
  autocmd! BufWritePost *.rb Neomake rubocop
endif

" npm install -g coffeelint
autocmd! BufWritePost *.coffee Neomake coffeelint
" gem install haml_lint
autocmd BufWritePost *.haml Neomake hamllint

let g:neomake_verbose=0
let g:neomake_warning_sign = {
      \ 'text': '⚠',
      \ 'texthl': 'WarningMsg',
      \ }
let g:neomake_error_sign = {
      \ 'text': '✘',
      \ 'texthl': 'ErrorMsg',
      \ }
let g:neomake_info_sign = {
      \ 'text': '➤'
      \ }

" Statusline config
" set statusline+=\ %#ErrorMsg#%{neomake#statusline#QflistStatus('qf:\ ')}
" set statusline+=%*
" set statusline+=%{fugitive#statusline()}

augroup AutoSwap
        autocmd!
        autocmd SwapExists *  call AS_HandleSwapfile(expand('<afile>:p'), v:swapname)
augroup END

function! AS_HandleSwapfile (filename, swapname)
        " if swapfile is older than file itself, just get rid of it
        if getftime(v:swapname) < getftime(a:filename)
                call delete(v:swapname)
                let v:swapchoice = 'e'
        endif
endfunction
autocmd CursorHold,BufWritePost,BufReadPost,BufLeave *
  \ if isdirectory(expand("<amatch>:h")) | let &swapfile = &modified | endif

augroup checktime
    au!
    if !has("gui_running")
        "silent! necessary otherwise throws errors when using command
        "line window.
        autocmd BufEnter,CursorHold,CursorHoldI,CursorMoved,CursorMovedI,FocusGained,BufEnter,FocusLost,WinLeave * checktime
    endif
augroup END

" QFEnter options
let g:qfenter_vopen_map = ['<C-v>']
let g:qfenter_hopen_map = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_topen_map = ['<C-t>']

" Netrw options
let g:netrw_liststyle = 1
let g:netrw_banner = 0

" Gem rvm-ctags adds ctags to ruby to jump to ruby definitions
autocmd FileType ruby
  \ let &tags .= "," . $MY_RUBY_HOME . "/lib/tags" |
  \ let &path .= "," . $MY_RUBY_HOME . "/lib"

" Store visual selection marks, save, restore visual selection marks
function! SaveAndRestoreVisualSelectionMarks() abort
  let l:fname = expand("%")
  if filereadable(l:fname) && match(readfile(l:fname), "text")
    let start_mark = getpos("'[")
    let end_mark = getpos("']")

    try
      silent write
    catch
    finally
      call setpos("'[", start_mark)
      call setpos("']", end_mark)
    endtry
  endif
endfunction

"==============================[ SetNumberDisplay ]=============================
" Varies the display of numbers.
"
" This is not a 'mode' specific setting, so a simple autocommand won't work.
" Numbers should not show up in a terminal buffer, regardless of if that
" buffer is in terminal mode or not.
"===============================================================================

function! SetNumberDisplay()
  if &buftype == 'terminal'
    setlocal nonumber
    setlocal norelativenumber
  else
    set number
    set relativenumber
  endif
endfunction

function! InsertMode()
  if expand('%:t') != 'rails server'
    startinsert
  endif
endfunction

augroup startup
  autocmd!

  " save whenever things change
  autocmd TextChanged,InsertLeave * call SaveAndRestoreVisualSelectionMarks()

  " turn numbers on for normal buffers; turn them off for terminal buffers
  autocmd TermOpen,BufWinEnter * call SetNumberDisplay()

  " when in a neovim terminal, add a buffer to the existing vim session
  " instead of nesting (credit justinmk)
  autocmd VimEnter * if !empty($NVIM_LISTEN_ADDRESS) && $NVIM_LISTEN_ADDRESS !=# v:servername
    \ |let g:r=jobstart(['nc', '-U', $NVIM_LISTEN_ADDRESS],{'rpc':v:true})
    \ |let g:f=fnameescape(expand('%:p'))
    \ |noau bwipe
    \ |call rpcrequest(g:r, "nvim_command", "edit ".g:f)
    \ |call rpcrequest(g:r, "nvim_command", "call SetNumberDisplay()")
    \ |qa
    \ |endif

  " use relative numbers for focused area (maybe turn this back on with a
  " check for if number is turned on or not?)
  " autocmd BufEnter,FocusGained * call lib#NumberToggle(1)
  " autocmd BufLeave,FocusLost * call lib#NumberToggle(0)

  " enter insert mode whenever we're in a terminal
  autocmd TermOpen,BufWinEnter,BufEnter term://* call InsertMode()
augroup END
