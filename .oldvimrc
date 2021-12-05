" Basic Settings
syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set number relativenumber
set hlsearch
set backspace=indent,eol,start
let mapleader = " "


" Remove delay from switching between insert and normal modes
set ttimeout
set ttimeoutlen=100
set timeoutlen=3000


" Override values for the cursor when in differnet modes (mostly normal mode)
let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"


" Show relative numbers when out of insert, absolute when in insert
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END


" Highlight current line when insert mode is active
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul


set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey


" Plugins (General)
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'jremmen/vim-ripgrep'
Plug 'itchyny/lightline.vim'
Plug 'vim-test/vim-test'

" Plugins (Python)
Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
Plug 'jeetsukumaran/vim-pythonsense'

"Plugins (Javascript)
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'

call plug#end()


" Colors
colorscheme gruvbox
set background=dark


" Copy to Windows clipboard
vmap <C-c> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe <CR><CR>


" Window Movement
nmap <C-h> :wincmd h<CR>
nmap <C-j> :wincmd j<CR>
nmap <C-k> :wincmd k<CR>
nmap <C-l> :wincmd l<CR>


" Highlighting
:nnoremap <CR> :nohlsearch<CR><CR>


" coc
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)


" fzf
nmap <C-p> :GFiles<CR>


" NERDTree
nmap <leader>3 :NERDTreeToggle<CR>
nmap <leader>4 :NERDTreeFind<CR>


" ripgrep
if executable('rg')
    let g:rg_derive_root='true'
endif
nnoremap <leader>ps :Rg<SPACE>


" lightline
set laststatus=2


" vim-test
let test#strategy = "vimterminal"
let test#python#runner = 'pytest'
let test#python#pytest#options = '--disable-warnings'
nmap <leader>t :TestFile<CR>


let g:coc_disable_startup_warning = 1
