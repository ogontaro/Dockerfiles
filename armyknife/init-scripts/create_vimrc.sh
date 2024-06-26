#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

cat <<EOF >~/.vimrc
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Set tab width to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab
" Enable auto-indentation
set autoindent
set smartindent
" Set search to be case insensitive unless using capital letters
set ignorecase
set smartcase
" Enable mouse support
set mouse=a
" Enable line wrapping
set wrap
" Highlight current line
set cursorline
" Set status bar
set laststatus=2
" Enable clipboard support
set clipboard=unnamedplus
" Set backup options
set backup
set backupdir=~/.vim/backups
set undodir=~/.vim/undo
set undofile
" Set encoding
set encoding=utf-8
" Set colorscheme
colorscheme desert
" Set command-line height
set cmdheight=1
" Reduce time waiting for a mapped sequence to complete
set timeoutlen=1000
" Enable file type detection
filetype plugin on
filetype indent on
" Set the ruler (display line and column number)
set ruler
EOF
