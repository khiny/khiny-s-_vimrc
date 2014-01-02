
" =============================================================================
" 기본적으로 설정되는 예제들을 포함 한다. history .. 등..
" =============================================================================
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/gvimrc_example.vim

" =============================================================================
" 윈도우에서만 사용되는 여러가지 키 맵들을 포함한다.
" C-v, C-c, C-q, C-a 등...
" =============================================================================
if has("win32")
    source $VIMRUNTIME/mswin.vim
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

" =============================================================================
" pathogen.vim
" =============================================================================
" runtime bundle/vim-pathogen/autoload/pathogen.vim
" call pathogen#infect()

if has('vim_starting')
   set nocompatible               " Be iMproved
   "set runtimepath+=~/.vim/bundle/neobundle.vim/
   set runtimepath+=C:\Program\ Files\ (x86)/Vim/vimfiles/bundle/neobundle.vim/
 endif

 call neobundle#rc(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 NeoBundleFetch 'Shougo/neobundle.vim'

 " Recommended to install
 NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 "
 " Note: You don't set neobundle setting in .gvimrc!

 " ...
NeoBundle 'https://github.com/Shougo/unite.vim'
NeoBundle 'molokai'
NeoBundle 'git://git.wincent.com/command-t.git'
NeoBundle 'https://github.com/chazy/cscope_maps.git'
NeoBundle 'https://github.com/wesleyche/SrcExpl.git'
NeoBundle 'The-NERD-tree'
NeoBundle 'Tagbar'
NeoBundle 'haya14busa/vim-easymotion'
NeoBundle 'https://github.com/terryma/vim-expand-region'
NeoBundle 'vim-startify'
let g:startify_custom_indices = ['f', 'g', 'h', 'r', 'i', 'o', 'b']

NeoBundle 'vim-multiple-cursors'
"NeoBundle 'ack.vim'
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

 filetype plugin indent on     " Required!
 "
 " Brief help
 " :NeoBundleList          - list configured bundles
 " :NeoBundleInstall(!)    - install(update) bundles
 " :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

 " Installation check.
 NeoBundleCheck

" =============================================================================
" <Leader> 설정 (mapleader변수 이용)
" =============================================================================
let mapleader = ","

" =============================================================================
" 윈도우 사용시 gvim의 폰트및 gui 옵션을 설정한다. gui 옵션은 메뉴, 스크롤바,
" 툴바, 스크롤바의 위치 기타 등등 gvim 사용시 보여 지는 것들에 대한 옵션을
" 설정하는 것이다. 아래의 설정은 아무것도 없이 사용하는 것이다.
" =============================================================================
if has("win32")
    "set guifont=나눔고딕코딩:h10:cHANGEUL
    set guifont=DejaVu\ Sans\ Mono:h10  "font setting
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
" Tagbar 에 대한 설정
" =============================================================================
nnoremap <silent> <F11> :TagbarToggle<CR>

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
" NERDtree
" =============================================================================
map <F10> :NERDTreeToggle<CR>
let NERDTreeWinSize=44
let NERDTreeShowBookmarks=1
let NERDTreeHighlightCursorline=1

" =============================================================================
" SrcExpl
" =============================================================================
nmap <F9> :SrcExplToggle<CR> 
let g:SrcExpl_refreshTime = 100 
let g:SrcExpl_winHeight = 14
let g:SrcExpl_isUpdateTags = 0
let g:SrcExpl_updateTagsCmd = "ctags -L cscope.files" 

" =============================================================================
" haya14busa/vim-easymotion
" =============================================================================
map <SPACE> <Plug>(easymotion-s)
let g:EasyMotion_smartcase = 1

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
let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|swp|class|pyc|orig|lib)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
map <leader>ff <ESC>:FufFile **/<CR>
"map <leader>fb <ESC>:FufBuffer **/<CR>
map <leader>fd <ESC>:FufDir **/<CR>

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

let g:skipview_files = [
            \ '[EXAMPLE PLUGIN BUFFER]'
            \ ]
function! MakeViewCheck()
    if has('quickfix') && &buftype =~ 'nofile'
        " Buffer is marked as not a file
        return 0
    endif
    if empty(glob(expand('%:p')))
        " File does not exist on disk
        return 0
    endif
    if len($TEMP) && expand('%:p:h') == $TEMP
        " We're in a temp dir
        return 0
    endif
    if len($TMP) && expand('%:p:h') == $TMP
        " Also in temp dir
        return 0
    endif
    if index(g:skipview_files, expand('%')) >= 0
        " File is in skip list
        return 0
    endif
    return 1
endfunction
augroup vimrcAutoView
    autocmd!
    " Autosave & Load Views.
    autocmd BufWritePost,BufLeave,WinLeave ?* if MakeViewCheck() | mkview | endif
    autocmd BufWinEnter ?* if MakeViewCheck() | silent loadview | endif
augroup end

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
" search 시 찾는 단어를 하이라이팅 해 준다.
" =============================================================================
set hlsearch

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
set statusline=\ %f\ %m%h%r\ [%P]\ %a\ %<%l:%v\

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
" statusline, stl
" =============================================================================


"colorscheme torte
"colorscheme desert

" ===== molokai =====
colorscheme molokai
"let g:molokai_original = 1
"let g:rehash256 = 1
"set background=dark
" ===== molokai =====

"set background=dark
"colorscheme solarized

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
" hangeul.vim 관련 설정 
" http://mearie.org/projects/vim-hangeul/
" =============================================================================
" let hangeul_enabled = 1
" 한영 전환 글쇠는 기본적으로 <C-\><Space>
" 한자 변환 글쇠 <C-\><CR> : 한자 데이터베이스 파일 필요
" svn export svn://kldp.net/svnroot/hangul/libhangul/trunk/data/hanja/hanja.txt
" hangeul_default_mode = 2s "두벌식('2s'), 세벌식 최종('3f'), 세벌식 390('39')
" hangeul_cmdline "입력 모드 뿐만 아니라 명령줄 모드와 검색줄에서도 한글 입력이 가능
" hangeul_hanja_path "hanja.txt 파일을 찾을 경로를 지정
" hangeul_hanja_desc_limit = 1 "한자의 뜻과 음을 얼마나 보여 줄 지를 결정

" =============================================================================
" clipboard 설정
" =============================================================================
set clipboard=unnamed

" =============================================================================
" horizontal scroll bar 설정
" =============================================================================
:nnoremap <silent><expr> <f2> ':set wrap! go'.'-+'[&wrap]."=b\r"
":set wrap! go+=b<CR>
":set wrap! go-=b<CR>


" =============================================================================
" remap from ; to : - it's more useful!
" =============================================================================
noremap ; :
"noremap : <nop>

" =============================================================================
" unite
" =============================================================================
nnoremap <leader>f :<C-u>Unite file<CR>
"nnoremap <C-p> :Unite file_rec/async<cr>
"nnoremap <leader>r :<C-u>Unite -start-insert file_rec/async:!<CR>
"nnoremap <leader>f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec<cr><c-u>
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
"call unite#filters#sorter_default#use(['sorter_rank'])
"call unite#set_profile('files', 'smartcase', 1)
"call unite#custom#source('line,outline','matchers','matcher_fuzzy')
"let g:unite_prompt='≫ '
let g:unite_source_grep_command='ack'
let g:unite_source_grep_default_opts='--no-heading --no-color -a -C4'
let g:unite_source_grep_recursive_opt=''
