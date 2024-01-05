" 日本語コード/改行コード
" NOTE: 開きなおしたいなら，":e ++enc=cp932 ++ff=dos"を実行すればよい
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,cp932,utf-8,utf-16le,utf-16
set fileformats=unix,dos,mac

" ハイライトの有効化
syntax on

" タブストップ等の設定
" modelineを有効にしてファイルごとの設定も有効にする
set modeline
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
" 言語ごとの調整
autocmd FileType python set expandtab

" ステータスラインに文字コードと改行文字を表示する
set laststatus=2
set statusline=%f%m%r%h%w\ %<%=[0x%02B]\ [L%l/%L\ C%c%V]\ [%{&fenc!=''?&fenc:&enc}(%{&ff})]\ [%Y]

" テンプレートから新規作成
autocmd BufNewFile *.pl 0r ~/_vim/template/skel.pl
autocmd BufNewFile *.py 0r ~/_vim/template/skel.py
autocmd BufNewFile *.sh 0r ~/_vim/template/skel.sh
autocmd BufNewFile *.html 0r ~/_vim/template/skel.html
autocmd BufNewFile *.xml 0r ~/_vim/template/skel.xml

" 対応カッコの点滅 matchtimeは1/10単位
set showmatch
set matchtime=3

" 行の折り返しで見た目の行に移動
:nnoremap j gj
:nnoremap k gk
:nnoremap <Up> gk
:nnoremap <Down> gj

" PLUGIN: 日付挿入マクロ (Last Modified: 2023/05/17 16:41:41.)
source ~/_vim/plugin/autodate.vim
let autodate_format = '%Y/%m/%d %H:%M:%S'
let autodate_keyword_pre = 'Last Modified:'

" PLUGIN: TagList
source ~/_vim/plugin/taglist.vim
let Tlist_Use_Right_Window=1
set <F10>=
map <F10> <ESC>:TlistToggle<CR><C-W><C-W>

