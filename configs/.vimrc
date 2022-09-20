" Terminal sounds.
set visualbell
set t_vb=

" Tab sizes.
set tabstop=4
set shiftwidth=4
set expandtab

" Highlight text when searching
set hlsearch

" Set cursor modes.
set ttimeout
set ttimeoutlen=1
let &t_SR = "\<esc>[3 q"  " Start Replace mode: blinking underline
let &t_SI = "\<esc>[6 q"  " Start Insert mode: steady bar
let &t_EI = "\<esc>[1 q"  " Exit Insert mode: blinking block

" Quickly reset cursor mode to blinking block on start.
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[1 q"
augroup END

" Editor display settings.
set relativenumber number

" Vim-Plug Setup
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'OmniSharp/omnisharp-vim'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'AndrewRadev/diffurcate.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'github/copilot.vim'

call plug#end()

" Configure Omnisharp
let g:OmniSharp_server_use_net6 = 1
let g:OmniSharp_diagnostic_exclude_paths = [
\ 'obj/',
\ '/.nuget/'
\]
augroup omnisharp_commands
    autocmd!

    autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)zz
    autocmd FileType cs nmap <silent> <buffer> gi <Plug>(omnisharp_find_implementations)
    autocmd FileType cs nmap <silent> <buffer> <leader>r <Plug>(omnisharp_rename)
    autocmd FileType cs nmap <silent> <buffer> <leader>gcc <Plug>(omnisharp_global_code_check)
    autocmd FileType cs nmap <silent> <buffer> <leader>. <Plug>(omnisharp_documentation)
    autocmd FileType cs nmap <silent> <buffer> gu <Plug>(omnisharp_find_usages)

augroup END

" Configure Ale.
let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}


" Remaps
nnoremap <SPACE> <Nop>
let mapleader = " "

func! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfu

nnoremap <silent> <C-h> :call WinMove('h')<cr>
nnoremap <silent> <C-j> :call WinMove('j')<cr>
nnoremap <silent> <C-k> :call WinMove('k')<cr>
nnoremap <silent> <C-l> :call WinMove('l')<cr>
nnoremap <silent> <leader>b :!clear && dotnet build && pkill dotnet<CR>
nnoremap <leader>ve :e ~/projects/dotfiles/configs/.vimrc<CR>
nnoremap <leader>vu :! ~/projects/dotfiles/update-files.sh<CR><CR>
nnoremap <leader>vr :source $MYVIMRC<CR>
nnoremap <leader>f :FZF<CR>
nnoremap <CR> :nohlsearch<CR><CR>
