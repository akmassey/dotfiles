" Reminder -- You can use :scriptnames to see which scripts are executed
" when loading vim.

" Map the leader to something more reasonable
let mapleader=","

" Custom Whitespace Modifiers
set textwidth=76

" non-GUI colorschemes
set background=dark
colorscheme solarized
" colorscheme blackboard
" colorscheme darkerdesert
" colorscheme wombat
" colorscheme railscasts256

" GUI Settings {
if has("gui_macvim")
  " Basics {
    set background=light
    colorscheme solarized
    set columns=120 " wide enough for NERDtree and a code window
    set lines=55 " my preferred height 
    set guifont=Menlo:h14 " my preferred typeface
    set transp=5
    set guioptions=ce 
    "              ||
    "              |+-- use simple dialogs rather than pop-ups
    "              +  use GUI tabs, not console style tabs
    set mousehide " hide the mouse cursor when typing
  " }

  " Emulate TextMate's shift left/right key commands (only works in MacVim)
  nmap <D-[> <<
  nmap <D-]> >>
  vmap <D-[> <gv
  vmap <D-]> >gv

  " Emulate Firefox tab movement using the Command key
  map <D-S-]> gt
  map <D-S-[> gT
  map <D-1> 1gt
  map <D-2> 2gt
  map <D-3> 3gt
  map <D-4> 4gt
  map <D-5> 5gt
  map <D-6> 6gt
  map <D-7> 7gt
  map <D-8> 8gt
  map <D-9> 9gt
  map <D-0> :tablast<CR>

  " Stop the annoying bell
  set vb

endif
" }


if has("autocmd")
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  autocmd FileType c set omnifunc=ccomplete#Complete

  " Ruby completions
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

  " enables ctrl-_ for closing most recently opened tag
  autocmd Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim 

  " Go syntax highlighting
  au BufRead,BufNewFile *.go set filetype=go 
  au! Syntax go source ~/.vim/syntax/go.vim
endif

map Q gqap
map <f6> :!ispell %:e %
:noremap <silent> <F8> :Tlist<CR>

" NERDtree mappings
"function OpenNERDTree()
  "execute ":NERDTree"
"endfunction
"command -nargs=0 OpenNERDTree :call OpenNERDTree()

"nmap <ESC>t :OpenNERDTree<CR>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Allow easy opening of files in Marked
:nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>
