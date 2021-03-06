set nocp
filetype off

filetype plugin indent on

if has("syntax")
    syntax enable
    set background=dark
    set t_Co=16
	" colorscheme solarized
endif

if has("mouse")
    set mouse=a
endif

" Search incrementally and highlight results, ignore case unless I use an
" uppercase letter.
set incsearch
set hlsearch
set ignorecase
set smartcase
" Not just a search thing. When motioning always show some context to the line
" you jump to
set scrolloff=5

set number

" Some alternatives here:
" http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
" http://stackoverflow.com/questions/2447109/showing-a-different-background-colour-in-vim
" ColorColumn lets you highlight the background
" Match lets you highlight just the chars which are over a given length
let &colorcolumn=join(range(91,200),",")
highlight ColorColumn ctermbg=Black
set textwidth=90

setlocal spell spelllang=en_us
set nospell

set laststatus=2

set ttimeoutlen=50

inoremap jk <esc>

" :noh is a lot of typing!
nnoremap <CR> :noh<CR><CR>

" Easier navigation between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Folding
set foldmethod=marker
set cursorline
" autocmd FileType python set foldmethod=syntax
" let python_highlight_all = 1

let g:netrw_list_hide = '.*\.pyc$'
" let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,.*\.pyc$'


" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Then start vim again and call :PluginInstall
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/vundle'
" cd ~/.vim/bundle/vimproc.vim/ && make
Bundle 'Shougo/vimproc.vim'
Bundle 'rking/ag.vim'
Bundle 'Shougo/neomru.vim'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/unite-outline'
Bundle 'tsukkee/unite-tag'

" For git support
Bundle 'tpope/vim-fugitive'

" A fancier statusline
Bundle 'bling/vim-airline' 

Bundle 'wakatime/vim-wakatime'

call vundle#end()

nmap <space> [unite]
" Pro-tip, from the Unite window hit <C-l> to refresh the cache
" Unite-f for files, Unite-r for recents, Unite-g for grep
nnoremap [unite]f :Unite -no-split -start-insert file_rec/async:!<CR>
nnoremap [unite]r :Unite -no-split buffer file_mru<CR>
nnoremap [unite]g :Unite -no-split grep:.<CR>
nnoremap [unite]o :Unite -no-split outline<CR>
nnoremap [unite]t :Unite -no-split -start-insert tag<CR>
nnoremap [unite]<space> :UniteResume<CR>

let g:unite_source_rec_async_command = 'ag --nocolor --nogroup --hidden -S -g ""'
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--line-numbers --nocolor --nogroup --hidden'
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
" call unite#set_profile('source/file_rec/async', 'ignorecase', 1)
" call unite#set_profile('source/file_rec/async', 'smartcase', 1)

" Exit with ESC. You must never call :quit from within a unite buffer
function! s:unite_settings()
    imap <buffer> <ESC> <Plug>(unite_exit)
    imap <buffer> <C-j> <Plug>(unite_insert_leave)
    nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction
autocmd FileType unite call s:unite_settings()

autocmd FileType c set noexpandtab
autocmd FileType c set tabstop=4
autocmd FileType c set shiftwidth=4

" Recursively searches for tags. First locally and then in the parent dir
set tags=./tags;,tags
" TOOD: Look into 'craigemery/vim-autotag' to auto-update the tag file
" You'll have to play with it to make it work with your multi-project setup

autocmd FileType python set tabstop=4
autocmd FileType python set shiftwidth=4
autocmd FileType python set autoindent
autocmd FileType python set expandtab
autocmd FileType python set softtabstop=4

autocmd FileType gitcommit setlocal spell
autocmd FileType gitcommit setlocal textwidth=72
