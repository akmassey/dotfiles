set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Baseline Bundles
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-repeat'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-sensible'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'
Bundle 'bling/vim-airline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'vim-scripts/zoom.vim'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'Keithbsmiley/investigate.vim'

" Dash
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'

" Snippets
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "akmassey/vim-snippets"

" HTML / XML related
Bundle 'vim-scripts/closetag.vim'

" Movement / file browsing plugins
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'majutsushi/tagbar'

" Improved terminal vim
Bundle 'sjl/vitality.vim'

" Git related plugins
Bundle 'tpope/vim-fugitive'
" Bundle 'airblade/vim-gitgutter'

" Ruby related plugins
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'thoughtbot/vim-rspec'
Bundle 'vim-scripts/ruby-matchit'

" Markdown related plugins
" Bundle 'plasticboy/vim-markdown'
Bundle 'tpope/vim-markdown'

" Google Go support
Bundle 'jnwhiteh/vim-golang'

" Bundled colorschemes
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'therubymug/vim-pyte'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-vividchalk'
Bundle 'dsolstad/vim-wombat256i'
Bundle 'tomasr/molokai'
Bundle 'nanotech/jellybeans.vim'
Bundle 'akmassey/vim-codeschool'
Bundle 'twerth/ir_black'
Bundle 'jnurmine/Zenburn'
Bundle 'rainux/vim-desert-warm-256'


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

" Use a single location for temporary files and swap files.
set backupdir=~/.vim-backup,/tmp
set directory=~/.vim-swapfiles,/tmp

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
"
" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
"
" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
"
" Disable temp and backup files
set wildignore+=*.swp,*~,._*

" Ensure airline fonts are loaded properly.  More info:
"     https://github.com/bling/vim-airline
let g:airline_powerline_fonts = 1

" Custom Whitespace Modifiers
set textwidth=78
set backspace=indent,eol,start    " backspace through everything in insert mode
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs

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
" colorscheme tomorrow-night-bright
colorscheme jellybeans

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

  " Setup keybindings for NERDCommenter
  map <D-/> <plug>NERDCommenterToggle<CR>
  imap <D-/> <plug>NERDCommenterToggle<CR>i

  " Stop the annoying bell
  set vb

  if has("autocmd")
    " Automatically resize splits when resizing MacVim window
    autocmd VimResized * wincmd =
  endif

  source ~/.gvimrc
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

  " " enables ctrl-_ for closing most recently opened tag
  " autocmd Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim

  " Go syntax highlighting and formatting
  au BufRead,BufNewFile *.go set filetype=go
  au BufWritePost *.go :silent Fmt

  " Unbreak 'crontab -e' with Vim: http://drawohara.com/post/6344279/crontab-temp-file-must-be-edited-in-place
  au FileType crontab set nobackup nowritebackup

  " Use flowed text in email
  au FileType mail setlocal fo+=aw
  au FileType mail set spell

  " Ensure spell checking is enabled for LaTeX
  au FileType plaintex,context,tex,latex set spell
endif

" Don't use Ex mode, use Q for formatting
map Q gqap

" Center the screen more easily
nmap <space> zz

" Center the screen on searches
nmap n nzz
nmap N Nzz

" Toggle spell checking on and off with `,s`
nmap <silent> <Leader>5 :set spell!<CR>

set spelllang=en_us

" NERDCommenter for non-gui setup
map <Leader>/ <plug>NERDCommenterToggle<CR>
let NERDSpaceDelims=1

" Create a default build mapping
map <Leader>b :w<CR>:!./build<CR>

" vim-rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
let g:rspec_command="!rspec -fp {spec}"

" Shortcut to toggle invisibles
nmap <Leader>i :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=nbsp:·,tab:▸\ ,trail:·,eol:¬
set list!

" Use context-based completion in SuperTab
if has("autocmd")
  autocmd FileType *
    \ if &omnifunc != '' |
    \   call SuperTabChain(&omnifunc, "<c-p>") |
    \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
    \ endif
endif
" Don't compelete at the start of a line or after whitespace
let g:SuperTabNoCompleteAfter = ['^', ',', ';', '\s']

" Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Allow easy opening of files in Marked
:nnoremap <Leader>m :silent !open -a Marked.app '%:p'<cr>

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
" map <Leader>w :call OpenURI()<CR>

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
nnoremap <CR> :nohlsearch<cr>

" Enter a blank line above and below without entering insert mode
nnoremap <S-Enter> O<Esc>jo<Esc>
" Same as above, but reflow the line
nnoremap <C-Enter> O<Esc>jo<Esc>kgqap

" A command to preserve last search and cursor position after running another
" command.  See: http://vimcasts.org/episodes/tidying-whitespace/
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
" Strip trailing whitespace
nmap <Leader>$ :call Preserve("%s/\\s\\+$//e")<CR>
" Reformat the document
nmap <Leader>= :call Preserve("normal gg=G")<CR>

" Filter Markdown
map <Leader>7 :call Preserve("%!poppins")<CR>


" Toggle NERDTree and Tagbar
map <Leader>8 :NERDTreeToggle<CR>
map <Leader>9 :TagbarToggle<CR>

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
map <Leader>n :call RenameFile()<cr>

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
command! Q q       " bind :Q to :q
command! W w       " bind :W to :w
command! Qall qall " bind :Qall to :qall
command! Qq qall   " bind :qq to :qall
command! Wqq wqall " bind :wqq to :qall

" Move based on screen-viewable lines
nnoremap <Up> gk
nnoremap <Down> gj

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

" TODO: determine if you want to use these...
" " Fix space around equal signs
" map <Leader>= :s/\%V\(\w\)\s*=\s*\(\w\)/\1 = \2/g<CR>

" " Squeeze whitespace (while preserving indentation)
" map <Leader>s :s/\%V\(\S\)\s\+/\1 /g<CR>

" Delete blank lines
nnoremap <Leader>3 :call Preserve("g/^$/d")<CR>
vnoremap <Leader>3 :call Preserve("g/^$/d")<CR>

" Convert single spaces after a sentence to double spaces.
map <Leader>6 :call Preserve("%s/\\.\\s\\([A-Z]\\)/\\.  \\1/g")<CR>

" Squeeze newlines.
map <Leader>4 :call Preserve("%s/\\n\\n\\+/\\r\\r/g")<CR>

" " Split hash arguments into separate lines
" map <Leader>h :s/\s*,\s\+/,\r/g<CR>

" " Split statements into separate lines
" map <Leader>, :s/\s*;\s*/\r/g<CR>

" start NERDTree when opening vim
if (has("autocmd") && !(&ft=='mail'))
  autocmd VimEnter * NERDTree
  autocmd BufEnter * NERDTreeMirror
  autocmd VimEnter * wincmd w
endif

" Convert DOS-style carriage returns to UNIX-style
map <Leader>d :call Preserve("%s/\\r/\\r/g")<CR>

" requires the par program
" see: http://vimcasts.org/episodes/formatting-text-with-par/
" set formatprg=par\ -w78
" restore the default behavior
set formatprg=""

" Use Silver Searcher instead of grep
set grepprg=ag

" Ignore some LaTeX things in NERDTree
let NERDTreeIgnore = ['\.acn$', '\.acr$', '\.alg$', '\.aux$', '\.bbl$', '\.blg$', '\.dvi$', '\.fdb_latexmk$', '\.glg$', '\.glo$', '\.gls$', '\.idx$', '\.ilg$', '\.ind$', '\.ist$', '\.lof$', '\.log$', '\.lot$', '\.maf$', '\.mtc$', '\.mtc0$', '\.nav$', '\.nlo$', '\.out$', '\.pdfsync$', '\.ps$', '\.snm$', '\.synctex.gz$', '\.toc$', '\.vrb$', '\.xdy$', '\.tdo$', '\.make$', '\.temp$', '\.d$', '\.fls$', '\.run\.xml$', '\.bcf$' ]


" gotags configuration for Tagbar
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


" investigate.vim configuration
let g:investigate_use_dash=1
nnoremap <leader>K :call investigate#Investigate()<CR>

" Running one-off scripts...
"
" See this post for more information: http://www.oinksoft.com/blog/view/6/
let ft_stdout_mappings = {
      \'applescript': 'osascript',
      \'bash': 'bash',
      \'bc': 'bc',
      \'haskell': 'runghc',
      \'javascript': 'node',
      \'lisp': 'sbcl',
      \'nodejs': 'node',
      \'ocaml': 'ocaml',
      \'perl': 'perl',
      \'php': 'php',
      \'python': 'python',
      \'ruby': 'ruby',
      \'scheme': 'scheme',
      \'sh': 'sh',
      \'sml': 'sml',
      \'spice': 'ngspice'
      \}

for ft_name in keys(ft_stdout_mappings)
  execute 'autocmd Filetype ' . ft_name . ' nnoremap <buffer> <Leader>y :write !'
        \. ft_stdout_mappings[ft_name] . '<CR>'
endfor

let ft_execute_mappings = {
      \'c': 'gcc -o %:r -Wall -std=c99 % && ./%:r',
      \'erlang': 'escript %',
      \'pascal': 'fpc % && ./%:r'
      \}

for ft_name in keys(ft_execute_mappings)
  execute 'autocmd FileType ' . ft_name
        \. ' nnoremap <buffer> <Leader>y :write \| !'
        \. ft_execute_mappings[ft_name] . '<CR>'
endfor

