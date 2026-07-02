" ~/.config/nvim/init.vim — managed by chezmoi
"
" Alan Blount / zeroasterisk
" Split into modular files sourced from ~/.config/nvim/

source ~/.config/nvim/plugins.vim
source ~/.config/nvim/options.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/plugin_config.vim

" ----------------------------------------------------------------------------
" ABBREVIATIONS
" ----------------------------------------------------------------------------

cnoremap $c e <C-\>eCurrentFileDir()<CR>
function! CurrentFileDir()
   return "e " . expand("%:p:h") . "/"
endfunction

abbr conosle console
abbr comopnent component

autocmd BufEnter *.py  iabbr xxx print('XXX
autocmd BufEnter *.py  iabbr yyy print('YYY
autocmd BufEnter *.py  iabbr zzz print('ZZZ
autocmd BufEnter *.js  iabbr xxx console.log('XXX',
autocmd BufEnter *.js  iabbr yyy console.log('YYY',
autocmd BufEnter *.js  iabbr zzz console.log('ZZZ',

" ----------------------------------------------------------------------------
" CUSTOM COMMANDS
" ----------------------------------------------------------------------------

command! Q q
command! W w
command! TEOL %s/\s\+$//
command! CLEAN retab | TEOL
command! BufCloseOthers %bd|e#

" ----------------------------------------------------------------------------
" COLORS
" ----------------------------------------------------------------------------

set background=dark
set termguicolors
let g:gruvbox_italic=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme gruvbox

syntax on

highlight SpecialKey     ctermbg=Yellow guibg=Yellow
highlight PmenuSel       ctermfg=black ctermbg=magenta
highlight clear SignColumn
highlight link SignColumn Ignore
highlight def link MyTagListFileName Statement
highlight def link MyTagListTagName Question
highlight def link xmlCdata NONE
highlight link markdownH1        PreProc
highlight link markdownH2        PreProc
highlight link markdownLink      Character
highlight link markdownBold      String
highlight link markdownItalic    Statement
highlight link markdownCode      Delimiter
highlight link markdownCodeBlock Delimiter

" ----------------------------------------------------------------------------
" FILE TYPE TRIGGERS
" ----------------------------------------------------------------------------

augroup vimrc
autocmd!

au BufNewFile,BufRead *.json    set ft=json tw=0
au BufNewFile,BufRead *.md      setlocal ft=markdown nolist spell
au BufNewFile,BufRead *.md,*.markdown setlocal foldlevel=999 tw=0 nocin
au BufNewFile,BufRead *.xml     setlocal ft=xml ts=2 sw=2 et
au BufNewFile,BufRead *.zsh     setf zsh
au BufNewFile,BufRead *.sass    setf sass
au BufNewFile,BufRead *.less    setlocal ft=less nocindent smartindent
au BufNewFile,BufRead *.html    setlocal nocindent smartindent
au BufNewFile,BufRead *.rb      setlocal noai
au BufNewFile,BufRead *.ini     setf conf
au BufNewFile,BufRead *.plist   setf xml
au BufNewFile,BufRead *.cson    set ft=coffee
au BufNewFile,BufRead *.glsl    setf glsl
au BufNewFile,BufRead *.gyp     set ft=python
au BufNewFile,BufRead *templates/*.html setf htmldjango
au BufNewFile,BufRead .gitconfig* setlocal ft=gitconfig nolist ts=4 sw=4 noet
au BufNewFile,BufRead COMMIT_EDITMSG setlocal nolist nonumber
au BufNewFile,BufRead Makefile  setlocal nolist

au FileType gitcommit setlocal nolist ts=4 sts=4 sw=4 noet tw=80
au FileType json      setlocal conceallevel=0 foldmethod=syntax foldlevel=999
au FileType make      setlocal nolist ts=4 sts=4 sw=4 noet
au FileType markdown  syn sync fromstart

augroup END

autocmd BufWritePre * :%s/\s\+$//e

" ----------------------------------------------------------------------------
" LOCAL OVERRIDES
" ----------------------------------------------------------------------------

function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction

call SourceIfExists("~/.vimrc.local")
call SourceIfExists("~/.vimlocal")

" ── Prose mode (distraction-free writing) ─────────────────────────────────────
function! ProseMode()
  call goyo#execute(0, [])
  set spell noci nosi noai nolist noshowmode noshowcmd
  set complete+=s
  set bg=light
  colorscheme solarized
endfunction
command! ProseMode call ProseMode()

silent! nohlsearch
