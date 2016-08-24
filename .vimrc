" Kmaschta .vimrc
" http://dougblack.io/words/a-good-vimrc.html

colorscheme badwolf
syntax enable

" Space & tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" UI Config
set number
set showcmd
set cursorline
set wildmenu
set lazyredraw
set showmatch

" Search
set incsearch
set hlsearch

" Folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
set foldmethod=indent

" Movement
nnoremap j gj
nnoremap k gk
" nnoremap B ^
" nnoremap E $
" nnoremap ^ <nop>
" nnoremap $ <nop>
nnoremap gV `[v`]

" Leader Shortcuts
let mapleader=","
" nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>s :mksession!<CR>

" Autogroups
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    " autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
    "             \:call <SID>StripTrailingWhitespaces()
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal comments=s1:/*,mb:*,ex:*/,://,:#
    autocmd FileType php setlocal formatoptions+=cro
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd FileType python setlocal tabstop=4
    autocmd FileType python setlocal softtabstop=4
    autocmd FileType python setlocal shiftwidth=4
    autocmd FileType python setlocal expandtab
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

autocmd FileType html setlocal ai
autocmd FileType html setlocal tabstop=4
autocmd FileType html setlocal softtabstop=4
autocmd FileType html setlocal shiftwidth=4
autocmd FileType html setlocal noexpandtab
autocmd BufEnter *.html setlocal ai
autocmd BufEnter *.html setlocal tabstop=4
autocmd BufEnter *.html setlocal softtabstop=4
autocmd BufEnter *.html setlocal shiftwidth=4
autocmd BufEnter *.html setlocal noexpandtab

" Backup
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup


" Vundle
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'elzr/vim-json'

call vundle#end()
filetype plugin indent on
