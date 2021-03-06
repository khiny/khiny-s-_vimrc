
" =============================================================================
" 기본적으로 설정되는 예제들을 포함 한다. history .. 등..
" =============================================================================
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/gvimrc_example.vim

" =============================================================================
" 윈도우에서만 사용되는 여러가지 키 맵들을 포함한다.
" C-v, C-c, C-q, C-a 등...
" =============================================================================
if has("win32")
"	source $VIMRUNTIME/mswin.vim
endif

" =============================================================================
" 구식 vi 와 동일하게 작동할 것인가에 대한 옵션이다. 구식 vi와 동일하게
" 작동하도록 설정된다면 많은 편리한 기능을 사용할수 없을 것이다.
" =============================================================================
set nocompatible

" =============================================================================
" filetype
" =============================================================================
filetype off

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  set nocompatible               " Be iMproved

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


" ...
NeoBundle 'https://github.com/Shougo/unite.vim'

NeoBundle 'tomasr/molokai'

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

NeoBundle 'https://github.com/altercation/vim-colors-solarized.git'

NeoBundle 'https://github.com/chazy/cscope_maps.git'

NeoBundle 'https://github.com/wesleyche/SrcExpl.git'

"NeoBundle 'The-NERD-tree'
"map <F10> :NERDTreeToggle<CR>
"map <leader>q :NERDTreeToggle<CR>
"let NERDTreeWinSize=44
"let NERDTreeShowBookmarks=1
"let NERDTreeHighlightCursorline=1

NeoBundle 'Shougo/vimfiler.vim'
map <F10> :VimFilerExplore<CR>
nmap <leader>q :VimFilerExplore<CR>
"g:vimfiler_as_default_explorer=1

NeoBundle 'Tagbar'
nnoremap <silent> <F11> :TagbarToggle<CR>
nmap <leader>t :TagbarToggle<CR>
let g:tagbar_width = 60

"NeoBundle 'haya14busa/vim-easymotion'
NeoBundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_smartcase = 1
"n-character search motion
"map  / <Plug>(easymotion-sn)
"omap / <Plug>(easymotion-tn)
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)
map <SPACE> <Plug>(easymotion-s2)

NeoBundle 'https://github.com/terryma/vim-expand-region'

NeoBundle 'bling/vim-airline'
set laststatus=2
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

"powerline symbols
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_theme = 'molokai'

"NeoBundle 'vim-startify'
"let g:startify_custom_indices = ['f', 'g', 'h', 'r', 'i', 'o', 'b']

NeoBundle 'vim-multiple-cursors'

NeoBundle 'mileszs/ack.vim'

NeoBundle 'tpope/vim-fugitive' "{{{
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gr :Gremove<CR>
autocmd FileType gitcommit nmap <buffer> U :Git checkout -- <C-r><C-g><CR>
autocmd BufReadPost fugitive://* set bufhidden=delete
"}}}

"NeoBundle 'https://github.com/Valloric/YouCompleteMe'
"NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'Shougo/neocomplete.vim'
""""""""""let g:neocomplcache_enable_at_startup = 1
""""""""""let g:neocomplete#enable_smart_case = 1
""""""""""autocmd FileType txt :NeoCompleteDisable
""""""""""autocmd FileType c,cpp,asm,h :NeoCompleteEnable

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

let g:neocomplete#enable_auto_close_preview = 1

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
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


NeoBundle 'Shougo/unite-outline'

NeoBundle 'https://github.com/scrooloose/syntastic'
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0 " don't check on :wq and :x
let g:syntastic_enable_signs = 1 " errors on left sid
let g:syntastic_auto_loc_list = 2 " only show window when I ask
let g:syntastic_c_check_header = 1
let g:syntastic_c_no_include_search = 1
let g:syntastic_c_compiler = 'gcc'
if has('unix')
	let g:syntastic_error_symbol = '★'
	let g:syntastic_style_error_symbol = '>'
	let g:syntastic_warning_symbol = '?'
	let g:syntastic_style_warning_symbol = '>'
else
	let g:syntastic_error_symbol = '!'
	let g:syntastic_style_error_symbol = '>'
	let g:syntastic_warning_symbol = '.'
	let g:syntastic_style_warning_symbol = '>'
endif

NeoBundle 'Shougo/neoinclude.vim'

"NeoBundle 'nathanaelkane/vim-indent-guides'
"let g:indent_guides_start_level=2
"let g:indent_guides_guide_size=1
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=4
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
"hi IndentGuidesOdd  ctermbg=red
"hi IndentGuidesEven ctermbg=green
"hi IndentGuidesOdd  ctermbg=black
"hi IndentGuidesEven ctermbg=darkgrey
"hi IndentGuidesOdd  ctermbg=white
"hi IndentGuidesEven ctermbg=lightgrey

NeoBundle 'Yggdroot/indentLine'
"let g:indentLine_loaded = 1
"let g:indentLine_color_term = 8
"let g:indentLine_color_tty_light = 7 " (default: 4)
"let g:indentLine_color_dark = 1 " (default: 2)
"let g:indentLine_char = '≫'
let g:indentLine_char = '|'
"let g:indentLine_leadingSpaceChar = '·'
"let g:indentLine_leadingSpaceEnabled = 1
"let g:indentLine_loaded = 1



NeoBundle 'wannesm/wmgraphviz.vim'

NeoBundle 'khiny/khiny-s-_vimrc'

NeoBundle 'vim-scripts/DirDiff.vim'

NeoBundle 'itchyny/calendar.vim'

NeoBundle 'git://gist.github.com/1630581.git'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" =============================================================================
" <Leader> 설정 (mapleader변수 이용)
" =============================================================================
let mapleader = ","


" Column scroll-binding on <leader>sb
noremap <silent> <leader>sb :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>


" =============================================================================
" solarized
" =============================================================================
"set background=light
"colorscheme solarized
"let g:solarized_italic = 0

" =============================================================================
" 윈도우 사용시 gvim의 폰트및 gui 옵션을 설정한다. gui 옵션은 메뉴, 스크롤바,
" 툴바, 스크롤바의 위치 기타 등등 gvim 사용시 보여 지는 것들에 대한 옵션을
" 설정하는 것이다. 아래의 설정은 아무것도 없이 사용하는 것이다.
" =============================================================================
if has("win32")
	"set guifont=나눔고딕코딩:h12:cHANGEUL
	"set guifont=Consolas:h12:cHANGEUL
	"set guifont=DejaVu\ Sans\ Mono:h12  "font setting
	set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
	let Powerline_symbols = 'fancy'
	"set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
	"set guioptions-=r  "remove right-hand scroll bar
endif

" =============================================================================
" 일본어와 한국어 토글
" =============================================================================
"map <F5> :se enc=japan<CR>:se guifont=IPAGothic:h12<CR>
"map <F5> :se enc=sjis<CR>:se guifont=IPAGothic:h10<CR>
"map <F5> :se enc=sjis<CR>:se guifont=MS\ Gothic<CR>
"map <F6> :se enc=korea<CR>:se guifont=굴림체:h9:cHANGEUL<CR>
"map <F6> :se enc=korea<CR>:se guifont=Envy\ Code\ R<CR>
"map <F6> :se enc=korea<CR>:se guifont=나눔고딕코딩:h10:cHANGEUL<CR>

" =============================================================================
" MS-WINDOWS 에서 창 크기 최대화 하기
" =============================================================================
""<F8> - :simalt~x
"if has("unix")
"elseif has("win32")
"    map <F8> :simalt~x<CR>
"    imap <F8> :simalt~x<CR>
"endif
au GUIEnter * simalt ~x

" =============================================================================
" Taglist 에 대한 설정
" =============================================================================
set tags=./tags,tags
"set tags+=D:\work\svn-kissco\M5MoLS\trunk\M5MoLS\source\tags

" =============================================================================
" Mark 에 대한 설정
" =============================================================================
set viminfo+=!  " Save and restore global variables.
let g:mwDefaultHighlightingPalette = 'maximum'
" 내가 쓸 group 설정
command -bar HenryMarks silent MarkClear |
			\execute '1Mark aec_init(.*):' |
			\execute '1Mark aec_process(.*):' |
			\execute '1Mark aec_process_pack_output:' |
			\execute '2Mark aec_process_calc_current_bayer_metered_luma' |
			\execute '3Mark aec_process_apply_antibanding' |
			\execute '4Mark aec_process_calculate_roi_current_luma' |
			\execute '4Mark aec_set_roi aec_roi enabled!' |

" =============================================================================
" SrcExpl
" =============================================================================
nmap <F9> :SrcExplToggle<CR> 
nmap ,9 :SrcExplToggle<CR>
let g:SrcExpl_refreshTime = 100 
let g:SrcExpl_winHeight = 14
let g:SrcExpl_isUpdateTags = 0
let g:SrcExpl_updateTagsCmd = "ctags -L cscope.files" 

" =============================================================================
" miniBufExpl
" =============================================================================
"let g:miniBufExplModSelTarget = 1
"let g:miniBufExplorerMoreThanOne = 0
"let g:miniBufExplModSelTarget = 0
"let g:miniBufExplUseSingleClick = 1
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapCTabSwitchBuffs = 1
"let g:miniBufExplHSplit = 10
"let g:miniBufExplSplitAbove=1 "let g:miniBufExplSplitBelow=1
"let g:alternateNoDefaultAlternate = 1

" =============================================================================
" FuzzyFinder
" =============================================================================
"let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|swp|class|pyc|orig|lib)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
"map <leader>ff <ESC>:FufFile **/<CR>
"map <leader>fb <ESC>:FufBuffer **/<CR>
"map <leader>fd <ESC>:FufDir **/<CR>

" =============================================================================
" cscope 에 대한 설정
" =============================================================================
if filereadable("./cscope.out")
	cs add ./cscope.out
	"elseif filereadable("./main.cpp")
	"	cs add C:\QtSDK\Desktop\Qt\4.7.3\mingw\include\cscope.out
else
	"	cd D:\work\svn-kissco\M5MoLS\trunk\M5MoLS\source
	"	cs add D:\work\svn-kissco\M5MoLS\trunk\M5MoLS\source\cscope.out
endif

" cscope.out재생성하고 재연결


" =============================================================================
" 찾기, 바꾸기 등에서 대소문자 구분을 하지 않는다.
" =============================================================================
set ignorecase

"=============================================================================
" Tab를 눌렀을때 4칸 이동
" =============================================================================
"set tabstop=4
set tabstop=2
" c, cpp, h들을 편집할때만 tab을 space 로 자동변환
au Bufenter *.\(c\|cpp\|h\) set et

" =============================================================================
" 자동 들여쓰기
" =============================================================================
set autoindent

" =============================================================================
" C에서 자동들여쓰기
" =============================================================================
set cindent

" =============================================================================
" 좀더 똑똑한 자동들여쓰기
" =============================================================================
set smartindent

" =============================================================================
" 주석 자동 인덴트
" =============================================================================
"autocmd FileType c,cpp,cc,C  set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,:// shiftwidth=4

" =============================================================================
" 백업파일을 생성하지 않음
" =============================================================================
set nobackup

" =============================================================================
" 폴더를 사용하는 방법에 대해서 설정한다. marker 는 { {{ 와 같은 표식을
" 사용하여 폴딩 되는 소스의 범위를 설정 해 놓는다. 이는 이 파일을 다시
" 열었을때 기존의 폴더 정보를 그대로 유지 할수 있게 해 준다.
" =============================================================================
"set foldmethod=marker

" =============================================================================
" auto view setting
" =============================================================================

"let g:skipview_files = [
"            \ '[EXAMPLE PLUGIN BUFFER]'
"            \ ]
"function! MakeViewCheck()
"    if has('quickfix') && &buftype =~ 'nofile'
"        " Buffer is marked as not a file
"        return 0
"    endif
"    if empty(glob(expand('%:p')))
"        " File does not exist on disk
"        return 0
"    endif
"    if len($TEMP) && expand('%:p:h') == $TEMP
"        " We're in a temp dir
"        return 0
"    endif
"    if len($TMP) && expand('%:p:h') == $TMP
"        " Also in temp dir
"        return 0
"    endif
"    if index(g:skipview_files, expand('%')) >= 0
"        " File is in skip list
"        return 0
"    endif
"    return 1
"endfunction
"augroup vimrcAutoView
"    autocmd!
"    " Autosave & Load Views.
"    autocmd BufWritePost,BufLeave,WinLeave ?* if MakeViewCheck() | mkview | endif
"    autocmd BufWinEnter ?* if MakeViewCheck() | silent loadview | endif
"augroup end

" =============================================================================
" 폴더 설정이 되어 있는 파일을 열었을때 폴더 되어 있는 레벨을 설정한다.
" 기본값 0이고 모두 폴딩된다.
" =============================================================================
set fdl=0

" =============================================================================
" 소스파일이 폴딩 되어 있을때 폴딩범위를 보여주는 컬럼의 수를 설정한다.
" =============================================================================
"set fdc=3

" =============================================================================
" 파일 편집시 undo 할수 있는 최대 횟수를 설정한다.
" =============================================================================
set history=1000

" =============================================================================
" search 시 찾는 단어의 하이라이팅
" =============================================================================
set nohlsearch

" =============================================================================
" 찾기, 바꾸기 등에서 대소문자 구분을 하지 않는다.
" =============================================================================
"set ignorecase

" =============================================================================
" 줄번호를 보여 준다.
" =============================================================================
set number

" =============================================================================
" >>, << command 시 shift 할 크기를 정해준다 통상 와 동일하게 설정 하면 된다.
" =============================================================================
set shiftwidth=2

" =============================================================================
" 닫는 괄호")", 브라켓"}"을 입력시 매칭되는 여는 괄호, 브라켓에 잠시 커서가
" 위치했다가 다시 제자리로 돌아 온다.
" =============================================================================
set showmatch

" =============================================================================
" 화면 맨 아래 상태 줄이 어떻게 나오는 가를 형식화 하는 것이다.
" =============================================================================
"set statusline=\ %f\ %m%h%r\ [%P]\ %a\ %<%l:%v\

" ============================================================================= 
" Make command line two lines high
" ============================================================================= 
set ch=1

" =============================================================================
" 각 파일의 성격(?)에 맞게 색깔로 보여 준다.
" =============================================================================
syntax on

" =============================================================================
" :Man 맨 페이지를 볼수 있게 해 준다..
" =============================================================================
runtime ftplugin/man.vim

" =============================================================================
" 입력모드에서 한글상태일때 커서의 색깔을 다르게 한다.
" =============================================================================
highlight Cursor guibg=Red guifg=Black ctermbg=Red ctermfg=Black
highlight CursorIM guibg=Blue guifg=NONE ctermbg=Blue ctermfg=NONE

" =============================================================================
" TagExplorer 창크기 조절
" =============================================================================
"let TE_WinWidth = 25    " TagExplorer 창크기 조절
"Funtion Key F1~F11 Mapping

" =============================================================================
" 세로 절반 싸이즈로 창을 분할한다.
" 특정 싸이즈로 창을 분할하고 싶은 경우 30vs 처럼 숫자를 vs앞에 입력한다.
" =============================================================================
"map <F1> <ESC>:vs ./<CR>:set nonu<CR>
"map <C-F1> :sp ./<CR>:set nonu<CR>

" =============================================================================
" TagList
" =============================================================================
"map <F2> <ESC>:Tlist<CR>

" =============================================================================
" Visual Mode를 실행한다.
" =============================================================================
"map <F3> <ESC>:TagExplorer<CR>:set nonu<CR>

" =============================================================================
" F4키를 {,}사이를 folding 시키게 mapping시킨다.
" =============================================================================
map <F4> [{V]}zf

" =============================================================================
" (), {}자동 
" =============================================================================
au BufNewFile,BufRead *.c imap { {<CR>}<ESC>O
au BufNewFile,BufRead *.h imap { {<CR>}<ESC>O
au BufNewFile,BufRead *.cpp imap { {<CR>}<ESC>O

" =============================================================================
" 함수 단위로 folding marker 삽입하기
" =============================================================================
"au BufRead,BufNewFile *.c,*.cc,*.cpp,*.java
"\ map <C-a> mm?^{<CR>2kVjyPJI/* {{{ <ESC>f(Da () */<ESC>/^{<CR>%o/* }}} */<ESC>`m
"map <SPACE> za

" =============================================================================
" clipboard 설정
" =============================================================================
set clipboard=unnamed

" =============================================================================
" horizontal scroll bar 설정
" =============================================================================
:nnoremap <silent><expr> <f2> ':set wrap! go'.'-+'[&wrap]."=b\r"
:nnoremap <silent><expr> <leader>2 ':set wrap! go'.'-+'[&wrap]."=b\r"
":set wrap! go+=b<CR>
":set wrap! go-=b<CR>


" =============================================================================
" remap from ; to : - it's more useful!
" =============================================================================
noremap ; :
"noremap : <nop>

" =============================================================================
" Edit vimrc
" =============================================================================
nmap <leader>v :edit $MYVIMRC<CR>

" =============================================================================
" Vim 7.3 contains as new feature persistent undo
" =============================================================================
set noundofile

" =============================================================================
" unite
" =============================================================================
"nnoremap <leader>f :<C-u>Unite file_rec<CR>
nnoremap <leader>f :<C-u>Unite file_rec/async<CR>
nnoremap <leader>b :<C-u>Unite buffer bookmark<CR>
nnoremap <leader>o :<C-u>Unite outline<CR><C-w><S-_>
nnoremap <leader><Space> :Unite grep:.<CR>
"nnoremap <C-p> :Unite file_rec/async<cr>
"nnoremap <leader>r :<C-u>Unite -start-insert file_rec/async:!<CR>
"nnoremap <leader>f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec<cr><c-u>
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
"call unite#filters#sorter_default#use(['sorter_rank'])
"call unite#set_profile('files', 'smartcase', 1)
"call unite#custom#source('line,outline','matchers','matcher_fuzzy')
"let g:unite_prompt='≫ '
let g:unite_source_grep_command='ack'
let g:unite_source_grep_default_opts='-i --no-heading --no-color -k -H'
let g:unite_source_grep_recursive_opt=''


" encoding settins
set fenc=utf-8
set fencs=utf-8,cp949,euc-kr
set encoding=cp949
set langmenu=cp949


" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
"map <silent> <C-E> :call ToggleVExplorer()<CR>

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Change directory to the current buffer when opening files.
"set autochdir

"let g:mwDefaultHighlightingPalette='extended'
"let g:mwDefaultHighlightingPalette='maximum'

if has('unix')
	set t_Co=256

	"python -c "print ord(raw_input('char '))"
	"for x in {1..12}; do echo -n "F$x "; tput kf$x | cat -A; echo; done
	"special key : insert mode > Ctrl-v > 027 (linux)
  "noremap ^[[[A <F1>
  noremap A <F1>
  noremap B <F2>
  noremap C <F3>
  noremap D <F4>
  noremap E <F5>
  noremap 17~ <F6>
  noremap 18~ <F7>
  noremap 19~ <F8>
  noremap 20~ <F9>
  noremap 21~ <F10>
  noremap 23~ <F11>
  noremap 24~ <F12>
endif

set bg=dark
colorscheme molokai
"let g:molokai_original = 1
"let g:rehash256 = 1
"set background=dark

set colorcolumn=80
"autocmd FileType c highlight OverLength ctermbg=darkred ctermfg=white
"autocmd FileType c match OverLength /\%>80v.\+\|\s\+$\|^\s*\n\+\%$/

" 100 columns for HTML
" autocmd BufRead *.html highlight OverLength ctermbg=darkred ctermfg=white
" autocmd BufRead *.html match OverLength /\%100v.\+/

