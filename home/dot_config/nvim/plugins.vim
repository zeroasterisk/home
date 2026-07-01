" ~/.config/nvim/plugins.vim — managed by chezmoi
" vim-plug: auto-installs itself if missing

let data_dir = stdpath('data') . '/site'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')

" ── Colorschemes ──────────────────────────────────────────────────────────────
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'

" ── UI ────────────────────────────────────────────────────────────────────────
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'
Plug 'nathanaelkane/vim-indent-guides'

" ── Navigation / search ───────────────────────────────────────────────────────
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'haya14busa/incsearch.vim'
Plug 'mileszs/ack.vim'

" ── Git ───────────────────────────────────────────────────────────────────────
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" ── Editing ───────────────────────────────────────────────────────────────────
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sleuth'
Plug 'wellle/targets.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'ervandew/supertab'

" ── Linting ───────────────────────────────────────────────────────────────────
Plug 'w0rp/ale'

" ── Language support ──────────────────────────────────────────────────────────
Plug 'sheerun/vim-polyglot'
Plug 'elixir-editors/vim-elixir'
Plug 'jparise/vim-graphql'
Plug 'ap/vim-css-color'
Plug 'alampros/vim-styled-jsx'
Plug 'docunext/closetag.vim'

" ── tmux ──────────────────────────────────────────────────────────────────────
Plug 'tmux-plugins/vim-tmux-focus-events'

" ── Optional extras — uncomment to activate ───────────────────────────────────
" Plug 'slashmili/alchemist.vim'   " Elixir — superseded by LSP
" Plug 'statico/vim-inform7'
" Plug 'mhinz/vim-janah'

call plug#end()
