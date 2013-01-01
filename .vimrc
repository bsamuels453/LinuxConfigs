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
" Remove trailing whitespaces and ^M chars
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
imap ` <C-c>
""""""""""""""""""""'

" Map F5 to load the current file into ghci; shamelessly stolen from kuraitou
if has("unix")
	autocmd FileType haskell nmap <buffer> <F5> :!ghci %:p<CR>
else
	autocmd FileType haskell nmap <buffer> <F5> :!start ghci %:p<CR>
endif

"git stuff for whenever we get around to that
let b:VCSCommandMapPrefix=',v'
let b:VCSCommandVCSType='git'

