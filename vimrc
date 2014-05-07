set nocompatible

" Windows Compatible
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after,$HOME/_vim
endif

" Pathogen
runtime! autoload/pathogen.vim
silent! call pathogen#helptags()
silent! call pathogen#runtime_append_all_bundles()

" General
if !has('win32') && !has('win64')
  set term=$TERM " Make arrow and other keys work
endif

filetype plugin indent on  "Automatically detect file types
syntax on " Syntax highlighting
"set mouse=a " automatically enable mouse usage
set shortmess+=filmnrxoOtT
set viewoptions=folds,options,cursor,unix,slash " better unix/win compat
set virtualedit=onemore "Allow for cursor beyond last character
set history=1000 " 1000 entries
set spell " spell check on
set background=dark " set dark background
colorscheme gruvbox
scriptencoding utf-8

" Backups
set backup
set undofile
set undolevels=1000
set undoreload=10000
au BufWinLeave * silent! mkview " make vim save view
au BufWinEnter * silent! loadview " make vim load view

" UI
set tabpagemax=15 " max 15 tabs
set showmode " display current mode
set cursorline " highlight current line
hi cursorline guibg=#333333
hi CursorColumn guibg=#333333

if has('cmdline_info')
  set ruler " show the ruler
  set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
  set showcmd
endif

if has('statusline')
  set laststatus=2
  " Broken down into easily includeable segments
  set statusline=%<%f\    " Filename
  set statusline+=%w%h%m%r " Options
  set statusline+=%{fugitive#statusline()} "  Git Hotness
  set statusline+=\ [%{&ff}/%Y]            " filetype
  set statusline+=\ [%{getcwd()}]             " current dir
  set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

set backspace=indent,eol,start " backspace for dummies
set linespace=0 " no spaces between rows
set nu " line number
set showmatch "show matching brackets/parenthesis
set incsearch " find as you search
set hlsearch " highlight search
set winminheight=0 " windows can be 0 lines high
set ignorecase " case insensitive search
set smartcase " case sensitive when uc present
set wildmenu " show list instead of just completing
set wildmode=list:longest,full " command <Tab> completion
set whichwrap=b,s,h,l,<,>,[,]
set scrolljump=5
set scrolloff=3
set foldenable
set gdefault
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:. " highlight problematic whitespace

" Formatting
set nowrap        " Does not wrap by default
set autoindent    " Automatically do indents
set shiftwidth=2  " 2 spaces per tab cuz space is limited
set tabstop=2     " Again, just 2 spaces
set softtabstop=2 " 2 again
set shiftround    " Always round when shifting so things line up
set smartindent   " Make indenting 
set expandtab
set pastetoggle=<F12>
autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" Key Remapping
let mapleader = ','
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

nnoremap j gj
nnoremap k gk
" Yank to end of line, just like C and D
nnoremap Y y$

" Code folding
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

" clearing highlighting search
nmap <silent> <leader>/ :nohlsearch<CR>

" Visual shifting
vnoremap < <gv
vnoremap > >gv

" Write when you forgot sudo
cmap w!! w !sudo tee % > /dev/null

" Encryption
if version >= 703
  setlocal cm=blowfish
endif

" cscope
if has('cscope')
  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help

  command! -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif

" File Types
if has("autocmd")
  filetype on
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab

  " Reload vimrc when edited
  autocmd bufwritepost .vimrc source $MYVIMRC " Unix
  autocmd bufwritepost _vimrc source $MYVIMRC " Windows
  autocmd bufwritepost vimrc source $MYVIMRC " Other
endif

"
" Plugins
"

" Supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

nnoremap <silent> <leader>e :NERDTreeToggle<CR>
nnoremap <silent> <leader>E :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1

" SnipMate
let g:snips_author = 'Jeff Parent <jecxjo@gmail.com>'
nnoremap ,smr <esc>:exec ReloadAllSnippets()<cr>

" Tabular
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:<CR>
  vmap <Leader>a: :Tabularize /:<CR>
  nmap <Leader>a:: :Tabularize /:\zs<CR>
  vmap <Leader>a:: :Tabularize /:\zs<CR>
  nmap <Leader>a, :Tabularize /,<CR>
  vmap <Leader>a, :Tabularize /,<CR>
  nmap <Leader>a<Bar> :Tabularize/<Bar><CR>
  vmap <Leader>a<Bar> :Tabularize/<Bar><CR>
endif

" Fuzzy Finder
nmap <Leader>ff :FufFile **/<CR>
nmap <Leader>ft :FufFile<CR>
nmap <Leader>fb :FufBuffer<CR>
nmap <Leader>fl :FufLine<CR>
nmap <Leader>fr :FufRenewCache<CR>

" Alertnate (a.vim)
let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc,sfr:./include,sfr:./inc'

" Airline
let g:airline#extensions#tabline#enabled = 1

"
" Key Mappings
"
" Uppercase
inoremap <C-u> <esc>viwUwi
nnoremap <C-u> viwU
nnoremap <leader>rc :vsplit $MYVIMRC<CR>

"
" Misc
"
au BufNewFile,BufRead *.md set filetype=mkd " md files set to markdown

function! InitializeDirectories()
  let separator = "."
  let parent = $HOME
  let prefix = '.vim'
  let dir_list = {
    \ 'backup': 'backupdir',
    \ 'views': 'viewdir',
    \ 'swap': 'directory',
    \ 'undo': 'undodir' }

  for [dirname, settingname] in items(dir_list)
    let directory = parent . '/' . prefix . dirname . "/"
    if exists("*mkdir")
      if !isdirectory(directory)
        call mkdir(directory)
      endif
    endif
    if !isdirectory(directory)
      echo "Warning: Unable to create backup directory: " . directory
      echo "Try: mkdir -p " . directory
    else
      let directory = substitute(directory, " ", "\\\\ ", "")
      exec "set " . settingname . "=" . directory
    endif
  endfor
endfunction
call InitializeDirectories()

function! NERDTreeInitAsNeeded()
  redir => bufoutput
  buffers!
  redir END
  let idx = stridx(bufoutput, "NERD_tree")
  if idx > -1
    NERDTreeMirror
    NERDTreeFind
    wincmd 1
  endif
endfunction

" If we have a 'local' version for this machine
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" If we have a 'local' version for this project
if filereadable('.vimrc.local')
  source .vimrc.local
endif
