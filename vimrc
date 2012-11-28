 set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " Optional Bundles
 Bundle 'LaTeX-Box-Team/LaTeX-Box'
 Bundle 'tpope/vim-fugitive'
 Bundle 'tpope/vim-endwise'
 Bundle 'tpope/vim-surround'
 Bundle 'tpope/vim-rails'
 Bundle 'tpope/vim-haml'
 Bundle 'vim-ruby/vim-ruby'
 Bundle 'mileszs/ack.vim'
 Bundle 'kien/ctrlp.vim'
 Bundle 'scrooloose/nerdcommenter'
 Bundle 'scrooloose/nerdtree'
 Bundle 'scrooloose/syntastic'
 Bundle 'ervandew/supertab'
 Bundle 'godlygeek/tabular'
 " Bundle 'tsaleh/vim-align'
 Bundle 'Lokaltog/vim-powerline'
 Bundle 'Lokaltog/vim-easymotion'
 Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
 Bundle 'jnwhiteh/vim-golang'
 Bundle 'chriskempson/vim-tomorrow-theme'

 filetype plugin indent on     " required!
 "
 " Brief help for Vundle
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..


" Reminder -- You can use :scriptnames to see which scripts are executed
" when loading vim.

" Map the leader to something more reasonable.  Also, keep the reverse
" motion command available by mapping it to the old leader key.
let mapleader=","
noremap \ ,

" Basic Settings
set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8

" Ensure powerline settings are loaded properly.  More info: 
"     https://github.com/Lokaltog/vim-powerline
let g:Powerline_symbols = 'fancy'
set encoding=utf-8

" Custom Whitespace Modifiers
set textwidth=78
set backspace=indent,eol,start    " backspace through everything in insert mode

" Show partially typed command sequences.
set showcmd

" Minimal number of lines to always show above/below the caret.
set scrolloff=3

" Set the title when you're in terminal mode
set title

" Statusline.
" %< truncation point
" \ space
" %f relative path to file
" %m modified flag [+] (modified), [-] (unmodifiable) or nothing
" %r readonly flag [RO]
" %y filetype [ruby]
" %= split point for left and right justification
" %-14.( %) block of fixed width 14 characters
" %l current line
" %c current column
" %V current virtual column as -{num} if different from %c
" %P percentage through buffer
set statusline=%#warningmsg#%*%<\ %f\ %m%r%y\ %=%-14.(%l,%c%V%)\ %P\ 

" non-GUI colorschemes
" set background=dark
" colorscheme solarized
" colorscheme darkerdesert
" colorscheme wombat
colorscheme tomorrow-night-bright

" GUI Settings {
if has("gui_macvim")
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

  if has("autocmd")
    " Automatically resize splits when resizing MacVim window
    autocmd VimResized * wincmd =
  endif
endif
" }


if has("autocmd")
  " make and python use real tabs
  au FileType make set noexpandtab
  au FileType python set noexpandtab

  au FileType python set omnifunc=pythoncomplete#Complete
  au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  au FileType html set omnifunc=htmlcomplete#CompleteTags
  au FileType css set omnifunc=csscomplete#CompleteCSS
  au FileType xml set omnifunc=xmlcomplete#CompleteTags
  au FileType php set omnifunc=phpcomplete#CompletePHP
  au FileType c set omnifunc=ccomplete#Complete

  " These files are also Ruby.
  au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,Vagrantfile,Guardfile,config.ru} set ft=ruby

  " These files are also Markdown.
  au BufRead,BufNewFile *.{md,mdown,mkd,mkdn} set ft=markdown

  " Ruby completions
  au FileType ruby,eruby set omnifunc=rubycomplete#Complete
  au FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  au FileType ruby,eruby let g:rubycomplete_rails = 1
  au FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

  " enables ctrl-_ for closing most recently opened tag
  autocmd Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim 

  " Go syntax highlighting
  au BufRead,BufNewFile *.go set filetype=go 
  au! Syntax go source ~/.vim/syntax/go.vim

  " Unbreak 'crontab -e' with Vim: http://drawohara.com/post/6344279/crontab-temp-file-must-be-edited-in-place
  au FileType crontab set nobackup nowritebackup
endif

" Don't use Ex mode, use Q for formatting
map Q gqap

" Center the screen more easily
nmap <space> zz

" Center the screen on searches
nmap n nzz
nmap N Nzz

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
set listchars=nbsp:·,tab:▸\ ,trail:·,eol:¬
set list!

" Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Allow easy opening of files in Marked
:nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>

" OS X only due to use of `open`. Adapted from
" http://vim.wikia.com/wiki/Open_a_web-browser_with_the_URL_in_the_current_line
" Uses John Gruber's URL regexp: http://daringfireball.net/2010/07/improved_regex_for_matching_urls
" ruby << EOF
"   def open_uri
"     re = %r{(?i)\b((?:[a-z][\w-]+:(?:/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}/)(?:[^\s()<>]+|\((?:[^\s()<>]+|(?:\([^\s()<>]+\)))*\))+(?:\((?:[^\s()<>]+|(?:\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))}
" 
"     line = VIM::Buffer.current.line
"     urls = line.scan(re).flatten
" 
"     if urls.empty?
"       VIM::message("No URI found in line.")
"     else
"       system("open", *urls)
"       VIM::message(urls.join(" and "))
"     end
"   end
" EOF
" 
" function! OpenURI()
"   ruby open_uri
" endfunction

" Open URL from this line (OS X only).
" map <leader>w :call OpenURI()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BEGIN stuff from https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
" set t_ti= t_te=

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

" Clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

" Rename current file
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('Rename this file as: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
" map <leader>n :call RenameFile()<cr>

" Promote variable to let for RSpec
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>

" Switch Between Test and Production code
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>

" Map Poppins for formatting markdown files
nmap <leader>fi :%! poppins<CR>

" Shortcut to writing a file as root from non-root vim
cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

" Flush CtrlP Cachce
nnoremap <silent> <leader>P :ClearCtrlPCache<cr>\|:CtrlP<cr>

" Searching options
set incsearch  " search while you're typing the search string
set hlsearch   " highlight search results
set ignorecase " ignore case when searching
set smartcase  " but if we search for big letters, make search case sensitive again

" Correct for common typos and mis-keys
command! Q q       " Bind :Q to :q
command! Qall qall " bind :Qall to :qall

" Move based on screen-viewable lines
"nnoremap k gk 
"nnoremap gk k 
"nnoremap j gj 
"nnoremap gj j

" Repeat last substitution with &
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" TODO: this may not actually be all that useful
" Use very magic for searches by default
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" TODO: add a mapping that allows you to automatically underline with '=' or
" '-' since that's very useful in markdown files.
"
" TODO: considering adding a way to remove trailing whitespace


" TODO: determine if you want to use these...
" " Fix space around equal signs
" map <Leader>= :s/\%V\(\w\)\s*=\s*\(\w\)/\1 = \2/g<CR>

" " Squeeze whitespace (while preserving indentation)
" map <Leader>s :s/\%V\(\S\)\s\+/\1 /g<CR>

" TODO: There's a way to convert dos to unix using something like this
" " Squeeze newlines
" map <Leader>n :s/\n\n\+/\r\r/g<CR>

" " Split hash arguments into separate lines
" map <Leader>h :s/\s*,\s\+/,\r/g<CR>

" " Split statements into separate lines
" map <Leader>, :s/\s*;\s*/\r/g<CR>

