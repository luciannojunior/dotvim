" vim: set foldmethod=marker foldlevel=0:

call plug#begin('~/.vim/plugged')

""" Section: Packages {{{1

Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'lucasecdb/vim-codedark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jparise/vim-graphql'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'chaoren/vim-wordmotion'
Plug 'alvan/vim-closetag'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'lucasecdb/vim-tsx'
Plug 'posva/vim-vue'

" Clojure
Plug 'bhurlow/vim-parinfer'
Plug 'tpope/vim-fireplace'

" Go
Plug 'fatih/vim-go'

call plug#end()

""" }}}1
""" Section: Options {{{1

set langmenu=en_US
let $LANG='en_US'
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set foldmethod=indent
set foldopen+=jump
set foldlevel=99
set number relativenumber
set backspace=indent,eol,start
set clipboard=unnamedplus
set scrolloff=3
set laststatus=2
set splitbelow
set splitright
set cursorline
set mouse=a
set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf
set completeopt+=noinsert

""" }}}1
""" Section: Mappings {{{1

let mapleader=' '

inoremap jk <ESC>
inoremap JK <ESC>

inoremap <ESC> <Nop>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Window switching
nnoremap <silent> <c-h> <c-w>h
nnoremap <silent> <c-j> <c-w>j
nnoremap <silent> <c-k> <c-w>k
nnoremap <silent> <c-l> <c-w>l

" Buffer switching
nnoremap <silent> <s-l> :bnext<cr>
nnoremap <silent> <s-h> :bprevious<cr>

" Misc
nnoremap <silent> <leader>, :set nohls<cr>
nnoremap <silent> <leader>q :q<cr>
nnoremap <silent> <leader>e :ALEFix prettier<cr>
nnoremap <silent> <leader>h :set hidden <bar> close<cr>
nmap <c-_> <Plug>CommentaryLine
vmap <c-_> <Plug>Commentary

" Fugitive
nnoremap <silent> <leader>c :Gcommit<cr>
nnoremap <silent> <leader>s :Gstatus<cr>
nnoremap <leader>p :Gpush<cr>

" Fuzzy finder
nnoremap <TAB> :GFiles && git ls-files -o --exclude-standard<cr>

command! WQ wq
command! Wq wq
command! W w
command! Q q

" Customizing wordmotion
nmap cw ce
let g:wordmotion_mappings = {
\ 'e' : 'm',
\ 'de' : 'dm',
\ }

""" }}}1
""" Section: Plugins options {{{1

let g:airline_powerline_fonts=1
let g:airline_theme='codedark'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:javascript_plugin_jsdoc = 1


let g:ale_linters = {
\  'python': ['flake8'],
\  'typescript': ['tslint', 'tsserver'],
\  'javascript': ['eslint', 'flow'],
\  'graphql': ['gqlint']
\}

let g:ale_completion_enabled = 1
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_save = 1
" let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 0
nmap <silent> <Leader>i <Plug>(ale_detail)
nmap <silent> <Leader>l <Plug>(ale_lint)
nmap <silent> <Leader>j <Plug>(ale_next_wrap)
nmap <silent> <Leader>k <Plug>(ale_previous_wrap)
nmap <silent> <Leader>h <Plug>(ale_hover) 
nmap <silent> <Leader>d <Plug>(ale_go_to_definition) 
nmap <silent> <Leader>r <Plug>(ale_find_references) 
nmap <silent> <Leader>s :call AleSymbolSearch()<CR>
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.vue'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,vue'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,vue'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'
"""}}}
""" Section: Functions {{{1

function! CheckTermAndDisableNumber()
  if &buftype ==# "terminal"
    setlocal nonumber norelativenumber
  endif
endfunc

"""}}}1
""" Section: Autocommands {{{1

if has('autocmd')
  filetype indent plugin on

  augroup FTCheck
    autocmd!
    autocmd BufRead,BufNewFile *.nginx,*/etc/nginx/*,*/usr/local/nginx/conf/*,nginx.conf set ft=nginx
    autocmd BufRead,BufNewFile *.tsx set ft=typescript.tsx
    autocmd BufRead,BufNewFile *.js set ft=javascript.jsx
  augroup END
  augroup FTOptions
    autocmd!
    autocmd FileType gitcommit setlocal spell
    autocmd FileType python let b:ale_fixers=['autopep8']
    autocmd FileType javascript let b:ale_fixers=['eslint', 'prettier']
    autocmd FileType nginx setlocal indentexpr= |
          \ setlocal cindent |
          \ setlocal cinkeys-=0#
    autocmd FileType cs setlocal shiftwidth=4 |
          \ setlocal softtabstop=4
  augroup END
  if has('nvim')
    augroup Term
      autocmd!
      autocmd TermOpen * :call CheckTermAndDisableNumber()
      autocmd WinLeave * :call CheckTermAndDisableNumber()
      autocmd WinEnter * :call CheckTermAndDisableNumber()
      autocmd BufEnter * :call CheckTermAndDisableNumber()
      autocmd BufLeave * :call CheckTermAndDisableNumber()
    augroup END
  endif
endif

"""}}}1
""" Section: Visual {{{1

if has('syntax')
  if !has('syntax_on') && !exists('syntax_manual')
    syntax on
  endif

  if has('gui')
    set linespace=3
    set guioptions-=r
    set guioptions-=L
  endif

  set termguicolors
  set background=dark
  colorscheme codedark
endif

"""}}}1

