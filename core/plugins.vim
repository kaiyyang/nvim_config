" Plugin specification and lua stuff
lua require('plugins')


" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

let g:tex_flavor='latex' "Default tex file format
let g:vimtex_view_method = 'skim' " Choose which program to use to view PDF file 
let g:vimtex_view_skim_sync = 1 " Value 1 allows forward search after every successful compilation
let g:vimtex_view_skim_activate = 1 " Value 1 allows change focus to skim after command `:VimtexView` is given

" auto clear the jump lists
autocmd VimEnter * :clearjumps
