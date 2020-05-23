syntax on

set encoding=utf-8
set rnu
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set guifont=Fira\ Mono\ Medium:h10
"set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
set cursorline

call plug#begin('~/.config/nvim/plugged')
    " Autocomplete
    " Plug 'ycm-core/YouCompleteMe'
    Plug 'neoclide/coc.nvim'
    " Plug 'lyuts/vim-rtags'


    " Navigation
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'jremmen/vim-ripgrep'
    Plug 'preservim/nerdtree'
    
    " Vue
    Plug 'posva/vim-vue'
    
    " Themes
    Plug 'powerline/fonts'
    Plug 'morhetz/gruvbox'
    Plug 'tomasiser/vim-code-dark'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
call plug#end()

"colorscheme gruvbox
set background=dark

colorscheme codedark
let g:airline_theme='codedark'
let g:airline_powerline_fonts = 1
if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

" This fixed the Ugly highlightin when jumping on VIM
" but does NOT seem to work for neovim.
if &term =~ '256color'
    set t_ut=
endif

" Move highlighted lines UP or DOWN
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv


function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

fun! GoCoc()
    inoremap <buffer> <silent><expr> <TAB>
                        \ pumvisible() ? "\<C-n>" :
                        \ <SID>check_back_space() ? "\<TAB>" :
                        \ coc#refresh()

    inoremap <buffer> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    inoremap <buffer> <silent><expr> <C-space> coc#refresh()

    " GoTo code navigation.
    nmap<buffer> <silent> gd <Plug>(coc-definition)
    nmap<buffer> <silent> gy <Plug>(coc-type-definition)
    nmap<buffer> <silent> gi <Plug>(coc-implementation)
    nmap<buffer> <silent> gr <Plug>(coc-references)
endfun

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
