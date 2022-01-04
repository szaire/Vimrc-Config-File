let extensao = expand('%:e')

call plug#begin('~/.vim/plugged')

Plug 'terroo/vim-simple-emoji'
Plug 'morhetz/gruvbox'
if( extensao == "cpp" || extensao == "cc" || extensao == "h" || extensao == "hpp" )
Plug 'ycm-core/YouCompleteMe'
endif 
Plug 'ycm-core/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'

call plug#end()

" Colorscheme
set termguicolors 
set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" Global variables
set nu!
set mouse=a
set title
set cursorline
set encoding=utf-8 "for YCM usage
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set wildmenu
set confirm
set hidden
set backspace=indent,eol,start
set nowrap " allow the lines to pass through the screen
set autochdir " set directory to the current window
set scrolloff=6
" Backup directory
set backupdir=./.backup,.,/tmp
set directory=.,./.backup,/tmp
" Highlighting
filetype plugin indent on
set hlsearch "Highlights search terms"
set incsearch "Highlights search terms as you type them"
set showmatch "Highlights matching parentheses"
set ignorecase "Ignores case when searching"
set smartcase "Unless you put some caps in your search term"
" Disable Highlighting (whenever your press the return key)
nnoremap <Return> :noh<CR> 

" You complete me config
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
set completeopt-=preview
let g:ycm_show_diagnostics_ui = 0
" ccls config
let g:ycm_language_server =
  \ [{
  \   'name': 'ccls',
  \   'cmdline': [ 'ccls' ],
  \   'filetypes': [ 'c', 'cpp', 'cc', 'h', 'hpp' ],
  \   'project_root_files': [ '.ccls-root', 'compile_commands.json' ]
  \ }]

" UtilSnipps config
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Airline config
let g:airline_symbols = {}
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' :'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = ' ☰ '
let g:airline_symbols.dirty='⚡'

" Shortcut Mapping ================================================
" Leader key
let mapleader = " " " map leader to Space

" Saving with cntrl+s
nnoremap <C-s> :w<CR>

" NERDTree
" Variable configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeWinSize=17

" Focus on NerdTree
nnoremap <F5> :NERDTreeFocus<CR>

" Toggle from editor to archives
nnoremap <F6> :NERDTreeToggle<CR>

" Find the file original directory
nnoremap <F7> :NERDTreeFind<CR> 

" Focus selected directory on screen
nnoremap <Leader><Leader> :NERDTreeCWD<CR>

" Navigating Splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Changing from Horizontal to Vertical or vice versa
map <Leader>h <C-w>t<C-w>H
map <Leader>v <C-w>t<C-w>K

" Opening Horizontal Terminal
map <Leader>tt :vert term<CR><C-w>r

" Toggle to main startify page 
nnoremap <F12> :Startify<CR>

" Navigate through tabs
nnoremap <C-n> :tabnew<CR>
nnoremap <C-PageUp> :tabn<CR> 
nnoremap <C-PageDown> :tabp<CR>

" Toggling to relative numbers
nnoremap <Leader>n :call ToggleRelativeNumbers()<CR>
function! ToggleRelativeNumbers()
    if &rnu
        setlocal nornu
    else
        setlocal rnu
    endif
endfunction

" Toggling to wrap text
nnoremap <Leader>w :call ToggleWrap()<CR>
function! ToggleWrap()
    if &wrap
        setlocal nowrap
    else
        setlocal wrap
    endif
endfunction 
