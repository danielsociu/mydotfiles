set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')

"COLORS scheeeemeeeeesss
"Plugin 'tyrannicaltoucan/vim-deep-space'
Plugin 'rakr/vim-two-firewatch'

" Some interesting unused keybinds but later on since i suck atm
Plugin 'tpope/vim-unimpaired'
" Some path project adder, for the find and specific find commands
" Plugin tpope/vim-rails

"Plugin for selecting the search i/ (represents the selection)
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-lastpat'

" Plugin super substitute /S great thing for swapping 2 words :%S/{wordA,wordB}/{wordB,wordA}/g
Plugin 'tpope/vim-abolish'

" Plugin for surrounding the selection
Plugin 'tpope/vim-surround'

" Plugin for comments still from tpope <3
Plugin 'tpope/vim-commentary'

" Plugin for intricate html structures
Plugin 'mattn/emmet-vim'

" Plugin for out lovely website codeforces
Plugin 'Igorjan94/codeforces.vim'

" Plugin for identline cute af
Plugin 'Yggdroot/indentLine'

" Plugin for javascript or and java thing?
Plugin 'pangloss/vim-javascript'

" Some basic defaults 'everyone agrees on'?? Sure thing
Plugin 'tpope/vim-sensible'

Plugin 'VundleVim/Vundle.vim'

" Plugin for Git managing, so later on
Plugin 'tpope/vim-fugitive'

Plugin 'jiangmiao/auto-pairs'

Plugin 'Valloric/YouCompleteMe'

" Ultisnips plugin xD
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Plugin for tmux-keybinds 
Plugin 'christoomey/vim-tmux-navigator'

" Plugin for Haskell indentatino
Plugin 'neovimhaskell/haskell-vim'


call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal


" Not reallly knowing what those are doing...
set showmode
set wildmenu
set lazyredraw
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set cindent
"set mouse=a
set cursorline
set encoding=utf-8

"Ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<F3>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories = ['/home/alhiris/code/UltiSnips']

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" EndUltisnips

"Disabling wrapping and continuing on enter or on o/O normal mode
"See help fo-table for more info on letters

"COLORSCHEMEEEESSS***********************************************************************************

"two fire watch coorscheme
"set background=dark " or light if you prefer the light version
"set termguicolors
"colo two-firewatch

"colorscheme deep-space
"set background=dark
"set termguicolors
"colorscheme deep-space

"veryyy olld colorscheme like a boss, cute blue and red xD
colorscheme koehler

"COLORSCHEMEEEESSS***********************************************************************************
set formatoptions-=cro 

"Set some padding between the numbers and relative numbers
set numberwidth=6

" Makes the pass through the buffers and argo/bufdo command work properly
set hidden

" Set the history of the cmd to 200 comands
set history=200

" Set the search to be a beatuy of a search
set wildmode=list:full

" Set all numbers to be considered decimal for <C-a>,<C-x> default, in octal 07+01=10
set nrformats=

" Enable line numbers
set number

"Relative line numbering:
set rnu

"Disable modeline (first and last lines of initializations
set nomodeline

"Highlight the search results
set hlsearch

"Incremental search on
set incsearch

" Don't wrap lines
set nowrap

" YCM thing
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
"let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" For working without std:: prefix
let g:ycm_auto_trigger=1
let g:ycm_semantic_triggers = {
\'c' : ['->', '    ', '.', ' ', '(', '[', '&'],
\'cpp,objcpp' : ['->', '.', ' ', '(', '[', '&', '::'],
\'perl' : ['->', '::', ' '],
\'php' : ['->', '::', '.'],
\'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
\'ruby' : ['.', '::'],
\'lua' : ['.', ':'],
\'scss,css': [ 're!^\s{2,4}', 're!:\s+' ],
\'html': ['<', '"', '</', ' '],
\'javascript': ['.', 're!(?=[a-zA-Z]{3,4})'],
\}

" Store an undo buffer in a file in $HOME/.vimundo
set undofile
set undodir=$HOME/.vimundo
set undolevels=1000
set undoreload=10000

"MAPS

"Mapping ; as : for faster commands, no need of shift
"nnoremap ; :
"
"Map putting ; at the end of the line no matter where and which mode HOW TO RETURN BACK??? 
"execute "set <M-k>=\ek"
"map <M-k> <C-\><C-N>$a;<ESC>
"inoremap <M-k> <C-\><C-N>$a;<ESC>

" Map the up and down keys in command mode as they are supposed to
" be(filtering thorugh)
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

"Mappings for buffer changing fast, unusued keybinds
"nnoremap <silent> [b :bprev<CR>
"nnoremap <silent> ]b :bnext<CR>
"nnoremap <silent> [B :bfirst<CR>
"nnoremap <silent> ]B :blast<CR>
"Those are now included in vim-unimpaired with other many good shortcuts

"Expansion for directory %:h path file reducer
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"Search selection in visual mode with the * and # characters
function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

"Mapping the :noh on F2
set <F2>=<C-v><F2>
noremap <silent> <F2> :noh<CR>
inoremap <silent> <F2> <C-[>:noh<CR>a

"Fixing the & command so it works with flags intead of :& we use :&& (flags)
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Getting a command to work with the quickfix list(:copen to see list)
" Usually for vimgrep files that matched the search so we dont have any errors
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
    let buffer_numbers= {}
    for quickfix_item in getqflist()
        let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
    endfor
    return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

" Mapping F5 to be the ctags refresher
nnoremap <F5> :!ctags -R<CR>

" Trying to automate my c++ program execute
" No idea
" nnoremap <F9> :vert terminal ++open ++cols=40 (sudo g++ -o ~\/code\/power ~\/code\/codeforces.cpp | clear | ~\/code\/power) <CR>

" Mappings for moving around fast between splits
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Unbinding the god damn cancer arrows
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
