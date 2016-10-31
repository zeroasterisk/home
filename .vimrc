" config if available {
    if filereadable(expand("~/.vimrc-0-before"))
        source ~/.vimrc-0-before
    endif
    if filereadable(expand("~/.vimrc-1-setup"))
        source ~/.vimrc-1-setup
    endif
" }


filetype off
" Setting up Vundle - the vim plugin bundler
" type in :BundleInstall
let $GIT_SSL_NO_VERIFY = 'true'
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
" (installed via pip, not this)
" Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
" NerdCommenter - comment block commands
Bundle 'scrooloose/nerdcommenter'
" Syntastic - compiler checking for errors on the fly
Bundle 'scrooloose/syntastic'
" EditorConfig file support in vim
Bundle 'editorconfig/editorconfig-vim'
" TagBar - ctags support
" Bundle 'majutsushi/tagbar'
" EasyTags - ctags manager
" Bundle 'xolox/vim-easytags'
" Bundle 'xolox/vim-misc'
" Vim + Ag / Ack / Grep
Bundle 'rking/ag.vim'
" Vim Multiple Cursors
Bundle 'terryma/vim-multiple-cursors'
" Autoclose - Automatically close brackets
Bundle 'Townk/vim-autoclose'
" Sparkup lets you write HTML code faster
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Autoclose Tags - Automatically close HTMLish tags
Bundle 'alvan/vim-closetag'
" CTRL-P - Fuzzy file searching
Bundle 'ctrlpvim/ctrlp.vim'
" SuperTab easier autocomplets
Bundle 'ervandew/supertab'
" neocomplete autocomplete
"   WARNING requires vim w/ lua
"   https://github.com/Shougo/neocomplete.vim
Bundle 'Shougo/neocomplete'
" considering: https://github.com/Valloric/YouCompleteMe
" Bundle 'Valloric/YouCompleteMe'
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
" PHP plugin (ensuring latest)
"Bundle '2072/PHP-Indenting-for-VIm'
Bundle 'StanAngeloff/php.vim'
" Git diffs in gutter
Bundle 'airblade/vim-gitgutter'
" webapi toolkit, with basic http/curl/wget & xml,html,json parsing and more
Bundle 'mattn/webapi-vim'
" create gists from text blocks
Bundle 'mattn/gist-vim'
" Movement by maping `s` to an `f` which looks for 2 characters
"Bundle 'goldfeld/vim-seek'
" PHP PRS-2 code formatter
Bundle 'stephpy/vim-php-cs-fixer'
" QuickFix panel open controls
Bundle 'yssl/QFEnter'

" Auto sense the tabs/spaces/width from the file being edited
" Bundle "tpope/vim-sleuth"
"using: ,,<space> & ,,<tab> to switch
" align equals/colons
Bundle "godlygeek/tabular"
" Matchit - % bounces on html tags
Bundle 'vim-scripts/matchit.zip'

" SnipMate and its dependencies:
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"

" Other sets of snippets (optional):
Bundle "honza/vim-snippets"

" -------------------
" Language Specific Bundles
"
" HAML - Support for haml/sass/scss
" Bundle 'tpope/vim-haml'
" RagTag matching for <?php ?>
" Bundle "tpope/vim-ragtag"
" Graphvix dot file syntax and editing
Bundle 'wannesm/wmgraphviz.vim'

" --------- JS
"  see: https://github.com/joyent/node/wiki/Vim-Plugins
Bundle "mxw/vim-jsx"
Bundle "pangloss/vim-javascript"
Bundle "jelera/vim-javascript-syntax"
Bundle "1995eaton/vim-better-javascript-completion"
" JS Beautify vim plugin
Bundle "maksimr/vim-jsbeautify"
" vim-react-snippets:
Bundle "justinj/vim-react-snippets"
" Mustache syntax
Bundle "juvenn/mustache.vim"
" JS libraries for libs
Bundle "othree/javascript-libraries-syntax.vim"

" --------- elixir
"  see: https://github.com/elixir-lang/vim-elixir
Bundle "elixir-lang/vim-elixir"

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
" highlight current line/col
set cursorline
set cursorcolumn
" fixing a timeout slowness in tmux/screen
set notimeout
set ttimeout
set timeoutlen=50
" autosave on change of focus
au FocusLost * :wa

"files
set backup      " make backups

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


" tabs/indent
":source ~/.vimrc-spaces
" note: two spacing profiles exist
" :source ~/.vimrc-spaces
" :source ~/.vimrc-tabs
" (look for shortcuts to switch, in the leader sections)
nnoremap <leader><leader><space> :source ~/.vimrc-spaces<cr>
nnoremap <leader><leader><tab> :source ~/.vimrc-tabs<cr>

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

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" strip trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e " automatically deletes trailing spaces on save

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

" locations list / Quickfix (next/prev error)
nnoremap <C-S-right> <esc>:lnext<CR>
nnoremap <C-S-left> <esc>:lprevious<CR>


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

" toggle between 'normal' and 'cursor always centered'
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>

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
set backupdir=./.backup,~/.vim/tmp,~/tmp,.
set undodir=./.backup,~/.vim/tmp,~/tmp,.
set directory=./.backup,~/.vim/tmp,~/tmp,.

" Tab / Tabularize
" http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
if exists(":Tabularize")
  nmap <F11> :Tabularize /=.<CR>
  vmap <F11> :Tabularize /=.<CR>
  nmap <C-=> :Tabularize /=.<CR>
  vmap <C-=> :Tabularize /=.<CR>
  nmap <leader>= :Tabularize /=.<CR>
  vmap <leader>= :Tabularize /=.<CR>
  nmap <leader>: :Tabularize /:\zs<CR>
  vmap <leader>: :Tabularize /:\zs<CR>
endif
if exists(":Tab")
  nmap <F11> :Tab /=.<CR>
  vmap <F11> :Tab /=.<CR>
  nmap <C-=> :Tab /=.<CR>
  vmap <C-=> :Tab /=.<CR>
  nmap <leader>= :Tab /=.\sz<CR>
  vmap <leader>= :Tab /=.\zs<CR>
  nmap <leader>: :Tab /:\zs<CR>
  vmap <leader>: :Tab /:\zs<CR>
endif


" snipmate config
imap <C-j> <Plug>snipMateNextOrTrigger
smap <C-j> <Plug>snipMateNextOrTrigger
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger
imap <A-J> <Plug>snipMateNextOrTrigger
smap <A-J> <Plug>snipMateNextOrTrigger

" use powerline symbols - requires patched font - see
" https://github.com/Lokaltog/vim-powerline/wiki/Patched-fonts
" let g:Powerline_symbols = 'compatible'
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" tagbars config
" nmap <F8> :TagbarToggle<CR>  " f8 to turn on/off
" let g:tagbar_autofocus = 1   " auto focus after opening tagbar
" let g:tagbar_autoclose = 1   " auto close after choosing a tag
" turn off variables for php
" let g:tagbar_type_php = {
"     \ 'kinds' : [
"         \ 'i:interfaces',
"         \ 'c:classes',
"         \ 'd:constant definitions:0:0',
"         \ 'f:functions',
"         \ 'j:javascript functions',
"     \ ],
" \ }

" QuickFix panel shortcuts for opening files
let g:qfenter_open_map = ['<CR>', '<2-LeftMouse>']
let g:qfenter_vopen_map = ['<Leader><CR>', '<C-v>']
" let g:qfenter_hopen_map = ['<Leader><Space>', '<C-h>']
let g:qfenter_topen_map = ['<Leader><Tab>', '<C-t>']

" ------------------
"  AutoComplete via https://github.com/Shougo/neocomplete.vim

"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" ------------------
"  file type tweaks
filetype plugin on

"------ Filetypes ------"
" JavaScript
" autocmd BufRead,BufNewFile *.json setfiletype javascript
"autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
let javascript_enable_domhtmlcss=1
" Vimscript
autocmd FileType vim setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4
" Shell
autocmd FileType sh setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4
" Lisp
autocmd Filetype lisp,scheme setlocal equalprg=~/.vim/bin/lispindent.lisp
autocmd Filetype lisp,scheme setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2
" Ruby
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
" PHP: autocomplete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" PHP
autocmd FileType php setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
" X?HTML & XML
autocmd FileType html,xhtml,xml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
" CSS
autocmd FileType css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
" Syntax of these languages is fussy over tabs Vs spaces (or I like em this way)
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
" Beautify by filetype
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" vim-javascipt adds $ as a keyword
augroup phpjsfix
    autocmd!
    autocmd FileType javascript setlocal iskeyword+=$
    autocmd FileType php setlocal iskeyword-=$
augroup END


" syntastic language checkers
let g:syntastic_javascript_checkers = ['eslint']
" SWITCH TO STANDARD w/ ,,s
nnoremap <leader><leader>e :source ~/.vimrc-eslint<cr>
nnoremap <leader><leader>s :source ~/.vimrc-standard<cr>
let g:syntastic_python_checkers=['pylint']
"vlet g:syntastic_handlebars_checkers  = ['handlebars']
" vim syntax/style checking for CakePHP
"   pear channel-discover pear.cakephp.org;
"   pear install --alldeps cakephp/CakePHP_CodeSniffer;
let g:syntastic_php_checkers=['php', 'phpcs -p --extensions=php --standard=CakePHP', 'phpmd']
" HTML extra tads
let g:syntastic_html_tidy_blocklevel_tags = ['template']
let g:syntastic_html_tidy_empty_tags = ['span']
let g:syntastic_html_tidy_ignore_errors = [
      \  '<html> attribute "lang" lacks value',
      \  '<a> attribute "href" lacks value',
      \  'trimming empty <span>',
      \  'trimming empty <h1>'
      \ ]

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
" let g:syntastic_filetype_map = { 'html.handlebars': 'handlebars' }

" ctrlp config - persistant cache
let g:ctrlp_working_path_mode = 'raw'
let g:ctrlp_root_markers = ['settings.json']
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_height = 20
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:25,results:25'
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|node_modules|tmp|logs|log|swagger)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" PHP PSR-2 Code Formatter
" https://github.com/stephpy/vim-php-cs-fixer
" https://github.com/fabpot/PHP-CS-Fixer
let g:php_cs_fixer_path = "~/.composer/vendor/bin/php-cs-fixer" " define the path to the php-cs-fixer.phar
let g:php_cs_fixer_level = "all"                  " which level ?
let g:php_cs_fixer_config = "default"             " configuration
let g:php_cs_fixer_php_path = "php"               " Path to PHP
" If you want to define specific fixers:
"let g:php_cs_fixer_fixers_list = "linefeed,short_tag,indentation"
let g:php_cs_fixer_fixers_list = "-indentation"
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.


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

" ag / ack / grep
nnoremap <C-f> :Ag
nnoremap <C-g> :AgAdd
let g:ag_working_path_mode="r"

" vimpad
let g:pad_dir = "~/notes/"
let g:pad_format = "text"
let g:pad_window_height = 12
let g:pad_search_backend = "ag"

" Config for editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:EditorConfig_exclude_patterns = ['scp://.*']
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Javascript libraries autocomplete
let g:used_javascript_libs = 'underscore,react,chai,jasmine,handlebars'

" javascript bundle
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" JavaScript JSX/React
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" -------------------------
"  fixing common mistakes
"  ------------------------
" for some reason, when switching tabs, I use p
nnoremap np gT
nnoremap nP gT

" -------------------------
" custom shortcuts: insert mode
" ------------------------
" this is a sexy little shortcut to break out of insert mode and save
inoremap ;; <ESC>l :w<cr>

" -------------------------
" custom shortcuts: normal mode
" ------------------------
" save
nnoremap ;; :w<cr>

" :suw = write as sudo
" http://www.catonmat.net/blog/top-ten-one-liners-from-commandlinefu-explained/
:nmap :suw :w !sudo tee %

" yank to clipboard shortcut
nnoremap <leader>y "*y
" paste from clipboard shortcut
nnoremap <leader>v "*v

" ,ev edit vimrc file on the fly
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
" ,rv reload the vimrc file on the fly
nnoremap <leader>rv :source ~/.vimrc
" surroud replace quotes
map <leader>" cs'"
map <leader>' cs"'
map <leader>` cs'`
" wrap word in quotes
nnoremap <leader>.' ysiw'
nnoremap <leader>." ysiw"
nnoremap <leader>.` ysiw`
" duplicate current word, after a colon
nnoremap <leader>.. yiwea:<SPACE><ESC>p
" ,W strip all trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" ,a ag helper
nnoremap <leader>a :Ag
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

" Git grep
" Bind ,g to grep for the last searched string
nnoremap <leader>g :grep -r <C-R>/ .<CR>:cw<CR>
" bind ,K to grep word under cursor
nnoremap <leader>G :grep -r "\b<C-R><C-W>\b" .<CR>:cw<CR>
" Use ag if it exists instead of grep for :grep
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
endif
"
" CakePHP Testing
" ,T run current test file (must be in the method code)
nnoremap <leader>T :Ctestrun
" ,t run current test filtered to method (must be in the method code)
nnoremap <leader>t :Ctestrunmethod


" custom saved macros
" 1. start record `qq`
" 2. do stuff
" 3. stop recording `q` (test macro)
" 4. `:e ~/.vimrc`
" 5. `"qp` pastes the escaped macro
" 6. format as with `let @x = '...'`

" find array( .. and matching ), replace with [ ... ]
" http://screencast.com/t/1TTpJvpiuEq
let @p = '/<array\(diwma%mb`ar[`br]`a'



