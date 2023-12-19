let mapleader = "\<Space>"
"Plugins

call plug#begin()
Plug 'https://github.com/preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'unblevable/quick-scope'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'
Plug 'liuchengxu/vim-which-key'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'vim-scripts/AutoComplPop'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install --frozen-lockfile --production' }
Plug 'preservim/nerdcommenter'
Plug 'junegunn/goyo.vim'
Plug 'voldikss/vim-floaterm'
Plug 'mhinz/vim-startify'
call plug#end()



"LSP Settings
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=no 
    nmap <buffer> gi <plug>(lsp-definition)
    nmap <buffer> gd <plug>(lsp-declaration)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gl <plug>(lsp-document-diagnostics)
    nmap <buffer> <f2> <plug>(lsp-rename)
    nmap <buffer> <f3> <plug>(lsp-hover)
endfunction
augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END



"Autocomplete Setup
set complete+=kspell
set completeopt=menuone,longest 
set shortmess+=c
    " Navigate the complete menu items like CTRL+n / CTRL+p would.
inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"

    " Select the complete menu item like CTRL+y would.
inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"

    " Cancel the complete menu item like CTRL+e would.
inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>"




"RainbowParentheses Setup 
augroup rainbow_lisp
  autocmd!
  autocmd FileType *  RainbowParentheses
augroup END
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'],['{', '}']]



"Which-Key setup 
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=500
" Set Which-Key background color
highlight Pmenu ctermfg=16 ctermbg=235 guifg=#ffffff guibg=#0E141B

"Startify Settings
let g:startify_custom_header =
             \ startify#pad(readfile('.vim/asciiart'))

"Setting Quick-Scope highlighting  
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#ffa75f' gui=underline ctermfg=81 cterm=underline


"NERDTree command shortcut
map <leader>n :NERDTreeToggle<CR>
map <leader>h :NERDTreeFocus<CR>

"Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" setting relative numbering 
set relativenumber 

" Turn syntax highlighting on.
syntax on

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

"Bracket Autocomplete
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha


"Bracket Highlighting
hi MatchParen cterm=bold ctermbg=none  ctermfg=red

"Highlighting Settings
let g:lsp_diagnostics_enabled = 0         " disable diagnostics support
highlight lspReference ctermfg=yellow guifg=yellow ctermbg=Grey guibg=#a0a3a1

"Prettier Settings
nmap <Leader>py <Plug>(Prettier)
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#autoformat_config_present = 0
let g:prettier#config#print_width = 'auto'
let g:prettier#config#tab_width = 'auto'
let g:prettier#config#use_tabs = 'auto'
let g:prettier#config#parser = ''
let g:prettier#config#config_precedence = 'file-override'
let g:prettier#config#prose_wrap = 'preserve'
let g:prettier#config#html_whitespace_sensitivity = 'css'
let g:prettier#config#require_pragma = 'false'
let g:prettier#config#end_of_line = get(g:, 'prettier#config#end_of_line', 'lf')


""Key Bindings""
map <leader>n :NERDTreeToggle<CR>


"Which-Key KeyBindings 

let g:which_key_map =  {}
let g:which_key_sep = '-> '
set timeoutlen=100
let g:which_key_use_floating_win = 1

let g:which_key_map['w'] = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : [':resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : [':resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
      \ '?' : ['Windows'    , 'fzf-window']            ,
      \ }

let g:which_key_map['z'] = [':Goyo 80%x80%','ZenMode']
let g:which_key_map['f'] = [':Files',"Search Files"]
call which_key#register('<Space>', "g:which_key_map")
