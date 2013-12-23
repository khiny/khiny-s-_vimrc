
" =============================================================================
" �⺻������ �����Ǵ� �������� ���� �Ѵ�. history .. ��..
" =============================================================================
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/gvimrc_example.vim

" =============================================================================
" �����쿡���� ���Ǵ� �������� Ű �ʵ��� �����Ѵ�.
" C-v, C-c, C-q, C-a ��...
" =============================================================================
if has("win32")
    source $VIMRUNTIME/mswin.vim
endif

" =============================================================================
" ���� vi �� �����ϰ� �۵��� ���ΰ��� ���� �ɼ��̴�. ���� vi�� �����ϰ�
" �۵��ϵ��� �����ȴٸ� ���� ���� ����� ����Ҽ� ���� ���̴�.
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

" =============================================================================
" vundle
" =============================================================================
"set rtp+=~/.vim/bundle/vundle/
"set rtp+=C:\Program\ Files\ (x86)/Vim/vimfiles/bundle/vundle
set rtp+=C:\Program\ Files/Vim/vimfiles/bundle/vundle
call vundle#rc()

 " let Vundle manage Vundle
 " required! 
Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
Bundle 'haya14busa/vim-easymotion'
"Bundle 'L9'
Bundle 'rstacruz/sparkup', {'rtp': 'vim'}
 " vim-scripts repos
Bundle 'FuzzyFinder'
Bundle 'L9'
Bundle 'The-NERD-tree'
Bundle 'Tagbar'
"Bundle 'minibufexpl.vim'
" Bundle 'rails.vim'
Bundle 'ack.vim'
Bundle 'molokai'

 " non github repos
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'https://github.com/chazy/cscope_maps.git'
Bundle 'https://github.com/wesleyche/SrcExpl.git'
""Bundle 'Mark'		"It's too old!
" ...

 filetype plugin indent on     " required! 
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..
" =============================================================================


" =============================================================================
" <Leader> ���� (mapleader���� �̿�)
" =============================================================================
let mapleader = ","

" =============================================================================
" ������ ���� gvim�� ��Ʈ�� gui �ɼ��� �����Ѵ�. gui �ɼ��� �޴�, ��ũ�ѹ�,
" ����, ��ũ�ѹ��� ��ġ ��Ÿ ��� gvim ���� ���� ���� �͵鿡 ���� �ɼ���
" �����ϴ� ���̴�. �Ʒ��� ������ �ƹ��͵� ���� ����ϴ� ���̴�.
" =============================================================================
if has("win32")
    "set guifont=��������ڵ�:h10:cHANGEUL
    set guifont=DejaVu\ Sans\ Mono:h10  "font setting
    "set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    "set guioptions-=r  "remove right-hand scroll bar
endif

" =============================================================================
" �Ϻ���� �ѱ��� ���
" =============================================================================
"map <F5> :se enc=japan<CR>:se guifont=IPAGothic:h12<CR>
"map <F5> :se enc=sjis<CR>:se guifont=IPAGothic:h10<CR>
"map <F5> :se enc=sjis<CR>:se guifont=MS\ Gothic<CR>
"map <F6> :se enc=korea<CR>:se guifont=����ü:h9:cHANGEUL<CR>
"map <F6> :se enc=korea<CR>:se guifont=Envy\ Code\ R<CR>
"map <F6> :se enc=korea<CR>:se guifont=��������ڵ�:h10:cHANGEUL<CR>

" =============================================================================
" MS-WINDOWS ���� â ũ�� �ִ�ȭ �ϱ�
" =============================================================================
""<F8> - :simalt~x
"if has("unix")
"elseif has("win32")
"    map <F8> :simalt~x<CR>
"    imap <F8> :simalt~x<CR>
"endif
au GUIEnter * simalt ~x

" =============================================================================
" Taglist �� ���� ����
" =============================================================================
set tags=./tags,tags
"set tags+=D:\work\svn-kissco\M5MoLS\trunk\M5MoLS\source\tags

" =============================================================================
" Tagbar �� ���� ����
" =============================================================================
nnoremap <silent> <F11> :TagbarToggle<CR>

" =============================================================================
" Mark �� ���� ����
" =============================================================================
set viminfo+=!  " Save and restore global variables.
let g:mwDefaultHighlightingPalette = 'maximum'
" ���� �� group ����
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
" cscope �� ���� ����
" =============================================================================
if filereadable("./cscope.out")
	cs add ./cscope.out
"elseif filereadable("./main.cpp")
"	cs add C:\QtSDK\Desktop\Qt\4.7.3\mingw\include\cscope.out
else
"	cd D:\work\svn-kissco\M5MoLS\trunk\M5MoLS\source
"	cs add D:\work\svn-kissco\M5MoLS\trunk\M5MoLS\source\cscope.out
endif

" cscope.out������ϰ� �翬��


" =============================================================================
" ã��, �ٲٱ� ��� ��ҹ��� ������ ���� �ʴ´�.
" =============================================================================
set ignorecase

"=============================================================================
" Tab�� �������� 4ĭ �̵�
" =============================================================================
"set tabstop=4
set tabstop=2
" c, cpp, h���� �����Ҷ��� tab�� space �� �ڵ���ȯ
au Bufenter *.\(c\|cpp\|h\) set et

" =============================================================================
" �ڵ� �鿩����
" =============================================================================
set autoindent

" =============================================================================
" C���� �ڵ��鿩����
" =============================================================================
set cindent

" =============================================================================
" ���� �ȶ��� �ڵ��鿩����
" =============================================================================
set smartindent

" =============================================================================
" �ּ� �ڵ� �ε�Ʈ
" =============================================================================
"autocmd FileType c,cpp,cc,C  set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,:// shiftwidth=4

" =============================================================================
" ��������� �������� ����
" =============================================================================
set nobackup

" =============================================================================
" ������ ����ϴ� ����� ���ؼ� �����Ѵ�. marker �� { {{ �� ���� ǥ����
" ����Ͽ� ���� �Ǵ� �ҽ��� ������ ���� �� ���´�. �̴� �� ������ �ٽ�
" �������� ������ ���� ������ �״�� ���� �Ҽ� �ְ� �� �ش�.
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
" ���� ������ �Ǿ� �ִ� ������ �������� ���� �Ǿ� �ִ� ������ �����Ѵ�.
" �⺻�� 0�̰� ��� �����ȴ�.
" =============================================================================
set fdl=0

" =============================================================================
" �ҽ������� ���� �Ǿ� ������ ���������� �����ִ� �÷��� ���� �����Ѵ�.
" =============================================================================
"set fdc=3

" =============================================================================
" ���� ������ undo �Ҽ� �ִ� �ִ� Ƚ���� �����Ѵ�.
" =============================================================================
set history=1000

" =============================================================================
" search �� ã�� �ܾ ���̶����� �� �ش�.
" =============================================================================
set hlsearch

" =============================================================================
" ã��, �ٲٱ� ��� ��ҹ��� ������ ���� �ʴ´�.
" =============================================================================
"set ignorecase

" =============================================================================
" �ٹ�ȣ�� ���� �ش�.
" =============================================================================
set number

" =============================================================================
" >>, << command �� shift �� ũ�⸦ �����ش� ��� �� �����ϰ� ���� �ϸ� �ȴ�.
" =============================================================================
set shiftwidth=2

" =============================================================================
" �ݴ� ��ȣ")", �����"}"�� �Է½� ��Ī�Ǵ� ���� ��ȣ, ����Ͽ� ��� Ŀ����
" ��ġ�ߴٰ� �ٽ� ���ڸ��� ���� �´�.
" =============================================================================
set showmatch

" =============================================================================
" ȭ�� �� �Ʒ� ���� ���� ��� ������ ���� ����ȭ �ϴ� ���̴�.
" =============================================================================
set statusline=\ %f\ %m%h%r\ [%P]\ %a\ %<%l:%v\

" ============================================================================= 
" Make command line two lines high
" ============================================================================= 
set ch=1

" =============================================================================
" �� ������ ����(?)�� �°� ����� ���� �ش�.
" =============================================================================
syntax on

" =============================================================================
" :Man �� �������� ���� �ְ� �� �ش�..
" =============================================================================
runtime ftplugin/man.vim

" =============================================================================
" �Է¸�忡�� �ѱۻ����϶� Ŀ���� ������ �ٸ��� �Ѵ�.
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
" TagExplorer âũ�� ����
" =============================================================================
"let TE_WinWidth = 25    " TagExplorer âũ�� ����
"Funtion Key F1~F11 Mapping
" =============================================================================
" ���� ���� ������� â�� �����Ѵ�.
" Ư�� ������� â�� �����ϰ� ���� ��� 30vs ó�� ���ڸ� vs�տ� �Է��Ѵ�.
" =============================================================================
"map <F1> <ESC>:vs ./<CR>:set nonu<CR>
"map <C-F1> :sp ./<CR>:set nonu<CR>

" =============================================================================
" TagList
" =============================================================================
"map <F2> <ESC>:Tlist<CR>

" =============================================================================
" Visual Mode�� �����Ѵ�.
" =============================================================================
"map <F3> <ESC>:TagExplorer<CR>:set nonu<CR>

" =============================================================================
" F4Ű�� {,}���̸� folding ��Ű�� mapping��Ų��.
" =============================================================================
map <F4> [{V]}zf

" =============================================================================
" (), {}�ڵ� 
" =============================================================================
 au BufNewFile,BufRead *.c imap { {<CR>}<ESC>O
 au BufNewFile,BufRead *.h imap { {<CR>}<ESC>O
 au BufNewFile,BufRead *.cpp imap { {<CR>}<ESC>O

" =============================================================================
" �Լ� ������ folding marker �����ϱ�
" =============================================================================
"au BufRead,BufNewFile *.c,*.cc,*.cpp,*.java
"\ map <C-a> mm?^{<CR>2kVjyPJI/* {{{ <ESC>f(Da () */<ESC>/^{<CR>%o/* }}} */<ESC>`m
"map <SPACE> za

" =============================================================================
" hangeul.vim ���� ���� 
" http://mearie.org/projects/vim-hangeul/
" =============================================================================
" let hangeul_enabled = 1
" �ѿ� ��ȯ �ۼ�� �⺻������ <C-\><Space>
" ���� ��ȯ �ۼ� <C-\><CR> : ���� �����ͺ��̽� ���� �ʿ�
" svn export svn://kldp.net/svnroot/hangul/libhangul/trunk/data/hanja/hanja.txt
" hangeul_default_mode = 2s "�ι���('2s'), ������ ����('3f'), ������ 390('39')
" hangeul_cmdline "�Է� ��� �Ӹ� �ƴ϶� ����� ���� �˻��ٿ����� �ѱ� �Է��� ����
" hangeul_hanja_path "hanja.txt ������ ã�� ��θ� ����
" hangeul_hanja_desc_limit = 1 "������ ��� ���� �󸶳� ���� �� ���� ����

" =============================================================================
" clipboard ����
" =============================================================================
set clipboard=unnamed

" =============================================================================
" horizontal scroll bar ����
" =============================================================================
:nnoremap <silent><expr> <f2> ':set wrap! go'.'-+'[&wrap]."=b\r"
":set wrap! go+=b<CR>
":set wrap! go-=b<CR>


