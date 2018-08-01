set nocompatible
filetype plugin on
syntax enable
call plug#begin()

""" Plugs
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat'
Plug 'jlanzarotta/bufexplorer'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
Plug 'liuchengxu/space-vim-dark'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }


"""""""""""""
""" Languages
"""""""""""""
" Go
Plug 'fatih/vim-go'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Typescript
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

call plug#end()


" Language settings


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
set relativenumber
nnoremap <SPACE> <Nop>
map <SPACE> \

" Airline
let g:airline_theme='violet'
let g:airline#extensions#tabline#enabled = 1

" bufexplorer
let g:bufExplorerDefaultHelp=0
let g:bufExplorerSplitBelow=1
" nnoremap <leader>g :grep <c-r>=expand("<cword>")<cr><cr>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
" nnoremap <Leader> :BufExplorerHorizontalSplit<CR>
nnoremap <Leader>r :b#<CR>
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

" gitgutter
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


" LSP
" Automatically start language servers.
let g:LanguageClient_autoStart = 1
" Required for operations modifying multiple buffers like rename.
set hidden
nnoremap <Leader> h :call LanguageClient#textDocument_hover()<CR>
nnoremap <Leader> df :call LanguageClient#textDocument_definition()<CR>
nnoremap <Leader><tab> :call LanguageClient_contextMenu()<CR>

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'typescript.jsx': ['javascript-typescript-stdio'],
    \ 'go': ['go-langserver'],
    \ 'python': ['pyls'],
    \ }


" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
call deoplete#custom#option('sources', {
    \ 'javascript': ['LanguageClient'],
    \ 'javascript.jsx': ['LanguageClient'],
    \ 'typescript': ['LanguageClient'],
    \ 'typescript.tsx': ['LanguageClient'],
    \ 'go': ['LanguageClient'],
    \ 'python': ['LanguageClient'],
\})

"""""""""""""""
""" Linting """
"""""""""""""""
" ALE
let g:ale_sign_column_always = 1


" Vim Prettier
" let g:prettier#config = 'typescript'
" let g:prettier#config#single_quote = 'true'
" let g:prettier#config#bracket_spacing = 'true'
" let g:prettier#config#semi = 'true'
" let g:prettier#config#print_width = 80
" let g:prettier#config#semi = 'true'
" let g:prettier#config#trailing_comma = 'all'
" let g:prettier#config#jsx_bracket_same_line = 'false'
" let g:prettier#quickfix_enabled = 0
