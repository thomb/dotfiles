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
set tabstop=4     		" a tab is four spaces
set backspace=indent,eol,start 	" allow backspacing over everything in insert mod
set autoindent    		" always set autoindenting on
set copyindent    		" copy the previous indentation on autoindenting
set number        		" always show line numbers
set shiftwidth=4  		" number of spaces to use for autoindenting
set shiftround    		" use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     		" set show matching parenthesis
set ignorecase    		" ignore case when searching
set smartcase     		" ignore case if search pattern is all lowercase  case-sensitive otherwise
set smarttab    	  	" insert tabs on the    start of a line according to shiftwidth, no    tabstop
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
nnoremap <leader>lov yiwoconsole.log();<esc>hhp
nnoremap <leader>lob oconsole.log();<esc>hhp
vnoremap <leader>loc yoconsole.log();<esc>hhp
nnoremap <leader>retv yiworeturn ;<esc>hp
nnoremap <leader>nobj o:{<esc>o<esc>o},<esc>2ki
nnoremap <leader>tne oif (err) {<esc>othis.widget.logError({<cr>err: err, <cr>message: '', <cr>type: 'error',<cr>notify: true<cr>});<esc>o}<esc>4kf'a
nnoremap <leader>swl othis.widget.showLoader();<esc>
nnoremap <leader>hwl othis.widget.hideLoader();<esc>
nnoremap <leader>decp oconst {} = this.props;<esc>0f{a
nnoremap <leader>decs oconst {} = this.state;<esc>0f{a
nnoremap <leader>as oexpect(false).toBe(true);
nnoremap <leader>tst oit("should ", () => {<esc>o});<esc>kfdla
nnoremap <leader>jdc odescribe("", () => {<esc>o});<esc>kf"a



" PYTHON HELPERS
nnoremap <leader>rec y<esc>oraise Exception()<esc>hp
nnoremap <leader>reb <esc>oraise Exception()<esc>hp
nnoremap <leader>rev yiw<esc>oraise Exception()<esc>hp

""" BACKBONE VIEW
nnoremap <leader>bbv o:Backbone.View.extend({<esc>oevents: {<esc>o},<esc>oinitialize: {<esc>o},<esc>orender: {<esc>}o}),<esc>

""" JSDOC function declation
nnoremap <leader>jsd 0yyPI/** <CR>    @method<space><esc>0f:Da<CR><space><space><space><space>@memberof<space><CR><esc>0f*a<space><esc>p0f:df(0f)d$0f*a<space><esc>$a<CR><CR><space><space><space><space>@desc<esc>o<backspace><backspace><backspace><backspace><backspace><cr>/<esc>
nnoremap <leader>jsf 0yyPf.ld0diwO/** <cr>    @method <esc>pj0df(f)d$I<esc>d0d$ko<backspace>        @memberof <esc>o<backspace><backspace><cr><cr>/<esc>ka<space><esc>p
nnoremap <leader>jaf 0yyPI/** <CR> <CR> @method<SPACE><ESC>0f<space>i<cr>df{A <CR> <ESC>p0f(s<esc>f)D<esc>o/<esc>k0f<space>
nnoremap <leader>jda 0yyPI/** <CR><cr><esc>0f(s<cr><esc>f)s<cr>**/<esc>



""" JSDOC param
nnoremap <leader>jsp diwo<backspace>    @param        {}        <esc>p0f{a
nnoremap <leader>jsr diwo<backspace>    @property        {}        <esc>p0f{a
nnoremap <leader>jsc diwo    @param        {Function}       <esc>p
nnoremap <leader>jso diwo    @param        {Object}         <esc>p
nnoremap <leader>jsa diwo    @param        {Array}          <esc>p
nnoremap <leader>jse diwo    @param        {Event}          <esc>p
nnoremap <leader>jss diwo    @param        {String}         <esc>p
nnoremap <leader>jsb diwo    @param        {Boolean}        <esc>p
nnoremap <leader>jsi diwo    @param        {Integer}        <esc>p

nnoremap <leader>apg o api.getalt('', {<cr><backspace>filters: [],<cr><tab>columns: []<cr>}, function (results, err) {<cr>if (err) {<cr>this.widget.logError({<cr>err: err, <cr>message: '', <cr>type: 'error',<cr>notify: true<cr>});<cr>}<cr>}.bind(this));<esc>

let g:javascript_enable_domhtmlcss = 1
let g:javascript_ignore_javaScriptdoc = 1
let g:javascript_plugin_flow = 1


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
\   'javascript': ['eslint', 'flow'],
\   'less': ['stylelint'],
\   'yaml': ['yamllint'],
\}

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'css': ['eslint'],
\}
let g:ale_fix_on_save = 1

let g:ale_javascript_flow_executable = '/usr/local/bin/flow'

set exrc
set secure
set rtp+=/usr/local/opt/fzf
