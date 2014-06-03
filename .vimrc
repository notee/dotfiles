"This line is comment






"----------------------------------------------------
"plugin
"----------------------------------------------------
set nocompatible
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

filetype off

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
"NeoBundle 'Shougo/vimproc'

"ここからplugin"
NeoBundle 'git://github.com/Shougo/neocomplcache-clang_complete.git'
"NeoBundle 'git://github.com/Rip-Rip/clang_complete.git'
"NeoBundle 'git://github.com/Shougo/echodoc.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/neosnippet'
"NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/vim-vcs.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/Shougo/vinarise.git'
NeoBundle 'git://github.com/mileszs/ack.vim.git'

NeoBundle 'git://github.com/vim-scripts/taglist.vim.git'
NeoBundle 'https://github.com/vim-scripts/errormarker.vim.git'
NeoBundle 'thinca/vim-quickrun'
""NeoBundle 'scrooloose/syntastic'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'altercation/vim-colors-solarized'


"ここまでplugin"
filetype on
filetype indent on

"ついでにplugin系列のもろもろ保存先
let g:vimshell_temporary_directory='~/.vim/temp/.vimshell'
let g:neocomplcache_temporary_dir='~/.vim/temp/.neocomplcache'
let g:unite_data_directory='~/.vim/temp/unite'
"----------------------------------------------------


"----------------------------------------------------
"NeoComplcacheの設定
"----------------------------------------------------
set completeopt=menuone
"補完候補が１つだけでも表示

let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1
" 大文字が入力されるまで大文字小文字の区別を無視

let g:neocomplcache_enable_underbar_completion=1
" スネークケースの補完を有効化

let g:neocomplcache_enable_camel_case_completion=1
" キャメルケースの補完を有効化

let g:neocomplcache_max_list=20
" ポップアップメニューで表示される候補の数

let g:neocomplcache_min_syntax_length=3
" シンタックスをキャッシュするときの最小文字長

let g:NeoComplCache_TagsAutoUpdate = 1
let g:NeoComplCache_EnableInfo = 1
let g:NeoComplCache_EnableSkipCompletion = 1
let g:NeoComplCache_SkipInputTime = '0.5'

inoremap <expr><TAB>   pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>"   : "\<S-TAB>"
"inoremap <expr><S-TAB> pumvisible() ? neocomplcache#close_popup()."\<Up>"   : "\<S-TAB>"
inoremap <expr><Up> pumvisible() ? neocomplcache#close_popup()."\<Up>" : "\<Up>"
inoremap <expr><Down> pumvisible() ? neocomplcache#close_popup()."\<Down>" : "\<Down>"
" 改行、Deleteキーで補完ウィンドウを閉じる

function! s:my_cr_func()
    return pumvisible() ? neocomplcache#smart_close_popup() : "\<CR>"
endfunction
inoremap <silent> <CR> <C-R>=<SID>my_cr_func()<CR>
inoremap <expr><C-h> neocomplcache#smart_close_popup() . ”\<C-h>”
" 現在選択している候補を確定します
inoremap <expr><C-y> neocomplcache#close_popup()
" 現在選択している候補をキャンセルし、ポップアップを閉じます
inoremap  <expr><Left> neocomplcache#close_popup()."<Left>"
inoremap  <expr><Right> neocomplcache#close_popup()."<Right>"
" 現在選択している候補をキャンセルし、ポップアップを閉じます
inoremap <expr><C-e> neocomplcache#cancel_popup()
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
let g:neocomplcache_snippets_dir = "~/.vim/snippets"
" Define dictionary
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell/command-history',
    \ 'perl' : $HOME.'/.vim/dict/perl.dict'
    \ }

" for snippets
"スニペットのディレクトリ
if !exists("g:neosnippet#snippets_directory")
    let g:neosnippet#snippets_directory=""
endif
let g:neosnippet#snippets_directory=$HOME.'/.vim/snippets'

" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
" imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
      set conceallevel=2 concealcursor=i
  endif


""Omni Completion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
 
if !exists('g:neocomplcache_omni_patterns')
          let g:neocomplcache_omni_patterns={}
endif
let g:neocomplcache_omni_patterns.ruby='[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php='[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c='\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp='\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

let g:EclimCompletionMethod = 'omnifunc'

"----------------------------------------------------
" unite設定
"----------------------------------------------------

"vim command 一覧
noremap :<CR> :<C-u>Unite command mapping<CR>
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
 
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" 初期設定関数を起動する
au FileType unite call s:unite_my_settings()
    function! s:unite_my_settings()
    " Overwrite settings.
endfunction



"----------------------------------------------------
" コンパイラ指定とQuickFix
"----------------------------------------------------
autocmd FileType perl :compiler perl
"autocmd FileType perl set makeprg=$HOME/.vim/vimparse.pl\ -c\ %\ $*
"autocmd FileType perl errorformat=%f:%l:%m
"autocmd BufWritePost *.pm,*.pl,*.t silent make | if len(getqflist()) != 1 | copen | else | cclose | endif

"NeoBundle 'https://github.com/scrooloose/syntastic'
"let g:syntastic_enable_signs=1
"let g:syntastic_auto_loc_list=2


" syntax check for perl
autocmd filetype perl :map <silent><C-c> :cn<CR>
autocmd filetype perl :map <silent><C-l> :cl<CR>
autocmd filetype perl :nnoremap <buffer> <silent> X :w<CR>:!perl -I ~/perl5/lib/perl5 -c -MVi::QuickFix % <CR>
autocmd filetype perl :nnoremap <buffer> <silent> E :cf <CR>


" いったんQuickFix止めます！
"function! _CheckPerlCode()
"    exe ":w"
"    exe ":!perl -I ~/perl5/lib/perl5 -I ~/Desktop/git-clone/pfsys_components/pfsys-Ganesha/lib -c -MVi::QuickFix %"
"endfunction

"command! CheckCode call _CheckPerlCode()

"autocmd BufWrite *.{pm} :CheckCode



"----------------------------------------------------
" QFixHowmの設定
"----------------------------------------------------
" qfixappにruntimepathを通す(パスは環境に合わせてください)
set runtimepath+=~/Desktop/git-clone/tools/qfixhowm

" キーマップリーダー
let QFixHowm_Key = 'g'

" howm_dirはファイルを保存したいディレクトリを設定
let howm_dir             = '~/Documents/memos/'
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.txt'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'unix'



"----------------------------------------------------
" キーバインド
"----------------------------------------------------
" Insertモード
"----------------------------------------------------

" 引用符等の設定
" カッコやクオートなどを入力した際に左に自動で移動
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap () ()<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap <> <><Left>

" $,@の変換
inoremap <C-d> $
inoremap <C-a> @

" カーソル移動
"inoremap <C-a>  <Home>
inoremap <C-e>  <End>

" Normalモードへ移行
"inoremap <> <ESC>

" ファイル保存
inoremap <C-w> <ESC>:w<CR>i

" 終了
inoremap qq <ESC>:q<CR>

"----------------------------------------------------
"Normalモード
"----------------------------------------------------
"カーソルを表示行で移動する。物理行移動は<C-n>,<C-p>
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
"inoremap <Down> <C-o>gj
"inoremap <Up>   <C-o>gk

"空行挿入
nnoremap <CR> i<CR><ESC>

" バックスペース
nnoremap <BackSpace> i<BackSpace><Right><ESC>


"----------------------------------------------------
" ファイラ関連
"----------------------------------------------------
" netrwは常にtree view
let g:netrw_liststyle = 3

" netrwで新しいウィンドウを下に分割する
let g:netrw_alto = 1

" netrwで新しいウィンドウを右に分割する
let g:netrw_altv = 1


"----------------------------------------------------
" 表示関連
"----------------------------------------------------

"InsertモードとNormalモードのビジュアル変更
"カーソル行の強調表示（Normalモードのみ）
" カーソル行を強調表示しない
set nocursorline
" Insertモードの時のみ、カーソル行をハイライトする
autocmd InsertEnter,InsertLeave * set cursorline!

"行番号表示
set number

"ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
set wrap

"perlなどのカラーリング
syntax on
set syntax=perl,html

"下にステータスライン表示
set laststatus=2

"ステータスライン
set statusline=%f\[%{&fenc==''?&enc:&fenc}][%{&ff}]%=%8l:%c%8P

" 入力中のコマンドをステータスに表示する
set showcmd

"改行文字表示
set list
set listchars=tab:>-,extends:<,trail:-,eol:<,nbsp:%

"対応する括弧を表示
set showmatch
set matchtime=1

"カラースキーマ
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256


"----------------------------------------------------
" タブとインデント
"----------------------------------------------------

"タブ幅
set tabstop=4

"タブは空白に置き換える
"連続した空白はひとかたまりで扱う
set expandtab
set softtabstop=4

"オートインデント
set autoindent
set cindent
set shiftwidth=4

"バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start



"----------------------------------------------------
" バックアップとアンドゥ
"----------------------------------------------------

" backup(mkdir ~/.vim mkdir ~/.vim/backup mkdir ~/.vim/swap)
set backup
set backupdir=~/.vim/backup
set swapfile
set directory=~/.vim/swap

"アンドゥ履歴を保存(ver.7.3から)
set undofile



"----------------------------------------------------
" その他
"----------------------------------------------------



"ファイルの文字コード
set fileencodings=utf8,iso-2022-jp,sjis,cp932,euc-jp

"クリップボード共有
set clipboard=unnamed

"マウス有効
if has('mouse')
  set mouse=a
endif

"行末行頭移動可能
set whichwrap=b,s,h,l,[,],<,>

"ヒストリー保存数
set history=50

"検索時
"大文字小文字を区別しない
set ignorecase
" 検索の時に大文字が含まれている場合は区別して検索する
set smartcase

"ctagsで関数名ジャンプ
"tag情報ファイルはどこ？
"set tags
nnoremap <C-]> g<C-]>


