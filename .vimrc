syntax on
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
filetype plugin on
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

Plugin 'Valloric/YouCompleteMe'
Plugin 'flazz/vim-colorschemes'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'python.vim'                                             
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'junegunn/vim-easy-align'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tpope/vim-surround'

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

colorscheme molokai

" F3 NERDTree 切换
map <F3> :NERDTreeToggle<CR>
map <F3> :NERDTreeToggle<CR>

function HeaderPython()
    call setline(1, "#!/usr/bin/python")
    call append(1, "# -*- coding: utf-8 -*-")
    normal G
    normal o
endf
autocmd bufnewfile *.py call HeaderPython()

autocmd bufnewfile *.html 0r ~/.vim/template/simple.html
"""autocmd bufnewfile *.md 0r ~/.vim/template/simple.md
"""autocmd bufnewfile *.js 0r ~/.vim/template/simple.js


""""Bundle 'docunext/closetag.vim'

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

let g:NERDSpaceDelims = 1


set foldmethod=indent
set foldlevel=99

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

"""自动补全括号
function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf

function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
 endif
endf

function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 "Inserting a quoted quotation mark into the string
 return a:char
 elseif line[col - 1] == a:char
 "Escaping out of the string
 return "\<Right>"
 else
 "Starting a string
 return a:char.a:char."\<Esc>i"
 endif
endf

"""折叠代码
set foldmethod=indent
au BufWinLeave * silent mkview  
au BufRead * silent loadview    
nnoremap <space> za     
let g:SimpylFold_docstring_preview = 1

" taglist
map <silent> <F4> :TlistToggle<cr>

" 快速插入
execute pathogen#infect()
