" defaults, tabs/indents are all 2 spaces
" if you can toggle et/noet in the editor, then :retab to change existing
" tabs. woot!
set tabstop=2       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=2    " Indents will have a width of 4
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

" python, flake8/pep requires tabs/indents as 4 spaces across the board
autocmd FileType python setlocal sw=4 sts=4 ts=4 et
" makefiles
autocmd FileType make set noexpandtab
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
