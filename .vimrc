" Jon Bartlett 2011-2016

set nocompatible                  " Must come first because it changes other options.

" use Vundle instead of athogen
" silent! call pathogen#runtime_append_all_bundles()

syntax enable                     " Turn on syntax highlighting.

" Start Vundle https://github.com/VundleVim/Vundle.vim
" set the runtime path to include Vundle and initialize
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'aperezdc/vim-template'
Plugin 'vim-ruby/vim-ruby'
Plugin 'sheerun/vim-wombat-scheme'
Plugin 'vim-airline/vim-airline'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mrtazz/simplenote.vim'           " Simplenote support
Plugin 'moll/vim-bbye'                   " close buffers properly
Plugin 'scrooloose/syntastic'            " Syntax checking
Plugin 'thinca/vim-quickrun'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" End Vundle

" Source SimpleNote VIM credentials
source ~/.simplenoterc

" workaround for vim-better-whitespace issue (toggle on/off)
" https://github.com/ntpeters/vim-better-whitespace/issues/40
autocmd VimEnter * DisableWhitespace
autocmd VimEnter * EnableWhitespace


runtime macros/matchit.vim        " load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.

" Keep swap files in one location
if has("win32")
   set directory=$TEMP
else
   set directory=$HOME/.vim/tmp//,.
endif

" UNCOMMENT TO USE
set tabstop=1                    " Global tab width.
set shiftwidth=1                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

if has("win32")
   " wombat colour scheme not too good under Windows
   colorscheme desert
   " Copy and Paste mapping
   vnoremap <C-X> "+x
   vnoremap <C-C> "+y
   map <C-V>		"+gP
else
   colorscheme wombat
endif

" change Leader key to comma (,)
let mapleader=","

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" Uncomment to use Jamis Buck's file opening plugin
"map <Leader>t :FuzzyFinderTextMate<Enter>

" Map Leader control-f to Fuzzy File Finder
map <leader>f :FufFile<Enter>
map <leader>b :FufBuffer<Enter>

" Map Control-J K to switch between buffers
" http://stackoverflow.com/questions/327411/how-do-you-prefer-to-switch-between-buffers-in-vim
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>

" Controversial...swap colon and semicolon for easier commands
"nnoremap ; :
"nnoremap : ;

"vnoremap ; :
"vnoremap : ;

" Disable arrow keys - conflicts with FuzzyFile Finder
"inoremap <Left>  <NOP>
"inoremap <Right> <NOP>
"inoremap <Up>    <NOP>
"inoremap <Down>  <NOP>

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2
"
" Override some file type settings
autocmd FileType xml setlocal shiftwidth=4 tabstop=4

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
autocmd BufNewFile,BufRead *_spec.rb compiler rspec

"" Autoload NERDTree on opening VIM with no arguments - uncomment to start on
"" load
""  from http://blogs.perl.org/users/ovid/2011/04/nerdtree-on-startup.html
""  Changed to always load
"function! StartUp()
    "if 0 == argc()
        "NERDTree
        "wincmd l
    "else
        "NERDTree
        "wincmd l
    "end
"endfunction

"autocmd VimEnter * call StartUp()

"How can I close vim if the only window left open is a NERDTree?  https://github.com/scrooloose/nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



"In vim, how do I get a file to open at the same line number I closed it at last time?
"http://stackoverflow.com/questions/774560/in-vim-how-do-i-get-a-file-to-open-at-the-same-line-number-i-closed-it-at-last
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Expand NERDTree to current file
" http://superuser.com/questions/356258/expanding-current-directory-in-nerdtree-without-changing-root
"map <leader>r :NERDTreeFind<cr> " 05/05/2016 - overlaps with Quickrun

" Prevent Vim cursor jump to begining of the line after buffer switch
" http://stackoverflow.com/questions/8292742/vim-cursor-jumps-to-begining-of-the-line-after-buffer-switch
:se nostartofline

" add Arduino highlighting
" http://www.vim.org/scripts/script.php?script_id=2654
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino

" Spelling
set spellfile=~/vimspellfile-en.utf-8.add
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_gb "turn on spelling for markdown files only
autocmd BufRead,BufNewFile *.markdown setlocal spell spelllang=en_gb "turn on spelling for markdown files only
autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_gb "turn on spelling for text files

" correctly identify files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.ddl set filetype=sql


" Bbye (Buffer Bye) for Vim https://github.com/moll/vim-bbye
:nnoremap <Leader>q :Bdelete<CR>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Quickrun
let g:quickrun_config = {}
let g:quickrun_config['sql.db2'] = {
\   'command':  'db2',
\   'exec': '%c -td@ -f %s',
\ }
