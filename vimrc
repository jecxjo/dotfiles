execute pathogen#infect()
set nu
set ru
set tabstop=2
set shiftwidth=2
set si
syntax on
set expandtab
setlocal cm=blowfish

filetype plugin indent on

let g:syntastic_java_javac_config_file_enabled=1
let g:syntastic_java_javac_config_file="/home/jeff/.vim/syntastic_java_javac.cfg"
let g:syntastic_auto_loc_list=1

nnoremap <F3> :NumbersToggle<CR>

filetype on

au BufNewFile,BufRead *.md set filetype=mkd
