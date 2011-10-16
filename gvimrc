colorscheme railscasts2
set columns=120 " wide enough for NERDtree and a code window
set lines=55 " my preferred height
set guifont=Menlo:h13 " my preferred typeface
set transp=5
set guioptions=ce 
"              ||
"              |+-- use simple dialogs rather than pop-ups
"              +  use GUI tabs, not console style tabs
set mousehide " hide the mouse cursor when typing

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
