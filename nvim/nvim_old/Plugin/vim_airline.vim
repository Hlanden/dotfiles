let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='violet'


" let g:airline#extensions#branch#enabled = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#vimtex#enabled = 0
" let g:airline#extensions#coc#enabled = 0
let g:airline_extensions = ['branch', 'tabline']

let g:airline_section_c = '%t'
