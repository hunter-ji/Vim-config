
" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" airline的buffers切换ctrl+b+p/n
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
let g:airline_theme="molokai"
"""set nocompatible
set modeline
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
call vundle#end()
filetype plugin indent on

let mapleader = ","
let g:mapleader = ","

" 系统剪切板
set clipboard=unnamed


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>



set nu
set encoding=utf-8
:set tabstop=8 expandtab shiftwidth=4 softtabstop=4
set pastetoggle=<F8>
"""set ts=4
"""set sw=4
"""set smartindent
"""set laststatus=2

Plugin 'Valloric/YouCompleteMe'
Plugin 'flazz/vim-colorschemes'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'python.vim'                                             
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'junegunn/vim-easy-align'



let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

colorscheme molokai

" 自动补全括号括号
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>
inoremap < <><LEFT>
inoremap {% {%%}<LEFT>



"==== F3 NERDTree 切换
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC>:NERDTreeToggle<CR>

"taglist快捷键
map <silent> <F7> :TlistToggle<cr> 

function HeaderPython()
    call setline(1, "#!/usr/bin/python")
    call append(1, "# -*- coding: utf-8 -*-")
    normal G
    normal o
endf
autocmd bufnewfile *.py call HeaderPython()

autocmd bufnewfile *.html 0r ~/.vim/template/simple.html
autocmd bufnewfile *.md 0r ~/.vim/template/simple.md
autocmd bufnewfile *.js 0r ~/.vim/template/simple.js


Bundle 'docunext/closetag.vim'
let g:closetag_html_style=1

"""Markdown
let g:vim_markdown_folding_style_pythonic = 1

"""直接运行python
map <F5> :!python3 %<CR>

vmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
  let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }
