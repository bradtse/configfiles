"
" Author: Bradley Tse
" Email: bradleytse@gmail.com
"
" Questions? Contact me
"


""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""

" Needed for Vundle
" This turns off filetype detection
filetype off

" Determine whether or not the vundle plugin exists
if filereadable(expand('~/.vim/bundle/vundle/README.md'))
    let g:hasVundle = 1
endif

if exists('hasVundle')

" Add the vundle path to the runtime path
set rtp+=~/.vim/bundle/vundle

call vundle#rc()

" vundle handle vundle
Bundle 'gmarik/vundle'

" Bundles from GitHub repos

" File explorer
Bundle 'scrooloose/nerdtree'
" Syntax checker
Bundle 'scrooloose/syntastic'
" Comment magic
Bundle 'scrooloose/nerdcommenter'
" File/Buffer/MRU explorer
Bundle 'kien/ctrlp.vim'
" Buffer explorer
Bundle 'corntrace/bufexplorer'
" Mini buffer explorer
Bundle 'fholgado/minibufexpl.vim'
" Buffer tabs
"Bundle 'vim-scripts/TabBar'
" Tab complete
"Bundle 'Valloric/YouCompleteMe'
" HTML tag matching
Bundle 'Valloric/MatchTagAlways'
" Sexy status line
" Bundle 'Lokaltog/vim-powerline'
" Git plugin
Bundle 'tpope/vim-fugitive'
" Solarized color scheme
Bundle 'altercation/vim-colors-solarized'
" Ack inside of vim
Bundle 'mileszs/ack.vim'
" Kolor color scheme
Bundle 'zeis/vim-kolor'
" Molokai color scheme
Bundle 'tomasr/molokai'
" Vim Python auto-complete
Bundle 'davidhalter/jedi-vim'

" Change look of powerline
" let g:Powerline_symbols='unicode'

" Change look of MatchTagAlways
let g:mta_use_matchparen_group = 0
let g:mta_set_default_matchtag_color = 0
highlight MatchTag ctermfg=black ctermbg=lightgreen

" Set syntastic file types
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['javascript', 'c', 'python'],
                           \ 'passive_filetypes': ['html', 'css'] }

endif

filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""
" General settings
""""""""""""""""""""""""""""""""""""""""""""

set nocompatible " Disable vi-compatibility
set encoding=utf-8 " Set the encoding
set backspace=indent,eol,start " Allows you to backspace past start of insert
set expandtab " Tabs are spaces
set shiftwidth=4 " Number of columns using reindent operations
set autoindent " Auto indent
set tabstop=4 " Number of columns a tab equals
set softtabstop=4 " Control how many columns vim uses with tabs
set scrolloff=4 " Number of spaces past cursor
set hidden " Allows to leave buffer without saving
set ignorecase " Ignore case on searches
set smartcase " Ignore case unless an upper case is used
set incsearch " Dynamically search
set gdefault " Sub all occurences in line, no need for g command
set history=1000 " Set history size
set undolevels=1000 " Set undo size
set nobackup " Do not make backup file
" set backupdir=~/.vim/backup Set up backup directory
set directory=~/.vim/tmp " set temp directory
set showcmd " Show command
set mouse=a " Mouse integration
" Tab completion settings
set wildmenu
set wildmode=longest,list,full
set autochdir " Changes current dir to one of open buffer
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+' " Start Explore with hiding on
set switchbuf=useopen,usetab " Switch to tab when switching buffers

""""""""""""""""""""""""""""""""""""""""""""
" Visual settings
""""""""""""""""""""""""""""""""""""""""""""

syntax enable
"set t_Co=256 " Let vim know 256 colors is supported
"set background=dark
"let g:solarized_termtrans=1
"let g:solarized_visibility="high"
if exists('hasVundle')
    colorscheme kolor
endif
set cursorline " Highlights line the cursor is on
set novisualbell  " No visual bell
set title " Set the title
set nu " Show line numbers
set hlsearch " Hightlights the search results
"set wrap " Wraps the text to a new line
set nolist " Do not show invisible characters
set listchars=tab:▶\ ,eol:⤦,trail:☠ " Fancy list chars. set list must be on
"set textwidth=80 " Enforce 80 char long lines
"set colorcolumn=+1 " Shows 80 char column
" Highlight anything over 80 chars long
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

" Status Line at bottom !! These are being ignored by powerline {
    set laststatus=2 " Always show status bar
    set statusline=
    set statusline+=%-10.3n\    " buffer number
    set statusline+=%f\      " file name
    set statusline+=%h%m%r%w " status flags
    set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
    set statusline+=%= " right align remainder
    set statusline+=%-7b\   " char value
    set statusline+=%-14(%l,%c%V%) " line, char
    set statusline+=%<%P " file position
" }

" Highlights those nasty trailing whitespaces. This is fantastic.
highlight ExtraWhiteSpace ctermbg=red
match ExtraWhiteSpace /\s\+$/
autocmd BufWinEnter * match ExtraWhiteSpace /\s\+$/
autocmd InsertEnter * match ExtraWhiteSpace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhiteSpace /\s\+$/
autocmd BufWinLeave * call clearmatches()


""""""""""""""""""""""""""""""""""""""""""""
" Key rebindings
""""""""""""""""""""""""""""""""""""""""""""

let mapleader = " " " Sets leader to space key
" Change viewport scroll size
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
" Save and open session hotkeys
nnoremap <F4> :mksession! ~/.vim/vim_sessions/currsession <cr>
nnoremap <F5> :so ~/.vim/vim_sessions/currsession <cr>
" Rebinds ; to :
" nnoremap ; :
" nnoremap : ;
" Exit insert mode with jj
inoremap jj <Esc>
cmap jj <Esc>
" Paste to line below
nnoremap <Leader>p :pu<CR>
" Buffer navigation
nnoremap <C-j> :bprev<CR>
nnoremap <C-k> :bnext<CR>
nnoremap <C-l> :b#<CR>
" Turns highlighting off until next search
nnoremap <CR> :noh<CR>
" Adds a space below current line
nnoremap <Leader>s o<Esc>
" Toggle's Vim's paste mode. Good for pasting stuff from other applications.
set pastetoggle=<F7>
" Fast saving
nnoremap <leader>w :w!<CR>
" Fast quit
nnoremap <leader>q :qa<CR>
" Allows us to save file we don't have permission to. Useful when the file is
" already open without proper permissions.
cnoremap w!! w !sudo tee % >/dev/null
" If a file wraps lines, this makes j and k behave how we think they should
nnoremap j gj
nnoremap k gk
" Map BufExplorer
nnoremap <leader>o :BufExplorer<CR>

if exists('hasVundle')

" Bind ,e to NERDTree explore
nnoremap <Leader>e :NERDTreeToggle<CR>
" Remap comment toggling. Not sure on this binding.
noremap qq :call NERDComment(2, 'toggle')<CR>

endif

""""""""""""""""""""""""""""""""""""""""""""
" Deprecated
""""""""""""""""""""""""""""""""""""""""""""

" Debug functions
" function! MarkDebug()
"     let cline = line(".")
"     let ctext = getline(cline)
"     call setline(cline, ctext . " //_DEBUGGY_")
" endfunction
" function! RemoveDebug()
"     %g/\/\/_DEBUGGY_/d
" endfunction
" inoremap <F6> <Esc>:call MarkDebug()<CR><Ins>
" noremap <F6> <Esc>:call MarkDebug()<CR>
" inoremap <F7> <Esc>:call RemoveDebug()<CR><Ins>
" noremap <F7> <Esc>:call RemoveDebug()<CR>
