call plug#begin('~/.vim/plugged')
" cs"' changes " to '. cs]} for } to }. ds} to remove }
Plug 'tpope/vim-surround'

" gc{motion} to comment lines. gcc for one line. gc in visual mode.
Plug 'tomtom/tcomment_vim'

" Colorful line at the bottom. With themes.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Shows a symbol for git changes in the gutter
Plug 'airblade/vim-gitgutter'

" Press <c-p> for a magic fuzzy finder. <c-t>,<c-v>,<c-x> to open entry in tab
" or split
Plug 'ctrlpvim/ctrlp.vim'

Plug 'octol/vim-cpp-enhanced-highlight'

" Needed for clang-format?
Plug 'kana/vim-operator-user'

" Runs clang-format on <leader-c> for c/cpp files.
Plug 'rhysd/vim-clang-format'

" Syntax checking
Plug 'vim-syntastic/syntastic'

" Plug '/usr/local/opt/fzf'
Plug 'sheerun/vim-polyglot'

" Deoplete
if has('nvim')
  Plug 'roxma/nvim-yarp'
  Plug 'ncm2/ncm2'
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " let g:deoplete#enable_at_startup = 1
endif

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()

filetype on
syntax on

" Theming
colorscheme jellybeans
let g:airline_theme='jellybeans'

set number
set ru

" Key mappings
let mapleader=" "
map <leader>s :source ~/.vimrc<CR>
autocmd FileType c,cpp,objc map <buffer><Leader>c <Plug>(operator-clang-format)

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 0
hi SpellBad term=reverse ctermbg=darkgreen
" Only check cpp
let g:syntastic_mode_map = {
        \ "mode": "passive",
        \ "active_filetypes": ["cpp", "c"],
        \ "passive_filetypes": [] }


set hidden
set history=100

filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set visualbell " no beeping

set hlsearch

set showmatch

" ncm
if has('nvim')
    autocmd BufEnter * call ncm2#enable_for_buffer()

    " IMPORTANTE: :help Ncm2PopupOpen for more information
    set completeopt=noinsert,menuone,noselect

    " NOTE: you need to install completion sources to get completions. Check
    " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-tmux'
    Plug 'ncm2/ncm2-path'
    Plug 'ncm2/ncm2-pyclang'
    let g:ncm2_pyclang#library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'

    Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
endif
