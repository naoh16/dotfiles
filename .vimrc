" An example for a vimrc file.
"
" Last Modified: 2014/05/14 19:29:33.
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")


set ai tabstop=4 showmode
"if exists("syntax")
	syntax on
"endif
set nobackup
cnoremap <C-x> <C-r>=expand('%:p:h')<CR>/

" comment out 2007.07.05
"" 日本語を扱うために必要
"set encoding=japan
"" ファイルの漢字コード自動判別のために必要。(要iconv)
"if has('iconv')
"  set fileencodings+=iso-2022-jp
"  set fileencodings+=utf-8,ucs-2le,ucs-2
"  if &encoding ==# 'euc-jp'
"    set fileencodings+=cp932
"  else
"    set fileencodings+=euc-jp
"  endif
"endif

""""""""""""""""""""""""""""""""""""""""""""""""
"  文字コードの自動認識                        "
"  http://www.kawaz.jp/pukiwiki/?vim#cb691f26  "
""""""""""""""""""""""""""""""""""""""""""""""""
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif
""""""""""""""""""""""""""""""""""""""""""""""""
"  文字コードの自動認識  ここまで              "
""""""""""""""""""""""""""""""""""""""""""""""""

" ステータスラインに文字コードと改行文字を表示する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" テンプレートから新規作成
autocmd BufNewFile *.pl 0r ~/_vim/template/skel.pl
autocmd BufNewFile *.sh 0r ~/_vim/template/skel.sh
autocmd BufNewFile *.html 0r ~/_vim/template/skel.html
autocmd BufNewFile *.xml 0r ~/_vim/template/skel.xml

" 辞書の設定
autocmd FileType sh set dictionary+=$VIMRUNTIME/syntax/sh.vim
autocmd FileType php set dictionary+=$VIMRUNTIME/syntax/php.vim
autocmd FileType perl set dictionary+=$VIMRUNTIME/syntax/perl.vim
autocmd FileType java set dictionary+=$VIMRUNTIME/syntax/java.vim

" 日付挿入マクロ (Last Modified: .)
source ~/_vim/plugin/autodate.vim
let autodate_format = '%Y/%m/%d %H:%M:%S'
let autodate_keyword_pre = 'Last Modified:'

" 対応カッコの点滅 matchtimeは1/10単位
set showmatch
set matchtime=3

" コマンドラインの補完候補の表示
set wildmenu

" 行の折り返しで見た目の行に移動
:nnoremap j gj
:nnoremap k gk
:nnoremap <Up> gk
:nnoremap <Down> gj

set clipboard+=unnamed

" 日本語入力パッチ(im_custom)の設定
if has('im_custom')
"  set imoptions=canna,serv:pe01:0
endif

set ts=4 sw=4 sts=0

"バイナリ編集(xxd)モード（vim -b での起動、もしくは *.bin,*.raw を開くと発動します）
augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPre  *.raw let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r | endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END

" ステータスラインを常に表示
" （編集中のファイル名が常に確認できるようになる）
set laststatus=2

" バッファの移動
" F2: 前のバッファ
" F3: 次のバッファ
" F4: バッファ削除

set <F2>=[12~
set <F3>=[13~
set <F4>=[14~
" set <F5>=[15~
" set <F6>=[17~

map <F2> <ESC>:bp<CR>
map <F3> <ESC>:bn<CR>
map <F4> <ESC>:bw<CR>

" タブエディタ風の管理
source ~/_vim/plugin/buftabs.vim
let g:buftabs_only_basename=1
let g:buftabs_in_statusline=1
map <C-h> :bprev<CR>
map <C-l> :bnext<CR>

" コンパイラ指定
autocmd FileType perl compiler perl
set <F7>=[18~
map <F7> <ESC>:make<CR>:cw 3<CR>

" TagList
source ~/_vim/plugin/taglist.vim
let Tlist_Use_Right_Window=1
set <F10>=[21~
map <F10> <ESC>:TlistToggle<CR><C-W><C-W>

"{{{ ColorScheme for Teraterm
set term=builtin_linux
set ttytype=builtin_linux
"colorscheme torte
colorscheme desert
syntax on
"}}}

set number

" vim: foldmethod=marker

" Enable <DEL> key of Mac OS X for the Debian server
"set t_kD=
set t_kb=

" Enable matchit
" 対応する括弧に移動するコマンド「%」を拡張するマクロ
source $VIMRUNTIME/macros/matchit.vim

" Install NeoBundle
" git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
set nocompatible
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

" auto syntax check
NeoBundle 'scrooloose/syntastic'

filetype plugin indent on
syntax on
NeoBundleCheck

