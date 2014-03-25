filetype off
" Setting up Vundle - the vim plugin bundler
" type in :BundleInstall
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
	echo "Installing Vundle.."
	echo ""
	silent !mkdir -p ~/.vim/bundle
	silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
	let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
"""" User Bundles Begin """"

" Reasonable defaulting for vim
Bundle "tpope/vim-sensible"
Bundle "tpope/vim-unimpaired"
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
" Color scheme
Bundle 'nanotech/jellybeans.vim'
"Bundle 'altercation/vim-colors-solarized'
"Bundle 'marcus/vim-mustang'
"Bundle 'Lokaltog/vim-distinguished'
"Bundle 'w0ng/vim-hybrid'
"Bundle 'yearofmoo/Vim-Darkmate'
" EasyMotion soper-movement helper
Bundle 'Lokaltog/vim-easymotion'
" Powerline - badass status bar
Bundle 'Lokaltog/vim-powerline'
" NerdCommenter - comment block commands
Bundle 'scrooloose/nerdcommenter'
" Syntastic - compiler checking for errors on the fly
Bundle 'scrooloose/syntastic'
" TagBar - ctags support
Bundle 'majutsushi/tagbar'
" Ack
Bundle 'mileszs/ack.vim'
" Autoclose - Automatically close brackets
Bundle 'Townk/vim-autoclose'
" CTRL-P - Fuzzy file searching
Bundle 'kien/ctrlp.vim'
" SuperTab easier autocomplets
Bundle 'ervandew/supertab'
" Vim pad - Note taking
"DISABLED Bundle 'fmoralesc/vim-pad'
" Evervim - evernote integration - doesn't seem to work.
" Bundle 'kakkyz81/evervim'
" Gundo - Visual undo tree
"DISABLED Bundle 'sjl/gundo.vim.git'
" Distpatch - async testing in vim in the background
"DISABLED Bundle 'tpope/vim-dispatch.git'
" Puppet Syntax
Bundle 'puppetlabs/puppet-syntax-vim'

" -------------------
" Language Specific Bundles
"
" HAML - Support for haml/sass/scss
Bundle 'tpope/vim-haml'
" RagTag matching for <?php ?>
"DISABLED Bundle "tpope/vim-ragtag"
" Auto sense the tabs/spaces/width from the file being edited
"DISABLED Bundle "tpope/vim-sleuth"
"using: ,,<space> & ,,<tab> to switch
" align equals/colons
Bundle "godlygeek/tabular"
" Ultisnips - text snippets
"!python (need python for this to work)
"DISABLED Bundle 'https://github.com/SirVer/ultisnips'
" Matchit - % bounces on html tags
Bundle 'tsaleh/vim-matchit'
" Cake.vim - Hop between model/view/controller
"DISABLED Bundle 'https://github.com/violetyk/cake.vim'
" cakephp.vim more simple navigation helpers for cakephp
"DISABLED Bundle 'git://github.com/ndreynolds/vim-cakephp.git'

" vdebug - used with xdebug to walk through php code
" http://www.vim.org/scripts/script.php?script_id=4170
"DISABLED Bundle 'git://github.com/joonty/vdebug.git'

" clang_complete - only for c/c++, no use for now.
" Bundle 'https://github.com/Rip-Rip/clang_complete'
" sudo apt-get install libclang1 libclang-dev

" phpComplete (PHP extras for omnicomplete)
Bundle 'shawncplus/phpcomplete.vim'

" note, I have insalled the 'word_complete' plugin
" http://www.vim.org/scripts/script.php?script_id=73
" and as such, supertab is a bit un-necissary...
" turn on word_complete all time (leader shortcuts below to toggle)
" autocmd BufEnter * call DoWordComplete()
" ^ disabled because it's a bit less than ideal, can still toggle on/off

" --------- JS
"  see: https://github.com/joyent/node/wiki/Vim-Plugins
" Javascript Bundle (syntax and indent plugin)
"DISABLED Bundle "vim-scripts/JavaScript-Indent"
Bundle "pangloss/vim-javascript"
Bundle "jelera/vim-javascript-syntax"
"DISABLED Bundle "hallettj/jslint.vim"
Bundle "walm/jshint.vim"
Bundle "juvenn/mustache.vim"
Bundle "maksimr/vim-jsbeautify"

" User Bundles End
if iCanHazVundle == 0
	echo "Installing Bundles, please ignore key map error messages"
	echo ""
	:BundleInstall
endif
" Setting up Vundle - the vim plugin bundler end

"basics
set nocompatible   " don't be compatible with vi
set vb t_vb=       " visual bell off
set encoding=utf-8 " utf8
let mapleader = ","   " sets the <leader> variable to ,
" ; === : so we can just do ;w -- saves a keystroke
nnoremap ; :
" fixing a timeout slowness in tmux/screen
set notimeout
set ttimeout
set timeoutlen=50
" autosave on change of focus
au FocusLost * :wa

" tabs/indent
:source ~/.vimrc-tabs
" note: two spacing profiles exist
" :source ~/.vimrc-spaces
" :source ~/.vimrc-tabs
" (look for shortcuts to switch, in the leader sections)
nnoremap <leader><leader><space> :source ~/.vimrc-spaces<cr>
nnoremap <leader><leader><tab> :source ~/.vimrc-tabs<cr>
if exists(":Tabularize")
  nmap <leader><leader>= :Tabularize /=<CR>
  vmap <leader><leader>= :Tabularize /=<CR>
  nmap <leader><leader>: :Tabularize /:\zs<CR>
  vmap <leader><leader>: :Tabularize /:\zs<CR>
endif

"files
set backup                     " make backups

" Command-line navigation
cnoremap <C-x> <Right>
cnoremap <C-z> <Left>
" Ctrl+Left/Right to switch tabs
nnoremap <C-Left> gT
nnoremap <C-Right> gt
" Control+Tab (+Shift, for reverse direction) to switch through tabs
noremap <C-Tab> gt
noremap <C-S-Tab> gT
" Control+t for new tab
nnoremap <C-t> :tabnew<CR>

"search
set ignorecase  " case insenstive search
set hlsearch    " highlight search results
set incsearch   " incremental search (as you type)
set smartcase   " .. unless there's a capital
set gdefault
" fix Vim’s horribly broken default regex handling
" by automatically inserting a \v before any string you search for
nnoremap / /\v
vnoremap / /\v
"  This gets rid of the distracting highlighting
nnoremap <leader><space> :noh<cr>


" strip trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e " automatically deletes trailing spaces on save

" interface
set undodir^=~/.vim/undo
set undofile     " create <FILENAME>.un~ files whenever you edit a file
set laststatus=2 " always show status line
set ruler        " show character position
"set number       " line numbers
set relativenumber " changes line numbers to relative ,# to toggle
set title        " set window title
set wildmenu                  " better completion
set wildmode=list:longest,full     " show lots of stuff
set nolist                    " hidden characters off by default
set listchars=tab:>-,trail:*  " show tabs as -->, trailing whitespace as * with list=on
" f5 toggles line numbers and copy/paste problem characters
nnoremap <F5> :set nonumber!<cr>:set foldcolumn=0<cr>:set list!<cr>
set pastetoggle=<F1>          " f1 toggles paste
set showmatch                 " show matching brackets
set showcmd                   " show when typing leader, etc.
set ttyfast                   " fast connection
set scrolloff=3               " keep 3 lines on the screen when scrolling
"autocmd FileType * setlocal formatoptions-=ro " I hate auto comments
" line wrap handling and guideline at 85 col
set wrap
set whichwrap+=<,>,[,]
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85
" makes Vim show invisible characters with the same characters that TextMate
" uses
set list
set listchars=tab:▸\ ,eol:¬

" remap arrow keys in insert mode, so that they escape and move
inoremap <up> <esc>k
inoremap <down> <esc>j
" remap Shift+arrow in insert mode, escape and move, includes left/right
inoremap <S-up> <esc>k
inoremap <S-down> <esc>j
inoremap <S-right> <esc>ll
inoremap <S-left> <esc>

" split helpers
" new horizontal split
nnoremap <leader>H <C-w>s
" new vertical split
nnoremap <leader>V <C-w>v<C-w>l
" split navigation mapped to CTRL (capslock remap?)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" folding
" set foldmethod=indent
" set foldcolumn=0
" http://vim.wikia.com/wiki/Folding
"augroup vimrc
"	au BufReadPre * setlocal foldmethod=indent
"	au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
"augroup END
"inoremap <F9> <C-O>za
"nnoremap <F9> za
"onoremap <F9> <C-C>za
"vnoremap <F9> zf
"nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
"vnoremap <Space> zf
"" unfold all zR
"nnoremap <C-f> zR

" make the tab key match bracket pairs. I use this to move around all the time
" and <tab> is a hell of a lot easier to type than %
nnoremap <S-tab> %
vnoremap <S-tab> %

" make search results appear in the middle of the screen
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" typeo corrections / remaps
map :W :w
map :Q :q
nnoremap Q q
nnoremap <C-q> q
inoremap / /
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" allow cross-session copy paste with _Y _P
nmap    _Y      :!echo ""> ~/.vi_tmp<CR><CR>:w! ~/.vi_tmp<CR>
vmap    _Y      :w! ~/.vi_tmp<CR>
nmap    _P      :r ~/.vi_tmp<CR>

" OS X paste (pretty poor implementation)
if has('mac')
    noremap  √ :r!pbpaste<CR>
    noremap! √ <Esc>√
endif

" color, syntax highlighting
au BufRead,BufNewFile *.ctp set filetype=php   " special handling for .ctp, odd (must be above filetype plugin indent on)
au BufRead,BufNewFile *.thtml set filetype=php " special handling for .ctp, odd (must be above filetype plugin indent on)
au BufRead,BufNewFile *.dust set filetype=html " special handling for .dust
au BufRead,BufNewFile *.scss set filetype=css  " special handling for .dust
au BufRead,BufNewFile *.txt set ft=sh          " opens .txt w/highlight
filetype plugin indent on                   " enable ft+plugin detect
syntax enable                                   " syntax highlighting
nohl                                        " start without highlighting
"set t_Co=256                                " 256-colors
set background=dark                         " we're using a dark bg
colorscheme jellybeans
"highlight Normal ctermbg=NONE               " use terminal background
"highlight nonText ctermbg=NONE              " use terminal background
"highlight Search ctermfg=0 ctermbg=122      " i don't like jellybeans default search higlighting colors


if has('gui_running')
    set background=light
else
    set background=dark
endif

" Set font accourding to OS
if has('gui_macvim')
  set guifont=Meslo\ LG\ L\ DZ\ for\ Powerline:h12
  set linespace=5
elseif has('gui_gtk') || has('gui_gtk2')
  set guifont="Ubuntu Mono":h15
  set linespace=3
elseif has('gui_win32')
  set guifont=Consolas\ for\ Powerline\ FixedD:h13
  set linespace=3
else
  set guifont=Iconsolata-dz\ for\ Powerline:h15
  set linespace=3
endif

" centralized backup directory
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.



" ultisnips config
"set runtimepath+=~/.vim/bundle/ultisnips      " include filepath
">>?"let g:UltiSnipsUsePythonVersion = 2           " force to use python2, not 3
"let g:UltiSnipsListSnippets="<c-j>"           " list snippets with control-j, the default control-tab doesn't work in putty
"let g:UltiSnipsExpandTrigger="<tab>"          " tab expands
"let g:UltiSnipsJumpForwardTrigger="<tab>"     " use tab to go to next part of the snipper
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"  " use shift-tab to go back

" use powerline symbols - requires patched font - see
" https://github.com/Lokaltog/vim-powerline/wiki/Patched-fonts
let g:Powerline_symbols = 'compatible'

" tagbars config
nmap <F8> :TagbarToggle<CR>  " f8 to turn on/off
let g:tagbar_autofocus = 1   " auto focus after opening tagbar
let g:tagbar_autoclose = 1   " auto close after choosing a tag
" recommended by: http://stackoverflow.com/questions/15425800/ctags-jsctags-doctorjs-tagbar-step-by-step
"set tags=./tags,tags;/,~/.ctags

" ------------------
"  file type tweaks
filetype plugin on

"------ Filetypes ------"
" JavaScript
" autocmd BufRead,BufNewFile *.json setfiletype javascript
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 noexpandtab
let javascript_enable_domhtmlcss=1
" Vimscript
autocmd FileType vim setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4
" Shell
autocmd FileType sh setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4
" Lisp
autocmd Filetype lisp,scheme setlocal equalprg=~/.vim/bin/lispindent.lisp expandtab shiftwidth=2 tabstop=8 softtabstop=2
" Ruby
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
" PHP: autocomplete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" PHP
autocmd FileType php setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
" X?HTML & XML
autocmd FileType html,xhtml,xml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
" CSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
" Syntax of these languages is fussy over tabs Vs spaces (or I like em this way)
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
" Beautify by filetype
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
" TODO PHP Beautify <c-f>
" auto-enable JS folding - https://github.com/jelera/vim-javascript-syntax
"DISABLED autocmd FileType javascript call JavaScriptFold()

" turn off variables for php
let g:tagbar_type_php = {
    \ 'kinds' : [
        \ 'i:interfaces',
        \ 'c:classes',
        \ 'd:constant definitions:0:0',
        \ 'f:functions',
        \ 'j:javascript functions',
    \ ],
\ }

" syntastic language checkers
"let g:syntastic_javascript_checker = "closurecompiler"
"let g:syntastic_javascript_closure_compiler_path = "~/bin/closure-compiler.jar"
let g:syntastic_python_checkers=['pylint']
" vim syntax/style checking for CakePHP
"   pear channel-discover pear.cakephp.org;
"   pear install --alldeps cakephp/CakePHP_CodeSniffer;
let g:syntastic_php_checkers=['php', 'phpcs -p --extensions=php --standard=CakePHP', 'phpmd']


" ctrlp config - persistant cache
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_height = 20

" cake config
"let g:cakephp_enable_auto_mode = 1     " auto detect cake project
"nnoremap <leader>1 :Cmodeltab<cr>      " open model in new tab
"nnoremap <leader>2 :Ccontrollertab<cr> " open controller in new tab
"nnoremap <leader>3 :Cviewtab<space>
" ^^^open view in new tab - you must type function name :(

"todo: usetagbar to figure out the current view to open
"function! Asdf()
	"let l:foo = tagbar#currenttag('%s', '')
"endfunction

" ---------------
" General remaps/aliases

" Quickly set comma or semicolon at the end of the string
inoremap ,, <End>,
inoremap ;; <End>;
au FileType python inoremap :: <End>:

" fugitive config
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>ge :Gedit<cr>
" Gbrowes will link to cursor on github, visually select block and it will on github
nnoremap <leader>gh :Gbrowse<cr>

"  todo - figure out how to include custom ultisnips in .vimrc instead of .vim/
"  pr( Debugger::trace() );

" gundo
nnoremap <F9> :GundoToggle<CR>

" vimpad
let g:pad_dir = "~/notes/"
let g:pad_format = "text"
let g:pad_window_height = 12
let g:pad_search_backend = "ack"

" javascript bundle
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" -------------------------
"  fixing common mistakes
"  ------------------------
" for some reason, when switching tabs, I use p
nnoremap np gT
nnoremap nP gT

" -------------------------
" custom shortcuts: insert mode
" ------------------------
" this is a sexy little shortcut to break out of insert mode
"inoremap ;; <ESC>l
nnoremap K 0YP
" -------------------------
" custom shortcuts: normal mode
" ------------------------
" ,ev edit vimrc file on the fly
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
" ,rv reload the vimrc file on the fly
nnoremap <leader>rv :source ~/.vimrc
" surroud replace quotes
map <leader>" cs'"
map <leader>' cs"'
" wrap word in single quotes
nnoremap <leader>.' ysiw'
" wrap word in double quotes
nnoremap <leader>." ysiw"
" duplicate current word, after a colon
nnoremap <leader>.. yiwea:<SPACE><ESC>p
" ,W strip all trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" ,a ack helper
nnoremap <leader>a :Ack
" ,ft HTML fold tag
nnoremap <leader>ft Vatzf
" ,S sort a list of CSS properties
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
" ,v reselect text that was just pasted
nnoremap <leader>v V`]`
" ,# set relative numbers to ruler
nnoremap <F4> :set relativenumber<cr>
nnoremap <F3> :set number<cr>
" ,Y yank in word shortcut
nnoremap <leader>Y yiw
" ,R replace in word (keep the replacement in registry)
nnoremap <leader>R viwpyiw
" ,A move to end of line, back one character, enter insert mode
nnoremap <leader>A $hi

