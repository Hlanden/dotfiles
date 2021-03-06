" filetype plugin indent on

" This enables Vim's and noevim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
" syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
" let g:vimtex_view_method = 'zathura'

" Or with a generic interface:
if has('win32') || has('win64')
	if empty(v:servername) && exists('*remote_startserver')
		call remote_startserver('VIM')
	endif
	let g:vimtex_view_general_viewer = 'SumatraPDF'
	let g:vimtex_view_general_options
				\ = '-reuse-instance -forward-search @tex @line @pdf'
	let g:vimtex_view_general_options_latexmk = '-reuse-instance'
else
	let g:vimtex_view_general_viewer = 'okular'
	let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
	" let g:vimtex_view_general_options_latexmk = '--unique'
	let g:vimtex_view_forward_search_on_start = 1
endif
" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
" let g:vimtex_compiler_method = 'latexrun'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","

syntax enable
let g:vimtex_complete_enabled = 1

let g:vimtex_compiler_latexmk = {'build_dir': 'build'}
let g:vimtex_quickfix_open_on_warning = 1

let g:vimtex_text_obj_enabled = 1
let g:vimtex_syntax_conceal_cites = {
			\ 'type': 'brackets',
			\ 'icon': '📖',
			\ 'verbose': v:true,
			\}

" let g:vimtex_toc_config = {'layer_status': {
" 				\'content': 1,
" 				\'label': 0,
" 				\'todo': 0,
" 				\'include': 1 } }
"
let g:vimtex_toc_config = {'layers': ['todo', 'content']}
set conceallevel=0
