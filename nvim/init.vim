if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'ambv/black'
Plug 'scrooloose/nerdcommenter'
Plug 'regedarek/ZoomWin'
Plug 'rhysd/vim-clang-format'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'easymotion/vim-easymotion'
Plug 'rakr/vim-one'
Plug 'arcticicestudio/nord-vim'
Plug 'vimwiki/vimwiki'
Plug 'lervag/vimtex'
call plug#end()

" colorscheme nord

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

"Tell nvim about OpenCL files
autocmd BufEnter *.cl :setlocal filetype=c

"Vim airline
let g:airline#extensions#tabline#enabled = 1

"Useful shortcuts
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>p :Files<CR>
nnoremap <leader>b :Buffers<CR>

nnoremap <silent> <Leader>s :split<CR>
nnoremap <silent> <Leader>v :vsplit<CR>
nnoremap <silent> <Leader>q :close<CR>

"Coc
let g:coc_global_extensions = ['coc-pyright']
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call   CocAction('format')
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" gh - get hint on whatever's under the cursor
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Vimwiki
let g:vimwiki_list = [{'path':'~/Dropbox/wiki', 'path_html':'~/Dropbox/export/html/'}]

" Vimtex
let g:vimtex_view_method = 'mupdf'

