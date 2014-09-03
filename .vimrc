set nocompatible               " vi互換モードをOFF

syntax on                      " シンタックスハイライト

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

set ignorecase                 " 大文字小文字を区別しない
set smartcase                  " 大文字で検索されたら対象を大文字限定にする

set nowrap                     " 画面の端行で折り返さない
set whichwrap=h,l              " 行末をh,lで跨いで移動

set showmatch                  " 括弧を閉じたときに対応する括弧を表示する

set nowrapscan                 " 検索がファイル末尾まで進んでもファイル先頭に戻らない

set history=2000               " コマンド履歴

helptags ~/.vim/doc            " ヘルプファイルのパス
set helplang=ja,en             " ヘルプの表示言語の優先度

colorscheme hybrid             " カラースキーマ
set t_Co=256                   " 256色ターミナル指定
