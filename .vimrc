" .vimrc file for Vincent Zhao <vincentzhaorz@gmail.com>
" Last updated: 2016.10.26
" 
" Thanks for the great advices from https://dougblack.io/words/a-good-vimrc.html#wrap
"

" Main content
" Basic Configuration {{{

" }}}
" Vundle Configuration {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" plugins for Git
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'wincent/command-t'
" NERDTrees
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Languages
Plugin 'tpope/vim-rails'
Plugin 'rust-lang/rust.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
"" JavaScript
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'matthewsimo/angular-vim-snippets'
Plugin 'scrooloose/syntastic.git'
" Others
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'rhysd/vim-clang-format'
Plugin 'kana/vim-operator-user'
Plugin 'junegunn/vim-easy-align'
"" Pandoc
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
"" Theme
Plugin 'sjl/badwolf'
"" Undo
Plugin 'sjl/gundo.vim'
"" ag
Plugin 'rking/ag.vim'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}
" Vundle Plugins Configure {{{
let g:vim_markdown_folding_disabled = 1

let g:used_javascript_libs = 'angularjs,angularui'

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]
let g:syntastic_cpp_compiler = 'clang++-3.4'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_python_checkers = []

" Easy align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Pandoc
let g:pandoc#spell#enabled = 0

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" }}}
" Color {{{
" enable syntax highlighting. 
" NOTE: a short discussion on 'on' vs 'enable': http://stackoverflow.com/questions/11272501/vim-default-syntax-highlighting
syntax enable
" The badwolf colorscheme
" NOTE: configured by "Plugin 'sjl/badwolf'"
colorscheme badwolf
" }}}
" Space and Tabs {{{

" number of spaces that a <Tab> in the file counts for
" I LOVE 2 SPACES
set tabstop=2

" number of spaces that a <Tab> counts for while performing **editing** operations
set softtabstop=2

" tabs are spaces
set expandtab

" }}}
" UI Config {{{

" show line numbers
set number

" show command in bottom bar
set showcmd

" highlight current line
set cursorline

" load filetype-specific indent files
filetype indent on

" visual autocomplete for ONLY command menu
set wildmenu

" lazy redraw window (DONT UNDERSTAND)
set lazyredraw

" highlight parenthesis matching
set showmatch

" }}}
" Searching {{{
" searching words or patterns in VIM

" search as characters are entered
set incsearch

" highlight matches
set hlsearch

" turn off search highlight
" Great explanation on mapping
" http://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
nnoremap <leader><space> :nohlsearch<CR>

" }}}
" Folding {{{

" enable folding
set foldenable

" open most folds by default
set foldlevelstart=10

" at most only 10 folds are nested
set foldnestmax=10

" space open and close
nnoremap <space> za

" set fold method to make fold based on indent level
" set foldmethod=indent

" }}}
" Movement {{{

" move vertically by VISUAL line
nnoremap j gj
nnoremap k gk

" move to beginning and end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything, just train yourself
nnoremap $ <nop>
nnoremap ^ <nop>

" highlight last inserted text
nnoremap gV `[v`]

" }}}
" Leader Shortcuts {{{

" leader key
let mapleader=","

" jk is escape, just hit them sequentially and quickly to use ESC
inoremap jk <esc>

" toggle gundo: Graphical Undo
nnoremap <leader>u :GundoToggle<CR>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" save session
nnoremap <leader>s :mksession<CR>

" open ag.vim
nnoremap <leader>a :Ag<CR>

" }}}
" Directory configure {{{

" Swap file directory
set dir=$HOME/.vimtemp

" Backup file directory
set backupdir=$HOME/.vimbackup

" Configure persistant undo options
if version >= 703
  set undofile
  set undodir=$HOME/.vimundo
endif

" }}}
" Archive {{{

set t_Co=256

let g:filetype_pl="prolog"

" Archive configuration
" Configuration file for vim
set modelines=0" CVE-2007-2438

if has("autocmd")
	autocmd BufRead *.txt set tw=78
	autocmd BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\   exe "normal g'\"" |
		\ endif
endif

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible" Use Vim defaults instead of 100% vi compatibility
set backspace=2" more powerful backspacing


autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul

set smartindent
set autoindent
set confirm

set shiftwidth=2

" C++ configuration
set cinoptions+=g0

set gdefault
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1
set cmdheight=2
set ruler
set laststatus=2
set scrolloff=3
set matchtime=5
set autowrite
set linespace=2
set whichwrap=b,s,<,>,[,]
set nowrap

vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

map <F7> :if exists("syntax_on") <BAR>
\    syntax off <BAR><CR>
\  else <BAR>
\syntax enable <BAR>
\  endif

map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
exec "!gcc % -o %<.o"
exec "! ./%<.o"
endfunc

map <F6> :call CompileRunGpp()<CR>
func! CompileRunGpp()
exec "w"
exec "!g++ % -o %<.o"
exec "! ./%<.o"
endfunc

" For Haskell
" au Bufenter *.hs compiler ghc


" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup
" }}}

" Folding for this file
set modelines=1
" vim:foldmethod=marker:foldlevel=0
