" disable compatibility with vi
set nocompatible

set shell=zsh\ -i

" set encoding
set encoding=utf-8

" enable line number
set number

" load an indent file for the detected file type
filetype indent on

" enable syntaxt highlighting
syntax on

" set shift width
set shiftwidth=2

" set tab width
set tabstop=2

" use space for indent
set expandtab

" disable line warp
set nowrap

" highlight matching characters
set incsearch
set showmatch
set hlsearch

" disable highlight after press ESC
nnoremap <CR> :nohlsearch<CR><CR>

" enable auto completion menu (press TAB)
set wildmenu

" make wildmenu behave like similar to Bash completion
set wildmode=list:longest

" disable sound effect
set noerrorbells
set visualbell

" copy indent from current line when starting a new line
set autoindent

" even better autoindent (e.g. add indent after '{')
set smartindent

" autoreload the file in Vim if it has been changed outside of Vim
set autoread

" Enable scroll and selection with mouse
set mouse=a

" status line
set laststatus=2
set statusline=\ %F
set statusline+=%=
set statusline+=\ %M\ %Y\ 

" disable backup (It's very simple, always save!)
set nobackup
set nowritebackup
set noswapfile

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set t_Co=256

" Set paste mode key.
set pastetoggle=<C-p>

" line warp for markdown
augroup Markdown
  autocmd!
  autocmd FileType markdown set wrap
augroup END

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" enable plugins and load plugin for the detected file type
filetype plugin on

" lightline.vim
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename' ] ],
      \   'right': [ [ 'percent' ],
      \              [ 'filetype' ] ]
      \ },
      \ 'component_function': {
        \   'filename': 'LightlineFilename',
      \ },
      \ }

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

" Theme

" dracula theme
" packadd! dracula
" colorscheme dracula

" oceanic-next theme
" if (has("termguicolors"))
"   set termguicolors
" endif
" colorscheme OceanicNext

packadd! dracula
colorscheme everforest
set background=dark
