execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme wombat
set ignorecase
set hlsearch
set laststatus=2
set wildmenu

set path=.,,**
set number
set ruler
set wrap

au BufNewFile,BufRead,BufReadPost *.tex,COMMIT_EDITMESSAGE set textwidth=72
autocmd BufWritePre *.tex %s/\s\+$//e

" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" Tab navigation like Firefox.
nnoremap <C-w> :tabclose<CR>
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>

nnoremap <C-I> i <ESC>r

nnoremap <C-L> <C-I>

" Use spaces instead of tabs
set expandtab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

runtime macros/matchit.vim

" Switch between windows
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

set tags=./tags;~/workspace

function! GetCompanionFile(current_file)
	let filename = fnamemodify(a:current_file, ':r')
	let ext = fnamemodify(a:current_file, ':e')
	
	if ext == "h"
		let new_extension = ".cpp"
	else
		let new_extension = ".h"
	endif
	let $companion_file = filename . new_extension
	echo findfile($companion_file)
endfunction

function! s:SetVariables(dst, locs)
    if !exists("b:fswitchdst")
        let b:fswitchdst = a:dst
    endif
    if !exists("b:fswitchlocs")
        let b:fswitchlocs = a:locs
    endif
endfunction

noremap <S-tab> :FSHere<CR>

