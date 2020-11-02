" Plugins 
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'

Plug 'scrooloose/nerdtree'

Plug 'ntpeters/vim-better-whitespace'

Plug 'phanviet/vim-monokai-pro'

call plug#end()

" Scroll down faster
set ttyfast

" Highlight search results
set hlsearch

" Make splits happen in the bottom
set splitbelow

" Match parenthesis and brackets
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Always show status line
set laststatus=2

" Convert tabs to spaces
set expandtab

" For each tab use 2 spaces
set shiftwidth=2

" Tabline settings
set switchbuf=useopen,usetab,newtab
set stal=2

" Add numbers to the left
set number

" Highlight selected line
set cursorline

" Set relative number
set relativenumber

" Set colors
set termguicolors
colorscheme monokai_pro

filetype plugin on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""NerdTree
" Start NERDtree if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Remove ugly stuff
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1
let NERDTreeHighlightCursorline=0

" Map ctrl n to Open Nerdtree
map <C-n> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#syntastic#enabled = 0
let g:airline_detect_iminsert=1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1 "tab number
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#tagbar#enabled = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Terminal
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

" Toggle terminal on/off (neovim)
map <space>' :call TermToggle(12)<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>
