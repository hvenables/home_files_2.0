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
call dein#add('yssl/QFEnter')

" Searching vim
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

" Highlight when yanking
call dein#add('machakann/vim-highlightedyank')

" Autocomplete
call dein#add('Shougo/deoplete.nvim')
call dein#add('fishbullet/deoplete-ruby')

" Replacing tmux
call dein#add('radenling/vim-dispatch-neovim')
call dein#add('BurningEther/nvimux')

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

