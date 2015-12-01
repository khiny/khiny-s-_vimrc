
" =============================================================================
" ±âº»ÀûÀ¸·Î ¼³Á¤µÇ´Â ¿¹Á¦µéÀ» Æ÷ÇÔ ÇÑ´Ù. history .. µî..
" =============================================================================
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/gvimrc_example.vim

" =============================================================================
" À©µµ¿ì¿¡¼­¸¸ »ç¿ëµÇ´Â ¿©·¯°¡Áö Å° ¸ÊµéÀ» Æ÷ÇÔÇÑ´Ù.
" C-v, C-c, C-q, C-a µî...
" =============================================================================
if has("win32")
"	source $VIMRUNTIME/mswin.vim
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
let g:airline_left_sep = 'þ?
let g:airline_left_alt_sep = 'þ?
"let g:airline_right_sep = 'þ?
let g:airline_right_sep = ''
"let g:airline_right_alt_sep = 'þ?
let g:airline_symbols.branch = 'þ?
let g:airline_symbols.readonly = 'þ?
let g:airline_symbols.linenr = 'þ?

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
"let g:indentLine_char = '¡í'
let g:indentLine_char = '|'
"let g:indentLine_leadingSpaceChar = '¡¤'
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
" <Leader> ¼³Á¤ (mapleaderº¯¼ö ÀÌ¿ë)
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
" À©µµ¿ì »ç¿ë½Ã gvimÀÇ ÆùÆ®¹× gui ¿É¼ÇÀ» ¼³Á¤ÇÑ´Ù. gui ¿É¼ÇÀº ¸Þ´º, ½ºÅ©·Ñ¹Ù,
" Åø¹Ù, ½ºÅ©·Ñ¹ÙÀÇ À§Ä¡ ±âÅ¸ µîµî gvim »ç¿ë½Ã º¸¿© Áö´Â °Íµé¿¡ ´ëÇÑ ¿É¼ÇÀ»
" ¼³Á¤ÇÏ´Â °ÍÀÌ´Ù. ¾Æ·¡ÀÇ ¼³Á¤Àº ¾Æ¹«°Íµµ ¾øÀÌ »ç¿ëÇÏ´Â °ÍÀÌ´Ù.
" =============================================================================
if has("win32")
	"set guifont=³ª´®°íµñÄÚµù:h12:cHANGEUL
	"set guifont=Consolas:h12:cHANGEUL
	"set guifont=DejaVu\ Sans\ Mono:h12  "font setting
	set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
	let Powerline_symbols = 'fancy'
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
" clipboard ¼³Á¤
" =============================================================================
set clipboard=unnamed

" =============================================================================
" horizontal scroll bar ¼³Á¤
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
"let g:unite_prompt='¡í '
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

