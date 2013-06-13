set nocompatible 

"color-coded cursor depending on mode; green for insert, red for command
if &term =~ "xterm\\|rxvt"
  let &t_SI = "\<Esc>]12;green\x7"
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  autocmd VimLeave * silent !echo -ne "\033]112\007"
endif		

" fix broken arrow key nav in insert mode
imap <ESC>oA <ESC>ki
imap <ESC>oB <ESC>ji
imap <ESC>oC <ESC>li
imap <ESC>oD <ESC>hi

let &t_Co=256				" let vim know we got all dem 256 colors
filetype plugin indent on  		" Automatically detect file types.
syntax on 				" syntax highlighting
colorscheme molokai
set mouse=a				" automatically enable mouse usage
set history=1000  			" Store a ton of history (default is 20)
set backup 				" backups are nice ...
set undofile				" so is persistent undo ...
set undolevels=1000 			" maximum number of changes that can be undone
set undoreload=10000 			" maximum number lines to save for undo on a buffer reload
set tabpagemax=15 			" only show 15 tabs
set showmode                   		" display the current mode
set ruler                  		" show the ruler
set rulerformat=%l,%c 			" simple ruler with line/char numbers
set showcmd                		" show partial commands in status line
set backspace=indent,eol,start		" backspace for dummys
set linespace=0				" No extra spaces between rows
set nu					" Line numbers on
set incsearch				" find as you type search
set hlsearch				" highlight search terms
set ignorecase				" case insensitive search
set smartindent				" sane auto indenting
set shiftwidth=4			" set up indent width
set tabstop=4				"
set wildmenu				" show list instead of just completing
set wildmode=list:longest,full		" command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]		" backspace and cursor keys wrap to
set scrolljump=5 			" lines to scroll when cursor leaves screen
set scrolloff=3 			" minimum lines to keep above and below cursor
" set foldenable  			" auto fold code
set gdefault				" the /g flag on :s substitutions by default
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.   " Highlight problematic whitespace	
set nowrap                     			" wrap long lines
set relativenumber                              " makes jumping easier
set nohlsearch				" no highlighting search queries
"  Remove trailing whitespaces and ^M chars
" autocmd FileType c, hs,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

"""""""""""""""""""""muh bindings
" screw the shift button, dont wanna waste time with that crap
nnoremap ; :

" forget moving hands off homerow for something as simple as a search
nnoremap F /

" fix shift key abomination 
cmap W w
cmap Q q

" this fixes the mind-blowingly retarded fact that vim has a one second delay between switching out of 
" insert mode and into command mode.
imap ` <C-c>`^

" this handsome little hack forces the cursor's color to change when the mode changes to insert
" normally, the mode would change to insert and the cursor color would not change until you started typing
nmap i id<BS>

" sane pasting 
map <C-v> "+p
imap <C-v> <C-c>"+pi
map <C-c> "+y
" sane undo
map <C-z> u
imap <C-z> <C-c>ui

" make "a" append at beginning of line, rather than whatever the hell it does now
map a ^i

""""""""""""""""""""'compiler mappings
" Map F5 to load the current file into ghci; shamelessly stolen from kuraitou
if has("unix")
	autocmd FileType haskell nmap <buffer> <F5> :!ghci %:p<CR>
else
	autocmd FileType haskell nmap <buffer> <F5> :!start ghci %:p<CR>
endif

" Map F5 to load current file into node
if has("unix")
	autocmd FileType javascript nmap <buffer> <F5> :!node %:p<CR>
endif

" Map F5 for launching django server
if expand('%:t') == "manage.py"
	autocmd FileType python nmap <buffer> <F6> :!python %:p runserver 8888<CR>
endif

" Map F5 for launching python files
if has("unix")
	autocmd FileType python nmap <buffer> <F5> :!python %:p<CR>
endif

" Map F5 for launching make
if has("unix")
	autocmd FileType c nmap <buffer> <F5> :!make %:r<CR>
endif

"other stuff
autocmd FileType python compiler pylint

"git stuff for whenever we get around to that
let b:VCSCommandMapPrefix=',v'
let b:VCSCommandVCSType='git'

