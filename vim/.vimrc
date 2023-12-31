set nocompatible
filetype plugin on
syntax on
set linebreak 
set cursorline
highlight clear CursorLine
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
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Some shortcuts i cant live without
nnoremap <A-Up> :m-2<CR>
nnoremap <A-Down> :m+<CR>
inoremap <A-Up> <Esc>:m-2<CR>
inoremap <A-Down> <Esc>:m+<CR>
nnoremap <C-S-Down> Yp
inoremap <C-S-Down> <Esc>Yp<CR>
nnoremap <C-S-Up> Y<Up>p
inoremap <C-S-Up> <Esc>Y<Up>p<CR>

call plug#begin()

Plug 'skywind3000/asyncrun.vim'
Plug 'samgriesemer/vim-roam'
Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
" Plug 'itchyny/lightline.vim'

Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
"themes
Plug 'morhetz/gruvbox'
call plug#end()

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

set background=dark
function! s:tweak_colorscheme()
  " hi Normal guibg=NONE ctermbg=NONE
  " hi LineNr guibg=NONE ctermbg=NONE
endfunction

autocmd! ColorScheme gruvbox call s:tweak_colorscheme()

colorscheme gruvbox

let g:airline#extensions#tabline#enabled = 1

""" GOYO STUFF  """
" Call goyo when opening a markdown file
autocmd Filetype markdown call SetUpMk()
function SetUpMk()
    execute 'Goyo 50%'
endfunction

