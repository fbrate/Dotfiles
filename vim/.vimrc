




set nocompatible                                           
execute pathogen#infect()                                     


filetype plugin indent on
func Eatchar(pat)                                                            
      let c = nr2char(getchar(0))                                               
       return (c =~ a:pat) ? '' : c                                              
endfunc   

inoreabbrev sout System.out.println();<ESC>hi<C-R>=Eatchar('\s')<CR>
inoreabbrev jmain public static void main (String [] args ) {<CR>}<ESC>ko<TAB><C-R>=Eatchar('\s')<CR>


"fzf:

set rtp+=~/.vim/bundle/fzf/bin/fzf

syntax enable
set background=light
colorscheme solarized 

set clipboard+=unnamed
"set paste               " Paste from a windows or from vim
set go+=a               " Visual selection automatically copied to the clipboard


let g:airline_theme='solarized'
let g:airline_solarized_bg='light'
let g:airline#extensions#tabline#enabled = 1


let g:airline_powerline_fonts = 1


nmap <F2> :FZF<CR>
nmap <F3> :FZF ~<CR>
nmap <F4> :FZF /<CR>


nmap <F8> :TagbarToggle<CR> 



set number
set relativenumber
set autoindent
set cursorline
set colorcolumn=80


let g:ycm_use_clangd = 0





" This is the default extra key bindings
let loaded_delimitMate = 0
let delimitMate_autoclose = 1
let delimitMate_matchpairs = "(:),[:],{:},<:>"
let delimitMate_expand_space = 0
let delimitMate_quotes = "\" ' ` *"
au FileType python let b:delimitMate_quotes = "\" `"
au FileType markdown let b:delimitMate_quotes = "\" ` *"
au FileType tex let b:delimitMate_quotes = "'"
au BufRead,BufNewFile *.{txt} let b:delimitMate_quotes = "` \""
let delimitMate_nesting_quotes = ['"','`']
au FileType python let b:delimitMate_nesting_quotes = ['"']
let delimitMate_excluded_ft = "mail,txt"

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
    \ 'ctrl-h': 'split',
      \ 'ctrl-v': 'vsplit' }

      " An action can be a reference to a function that processes selected lines
      function! s:build_quickfix_list(lines)
        call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
	  copen
	    cc
	    endfunction

	    let g:fzf_action = {
	      \ 'ctrl-q': function('s:build_quickfix_list'),
	        \ 'ctrl-t': 'tab split',
		  \ 'ctrl-h': 'split',
		    \ 'ctrl-v': 'vsplit' }

		    " Default fzf layout
		    " - down / up / left / right
		    let g:fzf_layout = { 'down': '~40%' }

		    " You can set up fzf window using a Vim command (Neovim or latest Vim 8 required)
		    let g:fzf_layout = { 'window': 'enew' }
		    let g:fzf_layout = { 'window': '-tabnew' }
		    let g:fzf_layout = { 'window': '20new' }

		    " Customize fzf colors to match your color scheme
		    let g:fzf_colors =
		    \ { 'fg':      ['fg', 'Normal'],
		      \ 'bg':      ['bg', 'Normal'],
		        \ 'hl':      ['fg', 'Comment'],
			  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
			    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
			      \ 'hl+':     ['fg', 'Statement'],
			        \ 'info':    ['fg', 'PreProc'],
				  \ 'border':  ['fg', 'Ignore'],
				    \ 'prompt':  ['fg', 'Conditional'],
				      \ 'pointer': ['fg', 'Exception'],
				        \ 'marker':  ['fg', 'Keyword'],
					  \ 'spinner': ['fg', 'Label'],
					    \ 'header':  ['fg', 'Comment'] }

					    " Enable per-command history.
					    " CTRL-N and CTRL-P will be automatically bound to next-history and
					    " previous-history instead of down and up. If you don't like the change,
					    " explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
					    let g:fzf_history_dir = '~/.local/share/fzf-history'
