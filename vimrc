" vim: set foldmethod=marker:  " modelineを設定する

set encoding=utf-8
scriptencoding utf-8

" ========== keymap prefix =========={{{
" let mapleader = \"\<Space>"
nnoremap [misc] <nop>
nmap <Space><Space> [misc]
" }}}
" ========== keymap & cmd =========={{{
"open HEX mode
nnoremap [misc]ho :%!xxd<CR>
"close HEX mode
nnoremap [misc]hc :%!xxd -r<CR>
"reopen file with new encoding
nnoremap [misc]enc :e ++enc=

nnoremap <ESC><ESC> :nohlsearch<CR><Esc>
noremap - o<Esc>
" }}}
" ========== settings =========={{{
set fileencodings=utf-8,sjis,ucs-bom,default,euc-jp,cp932,latin1
set backspace=indent,eol,start
set browsedir=current
set diffopt+=vertical
set formatoptions+=B
set helplang=ja,en
set history=127
set tags=./tags;
set clipboard=unnamedplus,autoselect
set guioptions+=a
set guioptions-=T
set wildmenu
set wildmode=list:full
" set foldmethod=syntax
set laststatus=2
set visualbell t_vb=
set noerrorbells
" set completeopt=menuone,preview
set completeopt=menu,preview
set wildignore=*.o,*.obj,*.swp,*.zip,*.tar.gz,*.a
let g:vim_indent_cont = 0
set modelines=3

" search
set ignorecase
set smartcase
set incsearch
set hlsearch

" tab to space
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab   " use soft tab
filetype plugin indent on

set conceallevel=0
set concealcursor=nc

if executable('jvgrep')
    set grepprg=jvgrep
endif

set list
set listchars+=tab:>-\ ,eol:↲,trail:_,extends:»,precedes:«,nbsp:%
set nowrap
set showmatch
set cursorline cursorcolumn
set colorcolumn=+1,78,120
set number relativenumber
set spelllang=en,cjk
" }}}
" ========== gui =========={{{
augroup GuiRunning
    autocmd!
    if has("gui_running")
        set columns=100
        set lines=32
        set gfn=cica:h12
        " autocmd GUIEnter * set transparency=235
        " autocmd FocusGained * set transparency=235
        " autocmd FocusLost * set transparency=215
    endif
augroup END
" }}}
" ========== xxd (binary mode) =========={{{
" More detail, See :help hex-editing
" vim -b : edit binary using xxd-format!
augroup Binary
	autocmd!
	autocmd BufReadPre   *.bin,*.exe let &bin=1
	autocmd BufReadPost  *.bin,*.exe if &bin | %!xxd
	autocmd BufReadPost  *.bin,*.exe set ft=xxd | endif
	autocmd BufWritePre  *.bin,*.exe if &bin | %!xxd -r
	autocmd BufWritePre  *.bin,*.exe endif
	autocmd BufWritePost *.bin,*.exe if &bin | %!xxd
	autocmd BufWritePost *.bin,*.exe set nomod | endif
augroup END
" }}}
" ========== quickfix =========={{{
augroup MyQuickFix
    autocmd!
    autocmd QuickFixCmdPost make,grep,grepadd,vimgrep copen
augroup END
command! -bang MySearchToQf execute (<bang>0 ? 'vimgrepadd' : 'vimgrep') '//gj %' | cwindow
" }}}