" ----------------------------------------------------------------------------
" KEY MAPS
" ----------------------------------------------------------------------------

" Useful macros I use the most
nmap \A :set formatoptions+=a<CR>:echo "autowrap enabled"<CR>
nmap \M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
nmap \T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
nmap \a :set formatoptions-=a<CR>:echo "autowrap disabled"<CR>
nmap \b :set nocin tw=80<CR>:set formatoptions+=a<CR>
nmap \c :call TmuxPaneClear()<CR>
nmap \d :ALEToggleBuffer<CR>
nmap \e :NERDTreeToggle<CR>
nmap \f mt:Goyo<CR>'tzz
nmap \g :Gstatus<CR>
nmap \i vip:sort<CR>
nmap \l :setlocal number!<CR>:setlocal number?<CR>
nmap \m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
nmap \o :set paste!<CR>:set paste?<CR>
nmap \p :ProseMode<CR>
nmap \q :nohlsearch<CR>
nmap \r :call TmuxPaneRepeat()<CR>
nmap \s :setlocal invspell<CR>
nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap \u :setlocal list!<CR>:setlocal list?<CR>
nmap \w :setlocal wrap!<CR>:setlocal wrap?<CR>
nmap \x :cclose<CR>
nmap \z :w<CR>:!open %<CR><CR>

" Turn off linewise keys. Normally, the `j' and `k' keys move the cursor down one entire line. with
" line wrapping on, this can cause the cursor to actually skip a few lines on the screen because
" it's moving from line N to line N+1 in the file. I want this to act more visually -- I want `down'
" to mean the next line on the screen
nmap j gj
nmap k gk

" You don't know what you're missing if you don't use this.
nmap <C-e> :e#<CR>

" Move between open buffers.
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>

" Emacs-like bindings in normal mode
nmap <C-x>0 <C-w>c
nmap <C-x>1 <C-w>o
nmap <C-x>1 <C-w>s
nmap <C-x>1 <C-w>v
nmap <C-x>o <C-w><C-w>
nmap <M-o>  <C-w><C-w>

" Emacs-like bindings in insert mode
imap <C-e> <C-o>$
imap <C-a> <C-o>0

" Emacs-like bindings in the command line from `:h emacs-keys`
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Del>
cnoremap <C-e>  <End>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>

" Use the space key to toggle folds
nnoremap <space> za
vnoremap <space> zf

" Super fast window movement shortcuts
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" Resize panes when window/terminal gets resize
autocmd VimResized * :wincmd =

" After visual selection, move, maintain selection
vnoremap > >gv
vnoremap < <gv

" Search for the word under the cursor in the current directory
nmap <M-k>    mo:Ack! "\b<cword>\b" <CR>
nmap <Esc>k   mo:Ack! "\b<cword>\b" <CR>
nmap ˚        mo:Ack! "\b<cword>\b" <CR>
nmap <M-S-k>  mo:Ggrep! "\b<cword>\b" <CR>
nmap <Esc>K   mo:Ggrep! "\b<cword>\b" <CR>

" Alt-W to delete a buffer and remove it from the list but keep the window via bufkill.vim
nmap <Esc>w :BD<CR>
nmap ∑      :BD<CR>

" Quickly fix spelling errors choosing the first result
nmap <Leader>z z=1<CR><CR>

" Fix annoyances in the QuickFix window, like scrolling too much
autocmd FileType qf setlocal number nolist scrolloff=0
autocmd Filetype qf wincmd J " Makes sure it's at the bottom of the vim window

" These are things that I mistype and want ignored.
nmap Q  <silent>
nmap q: <silent>
nmap K  <silent>

" Make the cursor stay on the same line when window switching
function! KeepCurrentLine(motion)
  let theLine = line('.')
  let theCol = col('.')
  exec 'wincmd ' . a:motion
  if &diff
    call cursor(theLine, theCol)
  endif
endfunction
nnoremap <C-w>h :silent call KeepCurrentLine('h')<CR>
nnoremap <C-w>l :silent call KeepCurrentLine('l')<CR>

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
" noremap <C-TAB> gt
" noremap <C-S-TAB> gT
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
" https://github.com/junegunn/fzf.vim#commands
" find most recently used files via v:oldfiles
nnoremap <c-p> :History<cr>
" find most recently used files
nnoremap <leader>f ProjectMru --tiebreak=end
" find all files (using ripgrep)
nnoremap <C-F> :Files<cr>
" find all files in git
nnoremap <C-f> :GFiles<cr>
" ^ALT nnoremap <C-f> :call fzf#run({'source': 'git ls-files', 'sink': 'e', 'down': '80%'})<cr>
" find all files in git status (changed, untracked, etc, files)
nnoremap <C-g> :GFiles?<cr>
" find all buffers
nnoremap <C-b> :Buffers<cr>
" ^ALT nnoremap <C-b> :call fzf#run({'source': map(range(1, bufnr('$')), 'bufname(v:val)'), 'sink': 'e', 'down': '80%'})<cr>
" find all lines in all buffers
nnoremap <C-B> :Lines<cr>
" find all Marks
nnoremap <C-m> :Marks<cr>
" find all Commits for the current buffer
nnoremap <C-G> :BCommits<cr>
" find all Commits for project
nnoremap <leader>G :Commits<cr>
" playing with insert mode completions (WIP)
imap <c-x><c-j> <c-o>:call FzfCompletionTrigger()<cr>
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})" -------------------------
" Replace the default dictionary completion with fzf-based fuzzy completion
function! s:make_sentence(lines)
  return substitute(join(a:lines), '^.', '\=toupper(submatch(0))', '').'.'
endfunction

inoremap <expr> <c-x><c-s> fzf#complete({
  \ 'source':  'cat /usr/share/dict/words',
  \ 'reducer': function('<sid>make_sentence'),
  \ 'options': '--multi --reverse --margin 15%,0',
  \ 'left':    20})

" vim-test shortcuts
" https://github.com/janko-m/vim-test
"  :TestNearest
"    In a test file runs the test nearest to the cursor, otherwise runs the last nearest test. In test frameworks that don't support line numbers it will polyfill this functionality with regexes.
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

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
