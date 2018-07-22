set nocompatible
filetype plugin on
syntax enable
call plug#begin()

""" Plugs
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'jlanzarotta/bufexplorer'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
Plug 'liuchengxu/space-vim-dark'
" Plug 'colepeters/spacemacs-theme.vim'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }


""""""""""""""""""""
""" Language Plugins
""""""""""""""""""""
" Go
Plug 'fatih/vim-go'

" Typescript
Plug 'leafgarland/typescript-vim'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'


" Vundle end
call plug#end()

""" Misc
set noshowmode
set number
set expandtab
set tabstop=2
set shiftwidth=2
set hlsearch
set autoindent
set autoread
set incsearch
set ignorecase
set showcmd
" nnoremap <SPACE> <Nop>
map <SPACE> \
nnoremap J 6j
nnoremap K 6k

" Deoplete
let g:deoplete#enable_at_startup = 1

" Statusline
let g:airline_theme='violet'

" bufexplorer
nnoremap <Leader>ls :BufExplorer<CR>
" nnoremap <leader>g :grep <c-r>=expand("<cword>")<cr><cr>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>r :b#<CR>

nnoremap <Leader> h :call LanguageClient#textDocument_hover()<CR>
nnoremap <Leader> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <Leader><tab> :call LanguageClient_contextMenu()<CR>
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" netrw
" let g:netrw_banner = 3
map <C-n> :Explore<CR>


" Theme
if (has("termguicolors"))
  set termguicolors
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
endif
" set background=dark
colorscheme space-vim-dark

" git gutter
set updatetime=25

" fzf
set rtp+=/usr/local/opt/fzf
nnoremap <c-p> :FZF<cr>

" commentary
noremap <leader>/ :Commentary<cr>

" Set undodir
set undofile
set undodir=~/.vim/undodir

" grep to ag
set grepprg='ag'

" set mouse=a

" LSP
" Automatically start language servers.
let g:LanguageClient_autoStart = 1
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'typescript.tsx': ['javascript-typescript-stdio'],
    \ 'go': ['go-langserver'],
    \ 'python': ['pyls'],
    \ }
nnoremap <F5> :call LanguageClient_contextMenu()<CR>


" ALE
let g:ale_sign_column_always = 1

