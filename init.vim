"curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

syntax on

set nocompatible
filetype off
"set guicursor=
set noshowmatch
set relativenumber
set nohlsearch
set hidden
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
"set termguicolors
" Give more space for displaying messages.
set cmdheight=2
set ignorecase
set cursorline
set splitbelow splitright
"set mouse=a

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" -----------------------------------------------------------------------------
" Status line
" -----------------------------------------------------------------------------

" Heavily inspired by: https://github.com/junegunn/dotfiles/blob/master/vimrc
function! s:statusline_expr()
  let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
  let ro  = "%{&readonly ? '[RO] ' : ''}"
  let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
  let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  let sep = ' %= '
  let pos = ' %-12(%l : %c%V%) '
  let pct = ' %P'

  return '[%n] %f %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
endfunction

let &statusline = s:statusline_expr()

" Set for Status-line
" set statusline=
" set statusline+=%#PmenuSel#
" set statusline+=\ %M
" set statusline+=\ %y
" set statusline+=\ %r
" set statusline+=\ %F
" set statusline+=%= "Right side setting"
" set statusline+=%#DiffChanged#
" set statusline+=\ %c:%l/%L
" set statusline+=\ %p%%
" set statusline+=\ [%n]


"set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-commentary' " comment with gcc & gc
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
"Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
Plug 'dense-analysis/ale'
"Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'


call plug#end()

let mapleader = "," " map leader to comma

" gruvbox
colorscheme gruvbox

" coc
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
"
"
""map <silent> <C-n> :NERDTreeFocus<CR>
"nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
"nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>
"

"FzF
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-g> :GFiles<CR>
nnoremap <silent> <C-o> :Buffers<CR>
nnoremap <C-f> :Rg!

"NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"ale
let g:ale_linters = {'python': ['flake8', 'pydocstyle', 'bandit', 'mypy']}
"let g:ale_fixers = {'*': [], 'python': ['black', 'isort']}
let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'python': ['black', 'isort'],
\}
let g:ale_fix_on_save = 1

"Spell check set to F6
map<F6> :setlocal spell! spelllang=en_us<CR>
" Spelling mistakes will also be colored red if you uncomment the colors.
hi SpellBad cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellLocal cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellRare cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellCap cterm=underline ctermfg=203 guifg=#ff5f5f


"hi Search cterm=NONE ctermfg=black ctermbg=lightblue


"Telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

"remap splits navigation to just Ctrl+ijkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"Adjust split window size
" noremap <silent> <C-Left> :vertical resize +3<CR>
" noremap <silent> <C-Right> :vertical resize -3<CR>
" noremap <silent> <C-Up> :resize +3<CR>
" noremap <silent> <C-Down> :resize -3<CR>
noremap <silent> w<Left> :vertical resize +3<CR>
noremap <silent> w<Right> :vertical resize -3<CR>
noremap <silent> w<Up> :resize +3<CR>
noremap <silent> w<Down> :resize -3<CR>


"Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
