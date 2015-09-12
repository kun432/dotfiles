set nocompatible               " vi互換モードをOFF

syntax on                      " シンタックスハイライト
colorscheme hybrid             " カラースキーマ
set t_Co=256                   " 256色ターミナル指定

" 文字エンコーディング関連
set encoding=utf-8                              " 内部エンコーディングをUTF-8にする
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis " エンコーディング自動判定
set fileformats=unix,dos,mac                    " 改行コード自動判定

set hidden                     " 変更中のファイルでも、保存しないで他のファイルを表示

set expandtab                  " タブをスペースに置き換える
set tabstop=4                  " タブを4文字分で表示
set shiftwidth=4               " 自動的に挿入されるインデントを4文字分
set softtabstop=4              " タブキーを押したときに挿入されるスペースを4文字とする

set number                     " 行番号を表示
set ruler                      " 現在のカーソル位置を表示

set hlsearch                   " 検索結果をハイライト表示
set incsearch                  " インクリメンタル検索
set autoindent                 " 自動インデント
set smartindent                " より賢いインデント

set backspace=indent,eol,start " バックスペースで各種消せるようにする

set list                       " 不可視文字を表示
set listchars=tab:▸\ ,trail:ப,eol:↲,extends:»,precedes:«,nbsp:% " 不可視文字の表示文字を指定
highlight SpecialKey cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta

"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif
set cursorline                 " 現在行をハイライト

set ignorecase                 " 大文字小文字を区別しない
set smartcase                  " 大文字で検索されたら対象を大文字限定にする

"set nowrap                     " 画面の端行で折り返さない
set whichwrap=h,l              " 行末をh,lで跨いで移動

set showmatch                  " 括弧を閉じたときに対応する括弧を表示する

set nowrapscan                 " 検索がファイル末尾まで進んでもファイル先頭に戻らない

set history=2000               " コマンド履歴

helptags ~/.vim/doc            " ヘルプファイルのパス
set helplang=ja,en             " ヘルプの表示言語の優先度

" ESC,ESCで検索ハイライトを消す
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" 検索時、/でも?でも、nとNの方向を同じにする
nnoremap <expr> n <SID>search_forward_p() ? 'nzv' : 'Nzv'
nnoremap <expr> N <SID>search_forward_p() ? 'Nzv' : 'nzv'
vnoremap <expr> n <SID>search_forward_p() ? 'nzv' : 'Nzv'
vnoremap <expr> N <SID>search_forward_p() ? 'Nzv' : 'nzv'
function! s:search_forward_p()
  return exists('v:searchforward') ? v:searchforward : 1
endfunction

" ステータスライン
set laststatus=2
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [FORMAT=%{&ff}]\ [ENCODE=%{&fileencoding}]\ [POS=%l,%v][%p%%]\ [LEN=%L]

" vimrc保存で自動的に反映
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

" ペースト時にインデントさせない、かつ、インサートモードから抜けるとnopasteモードに戻る
imap <F11> <nop>
set pastetoggle=<F11>
autocmd InsertLeave * set nopaste

" Neobundle
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'Shougo/unite.vim'    " ファイルオープンを便利にする
NeoBundle 'Shougo/neomru.vim'   " Unite.vimで最近使ったファイルを表示
NeoBundle 'scrooloose/nerdtree' " ファイルをツリー表示 :NERDTree
NeoBundle 'tpope/vim-endwise'   " Ruby向けにendを自動挿入してくれる
" コメントON/OFFをShift+V, Ctrl+- * 2回で手軽に実行
NeoBundle 'tomtom/tcomment_vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
"  " this will conveniently prompt you to install them.
NeoBundleCheck

" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

