"==============================================================================
"                               ~ My vimrc ~
"==============================================================================
"
"  Author:      Harry Venables
"  Source:      https://github.com/hvenables/home_files_2.0
"
"------------------------------------------------------------------------------

let g:vim_config = $HOME . "/.config/nvim/"

let s:modules = ["plugins", "settings", "mappings"]

for s:module in s:modules
  execute "source" g:vim_config . s:module . ".vim"
endfor
