" Plugins personales ------------------------------
call plug#begin('$HOME/.vim/vim-plug')

" Para redactar con comodidad
Plug 'junegunn/goyo.vim' " Pantalla sin distracciones 
Plug 'https://github.com/dhruvasagar/vim-table-mode.git', { 'for' : ['markdown', 'tex'] }
Plug 'https://github.com/junegunn/limelight.vim.git', { 'for' : ['markdown', 'tex'] } " Resalta solo el bloque de texto donde se está trabajando
Plug 'https://github.com/mbajobue/scim-latex-tables.git', { 'for' : 'tex' }

" Configuración básica
Plug 'https://github.com/preservim/nerdtree.git' " Arbol de trabajo
Plug 'https://github.com/richtan/pywal.vim.git' " Colores 
Plug 'dylanaraps/wal.vim' " Colores
Plug 'https://github.com/itchyny/lightline.vim.git' " Barra de estado

" Básica, aunque no esencial
Plug 'https://github.com/tibabit/vim-templates.git' " Extensión para plantillas
Plug 'https://github.com/vimwiki/vimwiki.git' " Manejador de contenidos

" Especiales para la universidad
Plug 'https://github.com/mattn/calendar-vim.git' " Calendario para trabajar en conjunto con VimWiki y hacer un diario

" Sintaxis e iconos
Plug 'https://github.com/vim-latex/vim-latex.git', { 'for' : 'tex' }
"Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc', { 'for': 'markdown' }
"Plug 'https://github.com/plasticboy/vim-markdown.git'
"Plug 'https://github.com/tpope/vim-markdown.git'
"Plug 'https://github.com/gabrielelana/vim-markdown.git'
"Plug 'https://github.com/mzlogin/vim-markdown-toc.git', { 'for': 'markdown' } " Generador de tabla de contenidos. No es necesaria si se usa LaTex
"Plug 'https://github.com/lervag/vimtex.git'

" Aplicaciones extra
"Plug 'https://github.com/ledger/vim-ledger.git'
"Plug 'https://github.com/jarsp/cornell.vim.git'
Plug 'https://github.com/mhinz/vim-startify.git'
call plug#end()

" Configuraciones personales ----------------------
set nocompatible
filetype plugin on
set wildmenu
syntax on
colorscheme wal
set path+=**
set encoding=utf-8
let g:go_version_warning = 0
nnoremap u <nop>
set mouse=a
set number

" Auto-corrector en español ------------------------
function! Autocorrector()
	if 1
		set spell
		set spell spelllang=es
		setlocal spell spelllang=es
		set spellfile="$HOME/.vim/dict.utf-8.spl"
	endif
endfunction

nnoremap ,ac :call Autocorrector()<cr>
nnoremap ,aac :set nospell<cr>

set hlsearch

" Vimwiki -----------------------------------------
"let wiki_1.syntax = 'markdown'
let g:vimwiki_list = [{'path':'~/documents/documentación', 'path_html':'~/documents/documentación/export'}]

" Atajos del teclado ------------------------------
vmap <C-c> "+y
"nmap <C-v> "+p

nnoremap ,goyo :Goyo 80x40<cr>
inoremap <C-z> <Esc>:u<cr>
nnoremap <C-z> <Esc>:u<cr>
inoremap <C-a> <Esc>ggVG<cr>
nnoremap <C-a> <Esc>ggVG<cr>
nnoremap <C-x> :wq!<cr>
inoremap <C-g> <Esc>:w<cr>
nnoremap <C-g> :w<cr>
nnoremap <C-w> :q!<cr>
nnoremap <C-t> :tabnew<cr>
nnoremap <buffer> <C-p> :!zathura %:r.pdf &<cr><Enter>
nnoremap <A-h> :tabp<cr>
nnoremap <A-l> :tabn<cr>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright
map <C-f> :VWS /\/<Left>

autocmd FileType python nnoremap <buffer> <F5> :!python %<cr>

autocmd FileType nroff nnoremap <buffer> <F5> :!groff -k -Tps -me % > %:r.ps && ps2pdf %:r.ps %:r.pdf<cr><Enter>
autocmd FileType nroff nnoremap <buffer> <F6> :!groff -k -Tps -ms % > %:r.ps && ps2pdf %:r.ps %:r.pdf<cr><Enter>
"autocmd FileType nroff nnoremap <buffer> <F7> :!refer -S -e -p bib % \| groff -ms -k -Tps pdf > %:r.pdf<cr><Enter>
autocmd FileType nroff nnoremap <buffer> <F7> :!refer -p bib % \| groff -ms -k -T pdf > %:r.pdf<cr><Enter>

autocmd FileType markdown nnoremap <buffer> <F5> :!pandoc % -o %:r.pdf<cr><Enter>
autocmd FileType markdown nnoremap <buffer> <F6> :!pandoc --bibliography=bib.bib --filter pandoc-citeproc % -o %:r.pdf<cr><Enter>
autocmd FileType markdown nnoremap <buffer> <F7> :!pandoc % -o %:r.pdf<cr><Enter>

autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
autocmd BufRead,BufNewFile *.wiki nnoremap <buffer> <F5> :Vimwiki2HTML<cr><Enter>
autocmd BufRead,BufNewFile *.wiki nnoremap <buffer> <F5> :VimwikiAll2HTML<cr><Enter>

autocmd BufRead,BufNewFile notas set filetype=markdown
autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=vimwiki
autocmd BufRead,BufNewFile ~/.calcurse/notes/* set filetype=vimwiki

autocmd BufRead,BufNewFile rtv* :normal Go

"map <C-l> i" ----------------------------------------------<Esc>F#<Space>

" Numerado de lineas ------------------------------

" Turn hybrid line numbers on
":set number relativenumber
":set nu rnu

" Turn hybrid line numbers off
":set nonumber norelativenumber
":set nonu nornu
"
" Toggle hybrid line numbers
":set number! relativenumber!
":set nu! rnu!

" Archivo de intercambio | Respaldo ---------------

set nobackup 
set nowritebackup
set noswapfile  

" Mutt --------------------------------------------

au BufRead /tmp/mutt-* set tw=72
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Netrw -------------------------------------------

let g:netrw_banner=0
let g:netrw_browser_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3

" Mover lineas ------------------------------------

nnoremap <A-j> :m+<CR>
nnoremap <A-k> :m-2<CR>

" Detectar Alt

"let c='a'
"while c <= 'z'
"  exec "set <A-".c.">=\e".c
"  exec "imap \e".c." <A-".c.">"
"  let c = nr2char(1+char2nr(c))
"endw

set timeout ttimeoutlen=50

" Plantillas ---------------------------------------
let g:tmpl_search_paths = ['~/templates']
nnoremap ,md :TemplateInit uabc.md<CR>
nnoremap ,apa7 :TemplateInit apa7<CR>
nnoremap ,b :TemplateInit libro<CR>
nnoremap ,t :TemplateInit<Space> 
autocmd FileType nroff nnoremap ,g :TemplateInit groff.refer<CR>
nnoremap ,cita i\maskparencite{}<Left>

" Barra de estado ----------------------------------
set laststatus=2

if !has('gui_running')
	  set t_Co=256
  endif

let g:lightline = {
  \	'colorscheme':	'wal',
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }

" XDG Respect --------------------------------------
"set directory=$XDG_CONFIG_HOME/vim,~/,/tmp
"set backupdir=$XDG_CACHE_HOME/vim,~/,/tmp
"set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
"set runtimepath=$XDG_CONFIG_HOME/vim,$XDG_CONFIG_HOME/vim/after,$VIM,$VIMRUNTIME
"set runtimepath=$XDG_CONFIG_HOME/vim
let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"

" XDG Respect --------------------------------------

" vim-LaTeX ----------------------------------------
autocmd FileType tex imap <buffer> imap <C-I> <Plug>Tex_InsertItemOnThisLine<CR>
autocmd FileType tex imap <buffer> imap <C-C> <Plug>Tex_MathCal<CR>

"<Plug>Tex_MathBF	<Alt-B>
"<Plug>Tex_LeftRight	<Alt-L>

au BufNewFile,BufRead *.tex
    \ set nocursorline |
    \ set nornu |
    \ set number |
    \ let g:loaded_matchparen=1 |

autocmd FileType tex nnoremap <buffer> <F6> :!pdflatex %:r && bibtex %:r && pdflatex %:r<cr><Enter>
autocmd FileType tex nnoremap <buffer> <F5> :!pdflatex %:r && biber %:r && pdflatex %:r<cr><Enter>

command! -nargs=* Wrap set wrap linebreak nolist

" vim-LaTeX -----------------------------------------

" LimeLight -----------------------------------------
nnoremap ,ll :Limelight!! <CR>
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_default_coefficient = 0.5


" startify ------------------------------------------
let g:startify_fortune_use_unicode = 0
