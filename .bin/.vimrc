"----------------------------------------
" Refs:
" - https://qiita.com/iwaseasahi/items/0b2da68269397906c14c
"----------------------------------------
"
" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start

" 全角文字専用の設定
set ambiwidth=double

"----------------------------------------
" 検索
"----------------------------------------
" 検索するときに大文字小文字を区別しない
set ignorecase
" 小文字で検索すると大文字と小文字を無視して検索
set smartcase
" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set wrapscan
" インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set incsearch
" 検索結果をハイライト表示
set hlsearch

"----------------------------------------
" 表示設定
"----------------------------------------
" 対応する括弧やブレースを表示
set showmatch matchtime=1

" ステータス行を常に表示
set laststatus=2

" タブ文字を CTRL-I で表示し、行末に $ で表示する
set list

" 行末のスペースを可視化
set listchars=tab:^\ ,trail:~

" コマンドラインの履歴を10000件保存する
set history=10000

" コメントの色を水色
hi Comment ctermfg=3

" 入力モードでTabキー押下時に半角スペースを挿入
set expandtab

" インデント幅
set shiftwidth=2

" タブキー押下時に挿入される文字幅を指定
set softtabstop=2

" ファイル内にあるタブ文字の表示幅
set tabstop=2

" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent

" スワップファイルを作成しない
set noswapfile

" タイトルを表示
set title

" 行番号の表示
set number

if has("syntax")
  syntax on
endif

