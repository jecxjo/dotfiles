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
filetype on

au BufNewFile,BufRead *.md set filetype=mkd

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
