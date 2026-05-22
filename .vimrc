" ============================================================================
" Easy-Vim - 配置
" Copyright © 2026 zhangkai
" one line to give the program's name and a brief description

"Permission is hereby granted, free of charge, to any person obtaining
"a copy of this software and associated documentation files (the "Software"),
"to deal in the Software without restriction, including without limitation
"the rights to use, copy, modify, merge, publish, distribute, sublicense,
"and/or sell copies of the Software, and to permit persons to whom the
"Software is furnished to do so, subject to the following conditions:

"The above copyright notice and this permission notice shall be included
"in all copies or substantial portions of the Software.

"THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
"EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
"OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
"DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
"OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

" 致敬 Bram Moolenaar
" ============================================================================

" ============================================================================
" 基础设置
" ============================================================================
set nocompatible
filetype plugin indent on
syntax on

set number                      " 行号
set relativenumber              " 相对行号
set cursorline                  " 高亮当前行
set scrolloff=5                 " 滚动边距

set expandtab                   " Tab 转空格
set tabstop=4                   " Tab 宽度
set shiftwidth=4                " 缩进宽度
set softtabstop=4               " 退格删除空格
set autoindent                  " 自动缩进

set ignorecase                  " 搜索忽略大小写
set smartcase                   " 智能大小写
set incsearch                   " 实时搜索
set hidden                      " 允许隐藏缓冲区
set mouse=a                     " 启用鼠标

set wildmenu                    " 命令补全菜单
set wildmode=full               " 全匹配模式
set wildignorecase              " 忽略大小写
set showcmd                     " 显示输入的命令
set history=1000                " 命令历史

" ============================================================================
" 主题设置
" ============================================================================
set background=dark
colorscheme catppuccin

" 半透明优化（终端支持的话）
highlight Normal ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE

" ============================================================================
" 插件管理器 (vim-plug)
" ============================================================================
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo ' . data_dir . '/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" 核心插件
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

" 增强功能
Plug 'mhinz/vim-startify'
Plug 'kien/rainbow_parentheses.vim'
Plug 'voldikss/vim-floaterm'
Plug 'liuchengxu/vista.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'yggdroot/indentline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'liuchengxu/vim-which-key'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'preservim/tagbar'
Plug 'puremourning/vimspector'
Plug 'junegunn/vim-easy-align'
Plug 'ghifarit53/tokyonight-vim'
Plug 'luochen1990/rainbow'
" 语言支持（coc 会自动处理 LSP，这些只需要语法高亮）
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'elzr/vim-json'
Plug 'vim-python/python-syntax'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'

call plug#end()

" ============================================================================
" 插件配置
" ============================================================================

" airline 状态栏
let g:airline_powerline_fonts = 1
let g:airline_theme = 'catppuccin'
let g:airline_section_c = '%f'
let g:airline_section_y = ''
let g:airline_section_z = '%l:%c'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" NERDTree
let NERDTreeShowHidden = 1

" indentline
let g:indentLine_char = '│'

" tagbar
let g:tagbar_width = 30
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1

" vimspector 调试器
let g:vimspector_sidebar_width = 50
let g:vimspector_bottombar_height = 15
let g:vimspector_code_minwidth = 90

" 括号高亮自动加载
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces
" -- vim-rainbow 插件配置
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['#7AA2F7', '#9D7CD8', '#4FD6BE', '#E0AF68', '#F7768E'],
\   'ctermfgs': ['blue', 'magenta', 'cyan', 'yellow', 'red'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['#7AA2F7', '#9D7CD8', '#4FD6BE', '#E0AF68', '#F7768E'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}


" ============================================================================
" 快捷键
" ============================================================================
let mapleader = " "

" 基础操作
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>h :nohlsearch<CR>

" 文件树
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

" 搜索 (fzf)
nnoremap <leader>p :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>/ :Rg<CR>

" 注释
nmap <leader>c gcc
vmap <leader>c gc

" 窗口导航
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" 调试 (vimspector)
nmap <F5> <Plug>VimspectorContinue
nmap <F9> <Plug>VimspectorToggleBreakpoint
nmap <F10> <Plug>VimspectorStepOver
nmap <F11> <Plug>VimspectorStepInto
nmap <F12> <Plug>VimspectorStepOut
nmap <leader>dr <Plug>VimspectorRestart
nmap <leader>dq <Plug>VimspectorStop

" 终端 (floaterm)
nnoremap <F7> :FloatermToggle<CR>
tnoremap <F7> <C-\><C-n>:FloatermToggle<CR>

" tagbar
nnoremap <F8> :TagbarToggle<CR>

" 对齐
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" 快捷键提示
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" ============================================================================
" COC 补全配置
" ============================================================================
" Tab 补全
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" 代码导航
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" 代码操作
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>f  <Plug>(coc-format)
nmap <leader>ac <Plug>(coc-codeaction-cursor)
xmap <leader>ac <Plug>(coc-codeaction-selected)
nmap <leader>qf <Plug>(coc-fix-current)

" 悬浮文档
nnoremap <silent> K :call CocAction('doHover')<CR>
nnoremap <silent> <leader>k :call CocAction('doHover')<CR>

" 跳转回来
nnoremap <leader>bk <C-o>

" 自动签名提示
autocmd CursorHoldI * silent! call CocActionAsync('showSignatureHelp')

" ============================================================================
" 自动命令
" ============================================================================
" 自动切换目录
autocmd BufEnter * silent! lcd %:p:h

" 保存时删除末尾空格
autocmd BufWritePre * :%s/\s\+$//e

" 重载配置
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" ============================================================================
" 界面美化
" ============================================================================
" 状态栏颜色
highlight StatusLine   cterm=NONE ctermfg=252 ctermbg=238 guifg=#D0D0D0 guibg=#444444
highlight StatusLineNC cterm=NONE ctermfg=245 ctermbg=235 guifg=#8A8A8A guibg=#262626

" 补全框颜色
highlight Pmenu ctermbg=235 guibg=#262626
highlight PmenuSel ctermbg=238 guibg=#444444 ctermfg=255 guifg=#FFFFFF cterm=bold gui=bold
highlight PmenuSbar ctermbg=233 guibg=#121212
highlight PmenuThumb ctermbg=250 guibg=#BCBCBC
" ============================================================================
" 深色冷静系 - TokyoNight
" ============================================================================
set termguicolors
set background=dark
colorscheme tokyonight

" airline 状态栏主题
let g:airline_theme = 'tokyonight'
let g:airline_powerline_fonts = 1
let g:airline_section_c = '%f'
let g:airline_section_y = ''
let g:airline_section_z = '%l:%c'

" 补全框颜色（匹配 TokyoNight）
highlight Pmenu guibg=#1A1B26
highlight PmenuSel guibg=#33467C guifg=#FFFFFF gui=bold
highlight PmenuSbar guibg=#0F0F14
highlight PmenuThumb guibg=#3B4261

" 行号区域颜色（可选）
highlight LineNr guifg=#3B4261 guibg=NONE
highlight CursorLineNr guifg=#7AA2F7 gui=bold
