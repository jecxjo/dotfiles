set nocompatible
filetype off

" Windows Compatible {{{
if has('win32') || has('win64')
  if !exists("g:loaded_pathogen")
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after,$HOME/_vim
  endif
endif
" }}}

" Pathogen {{{
execute pathogen#infect()
" }}}

" General {{{
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
set background=dark " set dark background
colorscheme gruvbox
scriptencoding utf-8
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
set lazyredraw

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

" Backups
set backup
set undofile
set undolevels=1000
set undoreload=10000

" UI
set tabpagemax=15 " max 15 tabs
set showmode " display current mode
set cursorline " highlight current line
hi cursorline guibg=#333333
hi CursorColumn guibg=#333333

" Ruler setup
if has('cmdline_info')
  set ruler " show the ruler
  set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
  set showcmd
endif

" Status line
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

" Remove end of file white space
autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
" }}}

" Key Remapping {{{

" external command
nnoremap ! :!
nnoremap r! :r!

" Move lines and selections with c-j, c-k
nnoremap <c-k> :m-2<cr>==
nnoremap <c-j> :m+<cr>==
inoremap <c-k> <esc>:m-2<cr>==gi
inoremap <c-j> <esc>:m+<cr>==gi
vnoremap <c-j> :m'>+<cr>gv=gv
vnoremap <c-k> :m-2<cr>gv=gv

" Uppercase
inoremap <C-u> <esc>viwUea
nnoremap <C-u> viwU
nnoremap <leader>cfg :vsplit $MYVIMRC<CR>

" Movement
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
vnoremap j gj
vnoremap k gk
vnoremap gj j
vnoremap gk k

" Yank to end of line, just like C and D
nnoremap Y y$

" OS Clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

nnoremap <leader>Y "+Y
vnoremap <leader>Y "+Y

nnoremap <leader>p "+p
vnoremap <leader>p "+p

nnoremap <leader>P "+P
vnoremap <leader>P "+P

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

" Timestamp
nnoremap <leader>now "=strftfime("%c")<CR>P

" }}}

" Encryption {{{
if version >= 703
  setlocal cm=blowfish
endif
" }}}

" cscope {{{
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
" }}}

" Full-screen Mode Settings {{{
function! ToggleFullScreen()
  if has('win32') || has('win64')
    :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)
  endif
endfunction
" }}}

" File Types {{{
if has("autocmd")
  filetype on
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab

  " Reload vimrc when edited
  autocmd bufwritepost .vimrc source $MYVIMRC " Unix
  autocmd bufwritepost _vimrc source $MYVIMRC " Windows
  autocmd bufwritepost vimrc source $MYVIMRC " Other
endif
" }}}

"
" Plugins {{{
"

" { Rainbow
let g:rainbow_active = 1

function! RainbowOff()
  if exists('b:rainbow_loaded')
    call rainbow#clear()
  endif
endfunction
" }

" { Supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
" }

" { NERDTree
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
" }

" NERDCommenter {{{
let NERDSpaceDelims=1 " Insert space before/after comments
" }}}

" { SnipMate
let g:snips_author = 'Jeff Parent <jecxjo@gmail.com>'
nnoremap ,smr <esc>:exec ReloadAllSnippets()<cr>
" }

" { Tabular
if exists(":Tabularize")
  nnoremap <Leader>t= :Tabularize /=<CR>
  vnoremap <Leader>t= :Tabularize /=<CR>
  nnoremap <Leader>tc :Tabularize /:<CR>
  vnoremap <Leader>tc :Tabularize /:<CR>
  nnoremap <Leader>t:: :Tabularize /:\zs<CR>
  vnoremap <Leader>t:: :Tabularize /:\zs<CR>
  nnoremap <Leader>t, :Tabularize /,<CR>
  vnoremap <Leader>t, :Tabularize /,<CR>
  nnoremap <Leader>t<Bar> :Tabularize /<Bar><CR>
  nnoremap <Leader>t<Bar> :Tabularize /<Bar><CR>
  vnoremap <Leader>t<space> :Tabularize /<space><CR>
  vnoremap <Leader>t<space> :Tabularize /<space><CR>
endif
" }

" { Alertnate (a.vim)
let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc,sfr:./include,sfr:./inc'
" }

" { Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_z="%3p%% %{g:airline_symbols.linenr}%#__accent_bold#%4l%#__restore__#:%3c [%02B]"
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2
" }

" { vim-asterisk
map * <Plug>(asterisk-*)
map # <Plug>(asterisk-#)
map g* <Plug>(asterisk-g*)
map g# <Plug>(asterisk-g#)
map z* <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)
map z# <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)
" }

" }}}

" User Functions {{{

" GetWidth {{{
nnoremap <leader>w :set operatorfunc=<SID>GetWidth<cr>g@
vnoremap <leader>w :<c-u>call <SID>GetWidth(visualmode())<cr>

function! s:GetWidth(type)
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif

  let l = strlen(@@)

  echom "Length is " . l . "."
  let @@ = l
endfunction
" }}}

" Search All Code {{{
nnoremap <leader>g :set operatorfunc=GrepOperator<CR>g@
vnoremap <leader>g :<c-u>call GrepOperator(visualmode())<CR>

function! GrepOperator(type)
  let saved_unnamed_register = @@

  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal `[v`]y
  else
    return
  endif

  silent execute "grep! -R " . shellescape(@@) . " ."
  copen
  let @@ = saved_unnamed_register
endfunction

" }}}

" Display Registers and paste {{{
function! Reg()
  reg
  echo "Register: "
  let char = nr2char(getchar())
  if char != "\<Esc>"
    execute "normal! \"".char."p"
  endif
  redraw
endfunction

command! -nargs=0 Reg call Reg()
"  }}}

" Shell Script to new Buffer {{{
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  let isfirst = 1
  let words = []
  for word in split(a:cmdline)
    if isfirst
      let isfirst = 0
    else
      if word[0] =~ '\v[%#<]'
        let word = expand(word)
      endif
      let word = shellescape(word, 1)
    endif
    call add(words, word)
  endfor
  let expand_cmdline = join(words)
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered: ' . a:cmdline)
  call setline(2, 'Expanded to: ' . expand_cmdline)
  call append(line('$'), substitute(getline(2), '.', '=', 'g'))
  silent execute '$read !'. expand_cmdline
  1
endfunction

command! -complete=file -nargs=* LS call s:RunShellCommand('ls '.<q-args>)
"  }}}

" }}}

"
" Misc {{{
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
" }}}
