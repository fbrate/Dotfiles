

execute pathogen#infect()

augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END


" Add configs below
set nocompatible
filetype plugin indent on
set rtp+=~/.vim/bundle/fzf/bin/fzf
syntax enable
set background=dark
colorscheme solarized "NightAutoChange Change this line
set number
set relativenumber
set autoindent
set autoread
set cursorline
set colorcolumn=80
set clipboard+=unnamedplus
set go+=a               " Visual selection automatically copied to the clipboard

"You Complete Me
let g:ycm_use_clangd = 0

"Vim Airline
let g:airline_theme='solarized'
let g:airline_solarized_bg="dark"
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Keymaps
nmap <F2> :FZF<CR>
nmap <F3> :FZF ~<CR>
nmap <F4> :FZF /<CR>
nmap <F8> :TagbarToggle<CR>






"****************************************************************************
"
"
" 			Vim snippets and abbrevations
"
"
"
"****************************************************************************


inoreabbrev sout System.out.println();<ESC>hi<C-R>=Eatchar('\s')<CR>
inoreabbrev jmain public static void main (String [] args ) {<CR>}<ESC>ko<TAB><C-R>=Eatchar('\s')<CR>

nnoremap ,html :-1read $HOME/.vim/.skeletons/htmlTemplate.html<CR>
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O


" Function to eatchar in abbrevations taken from :helptags Eatchar
func Eatchar(pat)
      let c = nr2char(getchar(0))
       return (c =~ a:pat) ? '' : c
endfunc

"*****************************************************************************
"
"
"			fzf - fuzzyfinder config below
"				Default config file from github
"
"
"*****************************************************************************
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
let g:fzf_layout = { 'up': '~20%' }

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
