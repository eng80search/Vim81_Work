
"----------------------------------------
" 2017年5月25日版
" Kaoriya対策
"----------------------------------------

"--------------------------------------------------------------------------------
"NERDTree Setting
"--------------------------------------------------------------------------------
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1 "ファイルを開いたら閉じる場合は1 そのままの場合は0
let g:NERDTreeShowBookmarks=1 "ブックマーク初期表示
let NERDTreeWinSize = 40 "Windowsサイズ設定
let g:NERDTreeCopycmd= 'cp -r '

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('vim',    'yellow',    'none', '#390088', '#282c34')
call NERDTreeHighlightFile('java',   'yellow',    'none', '#fcdb79', '#282c34')
call NERDTreeHighlightFile('csv',    'yellow',    'none', '#fcdb79', '#282c34')
call NERDTreeHighlightFile('db',     'blue',      'none', '#4169e1', '#282c34')
call NERDTreeHighlightFile('json',   'blue',      'none', '#8a2be2', '#282c34')
call NERDTreeHighlightFile('py',     'yellow',    'none', '#fcdb79', '#282c34')
call NERDTreeHighlightFile('aspx',   'red',       'none', '#ff7f50', '#282c34')
call NERDTreeHighlightFile('vb','yellow',      'none', '#ffd700', '#282c34')
call NERDTreeHighlightFile('cs',     'yellow',    'none', '#c4f74f', '#282c34')
call NERDTreeHighlightFile('js',     'Red',       'none', '#76eddb', '#282c34')
call NERDTreeHighlightFile('htm',    'brown',     'none', '#627009', '#282c34')
call NERDTreeHighlightFile('css',    'yellow',    'none', '#f94fcc', '#282c34')
call NERDTreeHighlightFile('xml',    'brown',     'none', '#627009', '#282c34')
call NERDTreeHighlightFile('html',   'brown',     'none', '#dfb5f2', '#282c34')
call NERDTreeHighlightFile('htm',    'brown',     'none', '#dfb5f2', '#282c34')
call NERDTreeHighlightFile('sql',    'blue',      'none', '#9bf76a', '#282c34')
call NERDTreeHighlightFile('log',    'yellow',    'none', '#876712', '#282c34')
call NERDTreeHighlightFile('vim',    'yellow',    'none', '#876712', '#282c34')
call NERDTreeHighlightFile('xlsx',   'yellow',    'none', '#91938D', '#282c34')
call NERDTreeHighlightFile('xls',    'yellow',    'none', '#91938D', '#282c34')
call NERDTreeHighlightFile('xlsm',   'yellow',    'none', '#91938D', '#282c34')
call NERDTreeHighlightFile('doc',    'yellow',    'none', '#91938D', '#282c34')
call NERDTreeHighlightFile('docx',   'yellow',    'none', '#91938D', '#282c34')
call NERDTreeHighlightFile('jpg',    'yellow',    'none', '#100000', '#282c34')
call NERDTreeHighlightFile('JPG',    'yellow',    'none', '#100000', '#282c34')
call NERDTreeHighlightFile('png',    'yellow',    'none', '#100000', '#282c34')
call NERDTreeHighlightFile('PNG',    'yellow',    'none', '#100000', '#282c34')
call NERDTreeHighlightFile('gif',    'yellow',    'none', '#A4A4A4', '#282c34')
call NERDTreeHighlightFile('GIF',    'yellow',    'none', '#A4A4A4', '#282c34')
call NERDTreeHighlightFile('config', 'yellow',    'none', '#A4A4A4', '#282c34')

"--------------------------------------------------------------------------------
"NERDTree FilePath AutoRefresh
"--------------------------------------------------------------------------------
function! NERDTreeAutoUpdate()
    try

        "処理対象がNERDTreeウィンドウ自分自分の場合は更新処理を行わない。
        if exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) == winnr()
            return
        endif

        " Detect which plugins are open
        if exists('t:NERDTreeBufName')
            let s:nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
        else
            let s:nerdtree_open = 0
        endif

        if s:nerdtree_open
            NERDTree
        else
            return
        endif

        "ウィンドウを戻す
        if exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) == winnr()
            wincmd w
        endif

        NERDTreeFind

        "ウィンドウを戻す
        if exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) == winnr()
        wincmd w
        endif

    catch
        echo "Error Happend!"
    endtry

endfunction

autocmd BufWinEnter * call NERDTreeAutoUpdate()

"close vim if the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"--------------------------------------------------------------------------------
"vim-nerdtree-syntax-highlight
"--------------------------------------------------------------------------------
" let g:NERDTreeFileExtensionHighlightFullName = 1
" let g:NERDTreeExactMatchHighlightFullName = 1
" let g:NERDTreePatternMatchHighlightFullName = 1

"--------------------------------------------------------------------------------
"MRU Setting
"--------------------------------------------------------------------------------
nnoremap <silent><C-h> :MRU<CR>


"remember file Count
let MRU_Max_Entries = 1000

"Change the ListWindow height
let MRU_Window_Height = 15

let g:MRU_Use_CursorLine = 1


"--------------------------------------------------------------------------------
"Tagbarの設定
"--------------------------------------------------------------------------------
nnoremap <silent><C-a> :TagbarToggle<CR>
" ソートは不要にする
let g:tagbar_sort = 0

"--------------------------------------------------------------------------------
"NerdTreeとTagbarの合体設定
"--------------------------------------------------------------------------------
" nmap <silent><C-s> :ToggleNERDTreeAndTagbar<CR>


"--------------------------------------------------------------------------------
"現在のウィンドウのカレントディレクトリを開いたファイルのパスで設定する
"--------------------------------------------------------------------------------
nnoremap <silent> ,cd :lcd %:h<CR>
"
"--------------------------------------------------------------------------------
"SQL整形ツールプラグインキーマッピング
"--------------------------------------------------------------------------------
vmap <silent>,sf        :SQLUFormatter<CR>
nmap <silent>,scl       :SQLU_CreateColumnList<CR>
nmap <silent>,scd       :SQLU_GetColumnDef<CR>
nmap <silent>,scdt      :SQLU_GetColumnDataType<CR>
nmap <silent>,scp       :SQLU_CreateProcedure<CR>


"--------------------------------------------------------------------------------
"プラグインAlignのメニュー非表示
:let g:DrChipTopLvlMenu = ""
"--------------------------------------------------------------------------------
"プラグインsqlutilのメニュー非表示
:let  g:sqlutil_default_menu_mode = 0


""--------------------------------------------------------------------------------
""データベースアクセス用設定（dbext.vim）
""--------------------------------------------------------------------------------
"let dbext_default_profile=""
"let dbext_default_type="SQLSRV"
"let dbext_default_user="sa"
"let dbext_default_passwd="JA@dmin06"
"let dbext_default_dbname="Temp"
"let dbext_default_srvname="localhost\\SQLEXPRESS2014"

"vimに表示する行数設定
"let dbext_default_buffer_lines=80
"
"--------------------------------------------------------------------------------
"【tagbar.vim】プラグイン 関数一覧を表示する
"--------------------------------------------------------------------------------
"vbプログラムを認識できるように設定する
" nmap <F12> :TagbarToggle<CR>

"--------------------------------------------------------------------------------
"【toggletagbar.vim】TagbarとNerdTreeプラグインを上下に配置するプラグイン
"--------------------------------------------------------------------------------
nmap <F8> :ToggleNERDTreeAndTagbar<CR>

"--------------------------------------------------------------------------------
"【lightline.vim】
"--------------------------------------------------------------------------------
"[2b60] Branch symbol
"[2b61] LN (line) symbol
"[2b62] FT symbol 1
"[2b63] FT symbol 2
"[2b64] Padlock (closed) symbol
"[2b80] Hard right arrow
"[2b81] Soft right arrow
"[2b82] Hard left arrow
"[2b83] Soft left arrow

"let g:lightline = {
"      \ 'colorscheme': 'solarized',
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ],
"      \             [ 'fugitive', 'filename' ] ],
"      \   'right': [ [ 'syntastic', 'lineinfo' ],
"      \              [ 'percent' ],
"      \              [ 'fileformat', 'fileencoding', 'filetype' ] ],
"      \   },
"      \ 'component_function': {
"      \   'fugitive': 'LightlineFugitive',
"      \   'filename': 'LightlineFilename',
"      \   'readonly': 'LightlineReadonly',
"      \   'modified': 'LightlineModified',
"      \ },
"      \ 'component_expand': {
"      \   'syntastic': 'SyntasticStatuslineFlag',
"      \ },
"      \ 'component_type': {
"      \   'syntastic': 'error',
"      \ },
"      \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
"      \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
"      \ }
"
   function! LightlineModified()
     if &filetype == "help"
       return ""
     elseif &modified
       return "+"
     elseif &modifiable
       return ""
     else
       return ""
     endif
   endfunction

   function! LightlineReadonly()
     if &filetype == "help"
       return ""
     elseif &readonly
       return "RO"
     else
       return ""
     endif
   endfunction

"    function! LightlineFugitive()
"      if exists("*fugitive#head")
"        let branch = fugitive#head()
"        return branch !=# '' ? "\u2b60 ".branch : ''
"      endif
"      return ''
"    endfunction
"
   function! LightlineFilename()
     " return ('' != expand('%:p') ? expand('%:p') : '[No Name]')
     return ('' != expand('%:p') ? '[Buf:'.bufnr('%').'] '.expand('%:p') : '[Buf:'.bufnr('%').'] '.'(No Name)')
   endfunction

    "function! LightlineMode()
    "    let fname = expand('%:t')
    "    return fname == '__Tagbar__' ? 'Tagbar' :
    "       \ fname == 'ControlP' ? 'CtrlP' :
    "       \ fname == '__Gundo__' ? 'Gundo' :
    "       \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
    "       \ fname =~ 'NERD_tree' ? 'NERDTree' :
    "       \ &ft == 'unite' ? 'Unite' :
    "       \ &ft == 'vimfiler' ? 'VimFiler' :
    "       \ &ft == 'vimshell' ? 'VimShell' :
    "       \ winwidth(0) > 60 ? lightline#mode() : ''
    "endfunction
    " let g:lightline = {
      " \ 'colorscheme': 'wombat',
      " \ }



" let g:lightline                  = {}
" let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
" let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
" let g:lightline.component_type   = {'buffers': 'tabsel'}

let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'readonly': 'LightlineReadonly',
      \   'modified': 'LightlineModified',
      \ },
      \ 'colorscheme': 'wombat',
      \ }


"--------------------------------------------------------------------------------
" syntastic プラグインのための設定 
" http://itchyny.hatenablog.com/entry/20130918/1379461406
"--------------------------------------------------------------------------------
    " let g:syntastic_mode_map = { 'mode': 'passive' }
    " augroup AutoSyntastic
    "     autocmd!
    "     autocmd BufWritePost *.py,*.php call s:syntastic()
    " augroup END
    "
    " function! s:syntastic()
    "     SyntasticCheck
    "     "call lightline#update()
    " endfunction

"--------------------------------------------------------------------------------
"【neocomplete.vim】プラグイン 設定
"--------------------------------------------------------------------------------
"オフィシャルサイトのおすすめの設定
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"jedi+python3ではエラーになるので無効にする
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"--------------------------------------------------------------------------------
"syntastic: Setting to Use python3 chcker will need Install package named pep8 And
"pyflakes  Using pip Command like this -> (root) python3 -m pip install flake8
"--------------------------------------------------------------------------------
"let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1

"--------------------------------------------------------------------------------
"vim-autopep8 Setting
"--------------------------------------------------------------------------------
"autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

"Disable show diff window
" let g:autopep8_disable_show_diff=1

"--------------------------------------------------------------------------------
"QuickRun Setting
"--------------------------------------------------------------------------------
""!!shoud keep Setting order.
"let g:quickrun_config = {}
"
"let g:quickrun_config._ = {
"      \ 'runner'    : 'vimproc',
"      \ 'runner/vimproc/updatetime' : 10,
"      \ 'outputter' : 'error',
"      \ 'outputter/error/success' : 'buffer',
"      \ 'outputter/error/error'   : 'quickfix',
"      \ 'outputter/buffer/split'  : ':rightbelow 10sp',
"      \ 'outputter/buffer/close_on_empty' : 1,
"      \ 'hook/output_encode/enable' : 1,
"      \ 'hook/output_encode/encoding' : 'shift_jis',
"      \ }
"
"let g:quickrun_config.python = {
"      \ 'command' : 'python3',
"      \}

"silent! nmap <unique><F5> <Plug>(quickrun)

"autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

""--------------------------------------------------------------------------------
""Rgrep.vim Setting
""--------------------------------------------------------------------------------
"let Grep_Default_Filelist = '*\.cs *\.aspx *\.aspx\.cs *\.html'
"let Grep_Skip_Files = '*\.gif *\.GIF *\.jpg *\.dll *\.exe *\.pdb *\.cache *\.png'

""--------------------------------------------------------------------------------
""Align Setting
""--------------------------------------------------------------------------------
""日本語で使用するために
"let g:Align_xstrlen = 3


"--------------------------------------------------------------------------------
"Singleton Setting
"--------------------------------------------------------------------------------
"インスタンスを一つにするために
call singleton#enable()

"--------------------------------------------------------------------------------
"incsearch Setting
"--------------------------------------------------------------------------------
"デフォルト検索では一つの検索結果しかハイライトできない問題を解決
let g:incsearch#magic = '\v'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)


"--------------------------------------------------------------------------------
"pt Setting
"--------------------------------------------------------------------------------
 let g:pt_prg="pt  --smart-case"
 let g:pt_highlight=1
 

"--------------------------------------------------------------------------------
"vim-easy-align Setting
"--------------------------------------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

"--------------------------------------------------------------------------------
"CtrlP Setting
"--------------------------------------------------------------------------------

let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:15,results:9999'


"--------------------------------------------------------------------------------
"vim-bookmarks Setting
"--------------------------------------------------------------------------------
"マークの色設定

" let g:bookmark_sign = '>>'
" let g:bookmark_annotation_sign = '##'
"
" let g:bookmark_location_list = 1
" let g:bookmark_disable_ctrlp = 1
"
" let g:bookmark_no_default_key_mappings = 1


" nmap ml <Plug>BookmarkShowAll
" nmap md <Plug>BookmarkClear
" nmap mm <Plug>BookmarkToggle
" nmap mi <Plug>BookmarkAnnotate
" nmap mn <Plug>BookmarkNext
" nmap mp <Plug>BookmarkPrev
" nmap mx <Plug>BookmarkClearAll

"Default is bellow
"Add/remove bookmark at current line        mm    :BookmarkToggle
"Add/edit/remove annotation at current line mi    :BookmarkAnnotate<TEXT>
"Jump to next bookmark in buffer            mn    :BookmarkNext
"Jump to previous bookmark in buffer        mp    :BookmarkPrev
"Show all bookmarks (toggle)                ma    :BookmarkShowAll
"Clear bookmarks in current buffer only     mc    :BookmarkClear
"Clear bookmarks in all buffers             mx    :BookmarkClearAll
"

"--------------------------------------------------------------------------------
"QuickRun Setting
"--------------------------------------------------------------------------------
"出力結果を下に表示する


" if !exists("g:quickrun_config")
"     let g:quickrun_config={}
" endif
" "let g:quickrun_config = {}
"
" "一般の設定
" let g:quickrun_config["_"] = {
"       \ 'runner'    : 'system',
"       \ 'outputter' : 'error',
"       \ 'outputter/error/success' : 'buffer',
"       \ 'outputter/error/error'   : 'quickfix',
"       \ 'outputter/buffer/split'  : ':rightbelow 10sp',
"       \ 'outputter/buffer/close_on_empty' : 1,
"       \ }
"
" "powershellの専用設定
" let g:quickrun_config["ps1"] = {
"       \   "hook/output_encode/enable" : 1,
"       \   "hook/output_encode/encoding" : "cp932",
"       \   'command' : 'powershell.exe',
"       \   'exec' : '%c   %s',
"       \ }
"
" "Pthone Utf8文字化け対策
" if has('win32') || has('win64')
"     let g:quickrun_config['python'] = {
"     \   "hook/output_encode/enable" : 1,
"     \   "hook/output_encode/encoding" : "cp932",
"     \}
" endif
" "ショットカットキー
" nnoremap <silent> <F9> :QuickRun<CR>


"--------------------------------------------------------------------------------
"vim-python/python-syntax Setting
"--------------------------------------------------------------------------------
let g:python_highlight_all = 1

"--------------------------------------------------------------------------------
"nerdcommenter Setting
"--------------------------------------------------------------------------------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1


"--------------------------------------------------------------------------------
"tmhedberg/matchit Setting
"--------------------------------------------------------------------------------
let g:match_ignorecase = 1
" let g:match_words = "<\t*begin>:<\t*end>"
" let b:match_words = "<public class>:<end class>"
let b:match_words = "<:>,<div>:</div>"

"--------------------------------------------------------------------------------
"vim 8.1 terminal Setting
"--------------------------------------------------------------------------------
function! GitBash()
    " 日本語Windowsの場合`ja`が設定されるので、入力ロケールに合わせたUTF-8に設定しなおす
    let l:env = {
                \ 'LANG': systemlist('"C:/Program Files/Git/usr/bin/locale.exe" -iU')[0],
                \ }

    " remote連携のための設定
    if has('clientserver')
        call extend(l:env, {
                    \ 'GVIM': $VIMRUNTIME,
                    \ 'VIM_SERVERNAME': v:servername,
                    \ })
    endif

    " term_startでgit for windowsのbashを実行する
    call term_start(['C:/Program Files/Git/bin/bash.exe', '-l'], {
                \ 'term_finish': 'close',
                \ 'cwd': expand('%:p:h'),
                \ 'env': {'LANG':'ja_JP.UTF-8'}
                \ })

endfunction

command! Gbash call GitBash()
" nnoremap <Leader>g :<C-u>call GitBash()<CR>


"--------------------------------------------------------------------------------
"YouCompleteMe Setting
"--------------------------------------------------------------------------------
"BugFix must fix youcompleteme.vim 180,7!
 let g:ycm_max_num_candidates = 30
 let g:ycm_autoclose_preview_window_after_completion=1
 let g:ycm_use_clangd = 0


 autocmd FileType python,java,c  noremap  <silent> <C-F8>  :YcmCompleter GoTo<CR>
 autocmd FileType python,java,c  nnoremap <silent> <C-F7>  :YcmCompleter GoToReferences<CR>
 autocmd FileType python,java,c  nnoremap <silent> <C-F5>  :YcmCompleter GetDoc<CR>
 
"--------------------------------------------------------------------------------
"AsyncRun Setting
"--------------------------------------------------------------------------------
let g:asyncrun_open = 15
let $PYTHONUNBUFFERED=1
autocmd FileType python noremap <silent><F9>  :AsyncRun python %<CR>
autocmd FileType python noremap <silent><F10> :vert term  python -m ipdb %<CR>
autocmd FileType python noremap <silent><F12> :AsyncStop <CR>
autocmd FileType python let g:asyncrun_encs = "cp932"

autocmd FileType cs noremap <silent><F9>  :AsyncRun msbuild<CR>
autocmd FileType cs noremap <silent><F12> :AsyncStop <CR>
autocmd FileType cs let g:asyncrun_encs = "cp932"


autocmd FileType java noremap <silent><F8>  :AsyncRun javac  -encoding UTF-8 %<CR>
autocmd FileType java noremap <silent><F9>  :AsyncRun java %:t:r<CR>
autocmd FileType java noremap <silent><F12> :AsyncStop <CR>
autocmd FileType java let g:asyncrun_encs = "cp932"

autocmd FileType ps1 noremap <silent><F9>  :AsyncRun %<CR>
autocmd FileType ps1 let g:asyncrun_encs = "cp932"

"--------------------------------------------------------------------------------
"Python3 Setting
"--------------------------------------------------------------------------------
" python3.7にアップしたあと、PluginのYouCompleteMeを実行すると、
" 警告メッセージが出たのでそれが出ないように追加
if has('python3')
    silent! python3 1
endif

"--------------------------------------------------------------------------------
"Markdown-preview setting
"--------------------------------------------------------------------------------
autocmd FileType markdown noremap <silent><C-p>  :MarkdownPreview<CR>

"--------------------------------------------------------------------------------
" vim-indent-guides setting
"--------------------------------------------------------------------------------
" Disable the plugin on Vim startUp
let g:indent_guides_enable_on_vim_startup = 0

set ts=4 sw=4 et
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

autocmd FileType html,js,python,aspx,xml IndentGuidesEnable
" autocmd FileType js IndentGuidesEnable

