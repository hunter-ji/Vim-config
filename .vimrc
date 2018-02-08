syntax on

" irline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" airline的buffers切换ctrl+b+p/n
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>

" 配色
let g:airline_theme="molokai"

" set nocompatible
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

" split navigations
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
Plugin 'othree/html5.vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/syntastic'
Plugin 'lepture/vim-jinja'

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

colorscheme molokai
" F3 NERDTree 切换
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
" \nt                 打开nerdree窗口，在左侧栏显示
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
let g:netrw_home='~/bak'
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end

" 文件格式
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

" 进入窗口高亮当前行
autocmd WinEnter * set cursorline
" 离开窗口取消高亮
autocmd WinLeave * set nocursorline
" 插入模式取消高亮
autocmd InsertEnter * set nocursorline
" 离开插入模式恢复高亮
autocmd InsertLeave * set cursorline

" 快速跳转
let g:ctrlp_map = '<c-p>' 
let g:ctrlp_cmd = 'CtrlP'
    " 设置过滤不进行查找的后缀名 
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$' 


" 替换esc为jk
inoremap <esc> <esc>l
inoremap jk <esc>l

" 滚屏 
nnoremap <c-h> zh
nnoremap <c-l> zl
nnoremap <c-j> <c-e>
nnoremap <c-k> <c-y>

inoremap <c-h> <left>
inoremap <c-l> <right>
inoremap <c-j> <down>
inoremap <c-k> <up>

cnoremap <c-h> <left>
cnoremap <c-l> <right>
cnoremap <c-j> <down>

" vim-jinja
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja
