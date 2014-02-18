
" =============================================================================
" ±âº»ÀûÀ¸·Î ¼³Á¤µÇ´Â ¿¹Á¦µéÀ» Æ÷ÇÔ ÇÑ´Ù. history .. µî..
" =============================================================================
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/gvimrc_example.vim

" =============================================================================
" À©µµ¿ì¿¡¼­¸¸ »ç¿ëµÇ´Â ¿©·¯°¡Áö Å° ¸ÊµéÀ» Æ÷ÇÔÇÑ´Ù.
" C-v, C-c, C-q, C-a µî...
" =============================================================================
if has("win32")
	source $VIMRUNTIME/mswin.vim
endif

" =============================================================================
" ±¸½Ä vi ¿Í µ¿ÀÏÇÏ°Ô ÀÛµ¿ÇÒ °ÍÀÎ°¡¿¡ ´ëÇÑ ¿É¼ÇÀÌ´Ù. ±¸½Ä vi¿Í µ¿ÀÏÇÏ°Ô
" ÀÛµ¿ÇÏµµ·Ï ¼³Á¤µÈ´Ù¸é ¸¹Àº Æí¸®ÇÑ ±â´ÉÀ» »ç¿ëÇÒ¼ö ¾øÀ» °ÍÀÌ´Ù.
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
	set runtimepath+=~/.vim/bundle/neobundle.vim/
	"set runtimepath+=C:\Program\ Files\ (x86)/Vim/vimfiles/bundle/neobundle.vim/
	"set runtimepath+=C:\Program\ Files/Vim/vimfiles/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
let g:make = 'gmake'
if system('uname -o') =~ '^GNU/'
	let g:make = 'make'
endif
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
"NeoBundle 'git://git.wincent.com/command-t.git'
NeoBundle 'https://github.com/chazy/cscope_maps.git'
NeoBundle 'https://github.com/wesleyche/SrcExpl.git'
NeoBundle 'The-NERD-tree'
NeoBundle 'Tagbar'
nnoremap <silent> <F11> :TagbarToggle<CR>
let g:tagbar_width = 60

"NeoBundle 'haya14busa/vim-easymotion'
NeoBundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_smartcase = 1
"n-character search motion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

map <SPACE> <Plug>(easymotion-s2)

NeoBundle 'https://github.com/terryma/vim-expand-region'
NeoBundle 'bling/vim-airline'
set laststatus=2
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

"powerline symbols
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_left_sep = 'þó'
let g:airline_left_alt_sep = 'þô'
let g:airline_right_sep = 'þõ'
let g:airline_right_alt_sep = 'þö'
let g:airline_symbols.branch = 'þã'
let g:airline_symbols.readonly = 'þå'
let g:airline_symbols.linenr = 'þä'


NeoBundle 'vim-startify'
let g:startify_custom_indices = ['f', 'g', 'h', 'r', 'i', 'o', 'b']

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
"let g:neocomplcache_enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
autocmd FileType txt :NeoCompleteDisable
autocmd FileType c,cpp,asm,h :NeoCompleteEnable

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
	let g:syntastic_error_symbol = '¡Ú'
	let g:syntastic_style_error_symbol = '>'
	let g:syntastic_warning_symbol = '?'
	let g:syntastic_style_warning_symbol = '>'
else
	let g:syntastic_error_symbol = '!'
	let g:syntastic_style_error_symbol = '>'
	let g:syntastic_warning_symbol = '.'
	let g:syntastic_style_warning_symbol = '>'
endif

NeoBundle 'wannesm/wmgraphviz.vim'

filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck

" =============================================================================
" <Leader> ¼³Á¤ (mapleaderº¯¼ö ÀÌ¿ë)
" =============================================================================
let mapleader = ","

" =============================================================================
" À©µµ¿ì »ç¿ë½Ã gvimÀÇ ÆùÆ®¹× gui ¿É¼ÇÀ» ¼³Á¤ÇÑ´Ù. gui ¿É¼ÇÀº ¸Þ´º, ½ºÅ©·Ñ¹Ù,
" Åø¹Ù, ½ºÅ©·Ñ¹ÙÀÇ À§Ä¡ ±âÅ¸ µîµî gvim »ç¿ë½Ã º¸¿© Áö´Â °Íµé¿¡ ´ëÇÑ ¿É¼ÇÀ»
" ¼³Á¤ÇÏ´Â °ÍÀÌ´Ù. ¾Æ·¡ÀÇ ¼³Á¤Àº ¾Æ¹«°Íµµ ¾øÀÌ »ç¿ëÇÏ´Â °ÍÀÌ´Ù.
" =============================================================================
if has("win32")
	"set guifont=³ª´®°íµñÄÚµù:h10:cHANGEUL
	"set guifont=DejaVu\ Sans\ Mono:h10  "font setting
	set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10
	"set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
	"set guioptions-=r  "remove right-hand scroll bar
endif

" =============================================================================
" ÀÏº»¾î¿Í ÇÑ±¹¾î Åä±Û
" =============================================================================
"map <F5> :se enc=japan<CR>:se guifont=IPAGothic:h12<CR>
"map <F5> :se enc=sjis<CR>:se guifont=IPAGothic:h10<CR>
"map <F5> :se enc=sjis<CR>:se guifont=MS\ Gothic<CR>
"map <F6> :se enc=korea<CR>:se guifont=±¼¸²Ã¼:h9:cHANGEUL<CR>
"map <F6> :se enc=korea<CR>:se guifont=Envy\ Code\ R<CR>
"map <F6> :se enc=korea<CR>:se guifont=³ª´®°íµñÄÚµù:h10:cHANGEUL<CR>

" =============================================================================
" MS-WINDOWS ¿¡¼­ Ã¢ Å©±â ÃÖ´ëÈ­ ÇÏ±â
" =============================================================================
""<F8> - :simalt~x
"if has("unix")
"elseif has("win32")
"    map <F8> :simalt~x<CR>
"    imap <F8> :simalt~x<CR>
"endif
au GUIEnter * simalt ~x

" =============================================================================
" Taglist ¿¡ ´ëÇÑ ¼³Á¤
" =============================================================================
set tags=./tags,tags
"set tags+=D:\work\svn-kissco\M5MoLS\trunk\M5MoLS\source\tags

" =============================================================================
" Mark ¿¡ ´ëÇÑ ¼³Á¤
" =============================================================================
set viminfo+=!  " Save and restore global variables.
let g:mwDefaultHighlightingPalette = 'maximum'
" ³»°¡ ¾µ group ¼³Á¤
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
" cscope ¿¡ ´ëÇÑ ¼³Á¤
" =============================================================================
if filereadable("./cscope.out")
	cs add ./cscope.out
	"elseif filereadable("./main.cpp")
	"	cs add C:\QtSDK\Desktop\Qt\4.7.3\mingw\include\cscope.out
else
	"	cd D:\work\svn-kissco\M5MoLS\trunk\M5MoLS\source
	"	cs add D:\work\svn-kissco\M5MoLS\trunk\M5MoLS\source\cscope.out
endif

" cscope.outÀç»ý¼ºÇÏ°í Àç¿¬°á


" =============================================================================
" Ã£±â, ¹Ù²Ù±â µî¿¡¼­ ´ë¼Ò¹®ÀÚ ±¸ºÐÀ» ÇÏÁö ¾Ê´Â´Ù.
" =============================================================================
set ignorecase

"=============================================================================
" Tab¸¦ ´­·¶À»¶§ 4Ä­ ÀÌµ¿
" =============================================================================
"set tabstop=4
set tabstop=2
" c, cpp, hµéÀ» ÆíÁýÇÒ¶§¸¸ tabÀ» space ·Î ÀÚµ¿º¯È¯
au Bufenter *.\(c\|cpp\|h\) set et

" =============================================================================
" ÀÚµ¿ µé¿©¾²±â
" =============================================================================
set autoindent

" =============================================================================
" C¿¡¼­ ÀÚµ¿µé¿©¾²±â
" =============================================================================
set cindent

" =============================================================================
" Á»´õ ¶È¶ÈÇÑ ÀÚµ¿µé¿©¾²±â
" =============================================================================
set smartindent

" =============================================================================
" ÁÖ¼® ÀÚµ¿ ÀÎµ§Æ®
" =============================================================================
"autocmd FileType c,cpp,cc,C  set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,:// shiftwidth=4

" =============================================================================
" ¹é¾÷ÆÄÀÏÀ» »ý¼ºÇÏÁö ¾ÊÀ½
" =============================================================================
set nobackup

" =============================================================================
" Æú´õ¸¦ »ç¿ëÇÏ´Â ¹æ¹ý¿¡ ´ëÇØ¼­ ¼³Á¤ÇÑ´Ù. marker ´Â { {{ ¿Í °°Àº Ç¥½ÄÀ»
" »ç¿ëÇÏ¿© Æúµù µÇ´Â ¼Ò½ºÀÇ ¹üÀ§¸¦ ¼³Á¤ ÇØ ³õ´Â´Ù. ÀÌ´Â ÀÌ ÆÄÀÏÀ» ´Ù½Ã
" ¿­¾úÀ»¶§ ±âÁ¸ÀÇ Æú´õ Á¤º¸¸¦ ±×´ë·Î À¯Áö ÇÒ¼ö ÀÖ°Ô ÇØ ÁØ´Ù.
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
" Æú´õ ¼³Á¤ÀÌ µÇ¾î ÀÖ´Â ÆÄÀÏÀ» ¿­¾úÀ»¶§ Æú´õ µÇ¾î ÀÖ´Â ·¹º§À» ¼³Á¤ÇÑ´Ù.
" ±âº»°ª 0ÀÌ°í ¸ðµÎ ÆúµùµÈ´Ù.
" =============================================================================
set fdl=0

" =============================================================================
" ¼Ò½ºÆÄÀÏÀÌ Æúµù µÇ¾î ÀÖÀ»¶§ Æúµù¹üÀ§¸¦ º¸¿©ÁÖ´Â ÄÃ·³ÀÇ ¼ö¸¦ ¼³Á¤ÇÑ´Ù.
" =============================================================================
"set fdc=3

" =============================================================================
" ÆÄÀÏ ÆíÁý½Ã undo ÇÒ¼ö ÀÖ´Â ÃÖ´ë È½¼ö¸¦ ¼³Á¤ÇÑ´Ù.
" =============================================================================
set history=1000

" =============================================================================
" search ½Ã Ã£´Â ´Ü¾îÀÇ ÇÏÀÌ¶óÀÌÆÃ
" =============================================================================
set nohlsearch

" =============================================================================
" Ã£±â, ¹Ù²Ù±â µî¿¡¼­ ´ë¼Ò¹®ÀÚ ±¸ºÐÀ» ÇÏÁö ¾Ê´Â´Ù.
" =============================================================================
"set ignorecase

" =============================================================================
" ÁÙ¹øÈ£¸¦ º¸¿© ÁØ´Ù.
" =============================================================================
set number

" =============================================================================
" >>, << command ½Ã shift ÇÒ Å©±â¸¦ Á¤ÇØÁØ´Ù Åë»ó ¿Í µ¿ÀÏÇÏ°Ô ¼³Á¤ ÇÏ¸é µÈ´Ù.
" =============================================================================
set shiftwidth=2

" =============================================================================
" ´Ý´Â °ýÈ£")", ºê¶óÄÏ"}"À» ÀÔ·Â½Ã ¸ÅÄªµÇ´Â ¿©´Â °ýÈ£, ºê¶óÄÏ¿¡ Àá½Ã Ä¿¼­°¡
" À§Ä¡Çß´Ù°¡ ´Ù½Ã Á¦ÀÚ¸®·Î µ¹¾Æ ¿Â´Ù.
" =============================================================================
set showmatch

" =============================================================================
" È­¸é ¸Ç ¾Æ·¡ »óÅÂ ÁÙÀÌ ¾î¶»°Ô ³ª¿À´Â °¡¸¦ Çü½ÄÈ­ ÇÏ´Â °ÍÀÌ´Ù.
" =============================================================================
"set statusline=\ %f\ %m%h%r\ [%P]\ %a\ %<%l:%v\

" ============================================================================= 
" Make command line two lines high
" ============================================================================= 
set ch=1

" =============================================================================
" °¢ ÆÄÀÏÀÇ ¼º°Ý(?)¿¡ ¸Â°Ô »ö±ò·Î º¸¿© ÁØ´Ù.
" =============================================================================
syntax on

" =============================================================================
" :Man ¸Ç ÆäÀÌÁö¸¦ º¼¼ö ÀÖ°Ô ÇØ ÁØ´Ù..
" =============================================================================
runtime ftplugin/man.vim

" =============================================================================
" ÀÔ·Â¸ðµå¿¡¼­ ÇÑ±Û»óÅÂÀÏ¶§ Ä¿¼­ÀÇ »ö±òÀ» ´Ù¸£°Ô ÇÑ´Ù.
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
" TagExplorer Ã¢Å©±â Á¶Àý
" =============================================================================
"let TE_WinWidth = 25    " TagExplorer Ã¢Å©±â Á¶Àý
"Funtion Key F1~F11 Mapping
" =============================================================================
" ¼¼·Î Àý¹Ý ½ÎÀÌÁî·Î Ã¢À» ºÐÇÒÇÑ´Ù.
" Æ¯Á¤ ½ÎÀÌÁî·Î Ã¢À» ºÐÇÒÇÏ°í ½ÍÀº °æ¿ì 30vs Ã³·³ ¼ýÀÚ¸¦ vs¾Õ¿¡ ÀÔ·ÂÇÑ´Ù.
" =============================================================================
"map <F1> <ESC>:vs ./<CR>:set nonu<CR>
"map <C-F1> :sp ./<CR>:set nonu<CR>

" =============================================================================
" TagList
" =============================================================================
"map <F2> <ESC>:Tlist<CR>

" =============================================================================
" Visual Mode¸¦ ½ÇÇàÇÑ´Ù.
" =============================================================================
"map <F3> <ESC>:TagExplorer<CR>:set nonu<CR>

" =============================================================================
" F4Å°¸¦ {,}»çÀÌ¸¦ folding ½ÃÅ°°Ô mapping½ÃÅ²´Ù.
" =============================================================================
map <F4> [{V]}zf

" =============================================================================
" (), {}ÀÚµ¿ 
" =============================================================================
au BufNewFile,BufRead *.c imap { {<CR>}<ESC>O
au BufNewFile,BufRead *.h imap { {<CR>}<ESC>O
au BufNewFile,BufRead *.cpp imap { {<CR>}<ESC>O

" =============================================================================
" ÇÔ¼ö ´ÜÀ§·Î folding marker »ðÀÔÇÏ±â
" =============================================================================
"au BufRead,BufNewFile *.c,*.cc,*.cpp,*.java
"\ map <C-a> mm?^{<CR>2kVjyPJI/* {{{ <ESC>f(Da () */<ESC>/^{<CR>%o/* }}} */<ESC>`m
"map <SPACE> za

" =============================================================================
" hangeul.vim °ü·Ã ¼³Á¤ 
" http://mearie.org/projects/vim-hangeul/
" =============================================================================
" let hangeul_enabled = 1
" ÇÑ¿µ ÀüÈ¯ ±Û¼è´Â ±âº»ÀûÀ¸·Î <C-\><Space>
" ÇÑÀÚ º¯È¯ ±Û¼è <C-\><CR> : ÇÑÀÚ µ¥ÀÌÅÍº£ÀÌ½º ÆÄÀÏ ÇÊ¿ä
" svn export svn://kldp.net/svnroot/hangul/libhangul/trunk/data/hanja/hanja.txt
" hangeul_default_mode = 2s "µÎ¹ú½Ä('2s'), ¼¼¹ú½Ä ÃÖÁ¾('3f'), ¼¼¹ú½Ä 390('39')
" hangeul_cmdline "ÀÔ·Â ¸ðµå »Ó¸¸ ¾Æ´Ï¶ó ¸í·ÉÁÙ ¸ðµå¿Í °Ë»öÁÙ¿¡¼­µµ ÇÑ±Û ÀÔ·ÂÀÌ °¡´É
" hangeul_hanja_path "hanja.txt ÆÄÀÏÀ» Ã£À» °æ·Î¸¦ ÁöÁ¤
" hangeul_hanja_desc_limit = 1 "ÇÑÀÚÀÇ ¶æ°ú À½À» ¾ó¸¶³ª º¸¿© ÁÙ Áö¸¦ °áÁ¤

" =============================================================================
" clipboard ¼³Á¤
" =============================================================================
set clipboard=unnamed

" =============================================================================
" horizontal scroll bar ¼³Á¤
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
" Edit vimrc
" =============================================================================
nmap ,v :edit $MYVIMRC<CR>

" =============================================================================
" unite
" =============================================================================
nnoremap <leader>f :<C-u>Unite file_rec<CR>
"nnoremap <C-p> :Unite file_rec/async<cr>
"nnoremap <leader>r :<C-u>Unite -start-insert file_rec/async:!<CR>
"nnoremap <leader>f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec<cr><c-u>
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
"call unite#filters#sorter_default#use(['sorter_rank'])
"call unite#set_profile('files', 'smartcase', 1)
"call unite#custom#source('line,outline','matchers','matcher_fuzzy')
"let g:unite_prompt='¡í '
let g:unite_source_grep_command='ack'
let g:unite_source_grep_default_opts='--no-heading --no-color -a -C4'
let g:unite_source_grep_recursive_opt=''


" encoding settins
set fenc=utf-8
set fencs=utf-8,cp949,euc-kr
set encoding=cp949
set langmenu=cp949



