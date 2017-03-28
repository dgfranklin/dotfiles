set shell=/bin/zsh

" Setting up Vundle - the vim plugin bundler
" Load vim-plug
let plug_path = has('nvim') ? "~/.config/nvim/autoload/plug.vim" : "~/.vim/autoload/plug.vim"
if empty(glob(plug_path))
         execute '!curl -fLo ' . plug_path . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
         let install_bundles=0
endif
"
set nocompatible

call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'bronson/vim-trailing-whitespace'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf',
Plug 'Konfekt/FastFold'
Plug 'majutsushi/tagbar'
Plug 'leafgarland/typescript-vim'
Plug 'nelstrom/vim-visual-star-search'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fmoralesc/vim-pad'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Source env-specific plugins (since we can only have 1)
let env_specific_plug_source=expand('~/.vimrc_plug_local')
if filereadable(env_specific_plug_source)
    execute 'source '.fnameescape(env_specific_plug_source)
endif

call plug#end()

syntax on
set background=light
set spell
let g:solarized_termcolors=16
colorscheme solarized

if exists('+breakindent')
    set breakindent
    set linebreak
    set showbreak=..
endif
if exists('+cc')
    set cc=+1
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Indent automatically depending on filetype
filetype plugin on
filetype indent on

" Turn on line numbering. Turn it off with "set nonu"
set relativenumber
set number

"" Search
set ignorecase
set smartcase

set backspace=indent,eol,start

set ruler

set foldmethod=syntax
let g:fastfold_fold_command_suffixes = []
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set lbr
set ai "Auto indent
set wrap "Wrap lines


""""""""""""""""""""""""
" => Key Bindings
"""""""""""""""""""""""
nmap <F2> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
let mapleader = ","

"" Easy Motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-s2)
omap s <Plug>(easymotion-t2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade Comment
hi link EasyMotionTarget2First ErrorMsg

hi link EasyMotionMoveHL Search
hi link EasyMotionIncSearch Search

""
" Tab completion of filenames
""

set wildmode=longest,list,full
set wildmenu

"""
" => Ycm
"""

let g:ycm_always_populate_loc_list = 1
let g:ycm_open_loclist_on_ycm_diags = 1
let g:EclimCompletionMethod = 'omnifunc'

"""
" => FZF
"""
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
function! FZFExecute()
  " Remove trailing new line to make it work with tmux splits
  let directory = substitute(system('git rev-parse --show-toplevel'), '\n$', '', '')
  if !v:shell_error
    call fzf#run({'sink': 'e', 'dir': directory, 'source': 'git ls-files', 'tmux_height': '40%'})
  else
    FZF
  endif
endfunction
command! FZFExecute call FZFExecute()
nnoremap <C-P> :FZFExecute<CR>

" """
" => Environment
" """
let env_specific_source=expand('~/.vimrc_local')
if filereadable(env_specific_source)
    execute 'source '.fnameescape(env_specific_source)
endif

" Mouse
set mouse+=a
if &term =~ '^screen' && !has('nvim')
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif
"
" Powerline specific settings
set hidden
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#fnamemod = ':t'
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab
set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

iab <expr> ddate strftime("%Y_%m_%d")
