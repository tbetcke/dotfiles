set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'ambv/black'
Plugin 'scrooloose/nerdcommenter'
Plugin 'regedarek/ZoomWin'
Plugin 'rhysd/vim-clang-format'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Fix 256 colors for Mobaxterm
set t_ut=

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix

set encoding=utf-8
set number

syntax on
filetype on

"Powerline
set laststatus=2

"Tell vim about OpenCL files
autocmd BufEnter *.cl :setlocal filetype=c

