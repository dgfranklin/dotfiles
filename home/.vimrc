set shell=/bin/zsh

set nocompatible

call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'bronson/vim-trailing-whitespace'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf',
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
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'vimwiki/vimwiki'

" Source env-specific plugins (since we can only have 1)
let env_specific_plug_source=expand('~/.vimrc_plug_local')
if filereadable(env_specific_plug_source)
    execute 'source '.fnameescape(env_specific_plug_source)
endif

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX) && getenv('TERM_PROGRAM') != 'Apple_Terminal')
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

call plug#end()

syntax on
set background=dark
set spell
autocmd vimenter * ++nested colorscheme gruvbox

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

" set foldmethod=syntax
" let g:fastfold_fold_command_suffixes = []
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

"Powerline specific settings
 set hidden
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#fnamemod = ':t'
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab
set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

iab <expr> ddate strftime("%Y_%m_%d")

let g:nv_directories = ['~/nv']
let vim_markdown_preview_github=1
