set nocp

if has("syntax")
    syntax enable
    set background=dark
    set t_Co=16
    colorscheme solarized
endif

if has("mouse")
    set mouse=a
endif

set incsearch
set hlsearch
set number

set colorcolumn=80

set tabstop=4
set shiftwidth=4
set autoindent
set expandtab
set softtabstop=4

setlocal spell spelllang=en_us
set nospell

set laststatus=2

" :noh is a lot of typing!
nnoremap <CR> :noh<CR><CR>

" Easier navigation between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
