let g:spacevim_default_indent = 2
let g:spacevim_max_column     = 80
" let g:spacevim_guifont      = "Fira\\ Code"
let g:spacevim_colorscheme =  "jellybeans"

" let mapleader = "\<space>"
let mapleader = ","
let g:spacevim_windows_leader = "<F7>"
let g:spacevim_unite_leader = "<F6>"
let g:spacevim_enable_key_frequency = 1

let g:tagman_ctags_binary = "gtags"

let g:spacevim_custom_plugins = [
    \ ['grassdog/tagman.vim'],
    \ ['ervandew/supertab'],
    \ ['nanotech/jellybeans.vim'],
    \ ['mxw/vim-jsx', { 'on_ft' : ['javascript'] }],
    \ ['othree/jspc.vim', { 'on_ft' : ['javascript'] }],
    \ ['pangloss/vim-javascript', { 'on_ft' : ['javascript'] }],
    \ ['jelera/vim-javascript-syntax', { 'on_ft' : ['javascript'] }],
    \ ['1995eaton/vim-better-javascript-completion', { 'on_ft' : ['javascript'] }],
    \ ['justinj/vim-react-snippets', { 'on_ft' : ['javascript'] }],
    \ ['othree/javascript-libraries-syntax.vim', { 'on_ft' : ['javascript'] }],
    \ ['slashmili/alchemist.vim', { 'on_ft' : 'elixir' }],
    \ ]

set title                       " set window title
set list                        " Highlight problematic whitespace
" set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
set listchars=tab:▸\ ,eol:¬
set mouse=a                     " Automatically enable mouse usage
set mousehide                   " Hide the mouse cursor while typing
set colorcolumn=100
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set gdefault                    " set default /g flag on replacements
set shortmess+=filmnrxoOtT      " Abbrev. of messages (avoids 'hit enter')
if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif
" set undodir=$HOME/.data/undofile
" set backupdir=$HOME/.data/backup
" set directory=$HOME/.data/swap

" ------------------
" NerdCommenter config

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" ------------------
" ctrlp config
" https://github.com/SpaceVim/SpaceVim/blob/604d953ea89a075bd5568697c018b24801d4c084/config/plugins/ctrlp.vim

let g:ctrlp_working_path_mode = 'raw'
let g:ctrlp_root_markers = ['package.json', 'settings.json']
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:25,results:25'
let g:ctrlp_user_command = 'cd %s && git ls-files -co --exclude-standard'
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_types = ['fil', 'mru', 'buf']

" Config for editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:EditorConfig_exclude_patterns = ['scp://.*']
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Javascript libraries autocomplete
let g:used_javascript_libs = 'underscore,react,chai,jasmine,handlebars,lodash,jquery'

" javascript bundle
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" JavaScript JSX/React
let g:jsx_ext_required = 0 " Allow JSX in normal JS files


" strip trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e " automatically deletes trailing spaces on save

" force spaces all the time, by default
source ~/.vimrc-spaces
"
" color, syntax highlighting
au BufRead,BufNewFile *.ctp set filetype=php   " special handling for .ctp, odd (must be above filetype plugin indent on)
au BufRead,BufNewFile *.thtml set filetype=php " special handling for .ctp, odd (must be above filetype plugin indent on)
au BufRead,BufNewFile *.dust set filetype=html " special handling for .dust
au BufRead,BufNewFile *.scss set filetype=css  " special handling for .dust
au BufRead,BufNewFile *.txt set ft=sh          " opens .txt w/highlight

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
" autocmd FileType javascript noremap <buffer>  <c-s-b> :call JsBeautify()<CR>
" autocmd FileType html noremap <buffer> <c-s-b> :call HtmlBeautify()<CR>
" autocmd FileType css noremap <buffer> <c-s-b> :call CSSBeautify()<CR>
" -------------------------
" UNBREAK SpaceVim
" ------------------------
nnoremap q q
nnoremap f f
nnoremap s s

" -------------------------
" custom shortcuts: normal mode
" ------------------------
" tabs/indent
":source ~/.vimrc-spaces
" note: two spacing profiles exist
" :source ~/.vimrc-spaces
" :source ~/.vimrc-tabs
" (look for shortcuts to switch, in the leader sections)
nnoremap <leader><leader><SPACE> :source ~/.vimrc-spaces<CR>
nnoremap <leader><leader><TAB> :source ~/.vimrc-tabs<CR>
" search
" fix Vim’s horribly broken default regex handling
" by automatically inserting a \v before any string you search for
nnoremap / /\v
vnoremap / /\v
"  This gets rid of the distracting highlighting
nnoremap <leader><SPACE> :noh<CR>

" movement
" remap arrow keys in insert mode, so that they escape and move
inoremap <UP> <ESC>k
inoremap <DOWN> <ESC>j

" Command-line navigation
cnoremap <C-x> <RIGHT>
cnoremap <C-z> <LEFT>
" Ctrl+Left/Right to switch tabs
nnoremap <C-LEFT> gT
nnoremap <C-RIGHT> gt
" Control+Tab (+Shift, for reverse direction) to switch through tabs
noremap <C-TAB> gt
noremap <C-S-TAB> gT
" Control+t for new tab
nnoremap <C-t> :tabnew<CR>

" remap Shift+arrow in insert mode, escape and move, includes left/right
inoremap <S-UP> <ESC>k
inoremap <S-DOWN> <ESC>j
inoremap <S-RIGHT> <ESC>ll
inoremap <S-LEFT> <ESC>

" split helpers
" new horizontal split
nnoremap <leader>H <C-w>s
" new vertical split
nnoremap <leader>V <C-w>v<C-w>l
" split navigation mapped to CTRL (capslock remap?)
nnoremap <C-s-h> <C-w>h
nnoremap <C-S-j> <C-w>j
nnoremap <C-S-k> <C-w>k
nnoremap <C-S-l> <C-w>l

" locations list / Quickfix (next/prev error)
nnoremap <C-S-RIGHT> <ESC>:lnext<CR>
nnoremap <C-S-LEFT> <ESC>:lprevious<CR>
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

" fuzzy find
" https://github.com/junegunn/fzf/blob/master/README-VIM.md
" find most recently used files
nnoremap <C-R> :FZFMru
" find all files (using ripgrep)
nnoremap <C-F> :FZF
" find all files in git
nnoremap <C-f> :call fzf#run({'source': 'git ls-files', 'sink': 'e', 'down': '80%'})<cr>
" find all buffers
nnoremap <C-b> :call fzf#run({'source': map(range(1, bufnr('$')), 'bufname(v:val)'), 'sink': 'e', 'down': '80%'})<cr>
imap <c-x><c-l> <plug>(fzf-complete-line)
" https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

command! FZFMru call fzf#run({
\ 'source':  reverse(s:all_files()),
\ 'sink':    'edit',
\ 'options': '-m -x +s',
\ 'down':    '80%' })

function! s:all_files()
  return extend(
  \ filter(copy(v:oldfiles),
  \        "v:val !~ 'fugitive:\\|NERD_tree\\|^/tmp/\\|.git/'"),
  \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'))
endfunction

function! FzfCompletionPop(findstart, base)
  let l:res = function(&omnifunc)(a:findstart, a:base)

  if a:findstart
    return l:res
  endif

  return fzf#run({ 'source': l:res, 'down': '~40%', 'options': printf('--query "%s" +s', a:base) })
endfunction
imap <c-x><c-j> <c-o>:call FzfCompletionTrigger()<cr>

" -------------------------
" custom shortcuts: insert mode
" ------------------------
" this is a sexy little shortcut to break out of insert mode and save
inoremap ;; <ESC>l :w<CR>

" -------------------------
" custom shortcuts: normal mode
" ------------------------
" save
nnoremap ;; :w<CR>

" :suw = write as sudo
" http://www.catonmat.net/blog/top-ten-one-liners-from-commandlinefu-explained/
" :nmap :suw :w !sudo tee %

" yank to clipboard shortcut
nnoremap <leader>y "*y
" paste from clipboard shortcut
nnoremap <leader>v "*v

" ,ev edit vimrc file on the fly
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<CR>
" ,rv reload the vimrc file on the fly
nnoremap <leader>rv :source ~/.vimrc<CR>
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
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>
" ,a ag helper
nnoremap <leader>a :Ag
" ,ft HTML fold tag
nnoremap <leader>ft Vatzf
" ,S sort a list of CSS properties
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
" ,v reselect text that was just pasted
nnoremap <leader>v V`]`

" ,Y yank in word shortcut
nnoremap <leader>Y yiw
" ,R replace in word (keep the replacement in registry)
nnoremap <leader>R viwpyiw



" --------------------------------------------------------------------------------------------
" -- SpaceVim Initionalzation ----------------------------------------------------------------
" --------------------------------------------------------------------------------------------

" call SpaceVim#layers#load('lang#go')
" call SpaceVim#layers#load('lang#python')
" call SpaceVim#layers#load('lang#javascript')
" call SpaceVim#layers#load('lang#javascript-indent')
" call SpaceVim#layers#load('lang#json')

call SpaceVim#layers#load('ui')
