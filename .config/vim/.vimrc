call plug#begin('~/.vim/plugged')

Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()

" color scheme
" codedark: https://github.com/tomasiser/vim-code-dark#installation
let g:codedark_term256=1
colorscheme codedark

" syntax highlight
filetype plugin on
syntax on

" airline delay
set ttimeoutlen=50

" line numbering
set number

" trailing spaces/tabs
set list
set listchars=tab:→\ ,trail:·,extends:»,precedes:«,nbsp:¤

" show a visual line under the cursor's current line
set cursorline

" enable folding
set foldmethod=indent
set foldlevel=99

" set tabs to have 4 spaces
set tabstop=4
set softtabstop=4
" expand tabs into spaces
set expandtab
" indent when moving to the next line while writing code
set autoindent
" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" mouse support
set ttymouse=sgr
set mouse=a

set wildmenu    " visual autocomplete for command menu
set lazyredraw  " redraw only when we need to.
set incsearch   " search as characters are entered
set hlsearch    " highlight matches

" enable all Python syntax highlighting features
let python_highlight_all = 1
highlight link pythonSpaceError NONE

" Toggle spell checking on and off with `,s`
nmap <silent> <leader>s :set spell!<CR>

" rofi configuration syntax highlight
au BufNewFile,BufRead /*.rasi setf css


" Airline
" https://github.com/vim-airline/vim-airline
" https://github.com/vim-airline/vim-airline-themes

let g:airline#enable_at_startup = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='codedark'

if !exists('g:airline_symbols')
     let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = ''
let g:airline_right_sep = '«'
let g:airline_right_sep = ''
let g:airline_symbols.crypt = ''
let g:airline_symbols.linenr = '☰ '
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = 'B'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.readonly = '&'
let g:airline_symbols.dirty='⚡'


" indent line
" https://github.com/Yggdroot/indentLine
let g:indentLine_enabled = 1
let g:indentLine_char = '┆'


" NERDTree
" https://jdhao.github.io/2018/09/10/nerdtree_usage/
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" side menu toggle
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
