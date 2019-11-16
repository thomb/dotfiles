" This must be first, because it changes other options as side effect
set nocompatible
filetype off
source ~/.vim/abbreviations.vim
execute pathogen#infect()
syntax on
let mapleader=","
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
filetype plugin indent on
filetype plugin on
set encoding=utf-8
set mouse-=a
set nowrap        		" don't wrap lines
set backspace=indent,eol,start 	" allow backspacing over everything in insert mod
set autoindent    		" always set autoindenting on
set copyindent    		" copy the previous indentation on autoindenting
set number        		" always show line numbers
set shiftround    		" use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     		" set show matching parenthesis
set ignorecase    		" ignore case when searching
set smartcase     		" ignore case if search pattern is all lowercase  case-sensitive otherwise
set hlsearch			" highlight search terms
set incsearch   	 	"  show search matches   as  you type
set history=1000
set wildmenu
set spell
set winminheight=0
set wildmode=list:longest
set visualbell
set t_vb=
set mouse=""
set undolevels=1000
set nobackup
set textwidth=150
set colorcolumn=+1
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
set expandtab

highlight ColorColumn term=reverse ctermbg=1 guibg=LightBlue
augroup colorcolumn
    autocmd!
    autocmd ColorScheme mustang highlight ColorColumn term=reverse ctermbg=1 guibg=Red
augroup end

set noswapfile
set cursorline cursorcolumn
"set nofoldenable
set background=dark

nnoremap / /\v
vnoremap / /\v

colorscheme mustang
color mango
noremap <leader>enc ysiw
noremap <leader>i :set list!<CR>
noremap <leader>N :setlocal number!<CR>
noremap <c-_> <c-w>_
noremap <C-H> <C-W>h 
noremap <c-j> <c-w>j<c-_>
noremap <c-k> <c-w>k<c-_>
noremap <C-L> <C-W>l
noremap <C-P> :CtrlPMRUFiles
noremap :W :w
noremap :Q :q
nnoremap <leader>kl :.w !pbcopy<CR><CR>
vnoremap <leader>kl :w !pbcopy<CR><CR>
nnoremap <leader>pl :set paste<cr>:r !pbpaste<CR>:set nopaste<CR>
noremap <leader>s <esc>:w<CR>
inoremap <leader>cl console.log();<esc>hi
nnoremap <leader>cl oconsole.log();<esc>hi
inoremap <leader>p <esc>pA
noremap <leader><space> :noh<CR>

" Javacsript hlpers
nnoremap <leader>lov yiwoconsole.log();<esc>hhpa,<esc>p0f(a'<esc>f,i'<esc>
nnoremap <leader>lob oconsole.log();<esc>hhpa,<esc>p0f(a'<esc>f,i'<esc>
vnoremap <leader>loc yoconsole.log();<esc>hhp
nnoremap <leader>retv yiworeturn ;<esc>hp
nnoremap <leader>decp oconst {} = this.props;<esc>0f{a
nnoremap <leader>decs oconst {} = this.state;<esc>0f{a
nnoremap <leader>as oexpect(false).toBe(true);
nnoremap <leader>tst oit("should ", () => {<esc>o});<esc>kfdla
nnoremap <leader>jdc odescribe("", () => {<esc>o});<esc>kf"a

""" airline
let g:airline_detect_whitespace=0
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
set laststatus=2

let g:airline_section_b='%4*\ %<%F%*'            "full pathk
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
" trim whitespace on save!! I like this!
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e

let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0
let g:ale_fix_on_save = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_list_window_size = 0
let g:ale_lint_delay = 1000
let g:ale_set_quickfix = 0
let g:ale_set_loclist = 0

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint', 'tsserver', 'tslint'],
\   'less': ['stylelint'],
\   'css': ['stylelint'],
\   'yaml': ['yamllint'],
\}

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint', 'tslint'],
\   'css': ['stylelint'],
\}
let g:ale_fix_on_save = 1

let g:ale_javascript_eslint_executable = '/usr/local/bin/eslint'

set exrc
set secure
set rtp+=/usr/local/opt/fzf
com! FormatJSON %!python -m json.tool
:inoremap <leader>ad <C-R>=strftime("%m/%d/%y")<CR>
