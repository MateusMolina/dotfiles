set nocompatible
filetype plugin on
syntax on
set linebreak 
:set relativenumber
" set cursorline
"highlight clear CursorLine
set number
set tabstop=2
" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" auto install plug.vim
let data_dir = has('snvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Some shortcuts i cant live without
let mapleader = " " " map leader to Space
nnoremap <A-k> :m-2<CR>
nnoremap <A-j> :m+<CR>
inoremap <A-k> <Esc>:m-2<CR>
inoremap <A-j> <Esc>:m+<CR>
nnoremap <C-A-j> Yp
inoremap <C-A-j> <Esc>Yp<CR>
nnoremap <C-A-k> Y<Up>p
inoremap <C-A-k> <Esc>Y<Up>p<CR>

" Interacting with xclip
" Requires aliases for pbcopy and pbpaste
vnoremap <C-S-c> :!pbcopy<CR>u
nnoremap <C-S-v> :!pbpaste<CR>

" Other commands
nnoremap <leader>f :Files .<CR>
nnoremap <leader><CR> :ALEGoToImplementation<CR>
nnoremap <leader><Space> gd

" Configs
let g:ale_completion_enabled = 1

" Here begins plug

call plug#begin()

Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot' " Syntax highlighter for vim
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " Adds multiple cursors to vim, like VSCode
Plug 'vim-airline/vim-airline' " A cool line on the bottom
Plug 'airblade/vim-gitgutter' " See ~, +, - in the git gutter
Plug 'tpope/vim-fugitive' " git stuff
Plug 'tpope/vim-commentary' " vim-motion comment with shortcut gc (gcc for a line) 
Plug 'jiangmiao/auto-pairs' " auto complete (,[...
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder
Plug 'junegunn/fzf.vim' " Sane defaults for fzf wrapper

"themes
call plug#end()

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (getenv('TERM_PROGRAM') != 'Apple_Terminal')
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

set background=dark

let g:airline#extensions#tabline#enabled = 1

" Plugin customizations
"" airblade/vim-gitgutter
highlight! link SignColumn LineNr
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" Make bash run interactive; in order to load the aliases/.bashrc
set shellcmdflag=-ic

