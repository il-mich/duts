syntax enable																    " Syntax highlighting on
set encoding=UTF-8															    " Specify encoding

set number                                                                      " Show line numbers
set wrap                                                                        " Wrap lines
set linebreak                                                                   " Break lines at word (requires Wrap lines)
set showmatch                                                                   " Highlight matching brace

set smartcase                                                                   " Enable smart-case search
set ignorecase                                                                  " Always case-insensitive
set incsearch                                                                   " Searches for strings incrementally
set hlsearch                                                                    " Highlight search results

set autoindent                                                                  " Auto-indent new lines
set cindent                                                                     " Use 'C' style program indenting
set smartindent                                                                 " Enable smart-indent
set smarttab                                                                    " Enable smart-tabs
set shiftwidth=4                                                                " Number of auto-indent spaces
set tabstop=4                                                                   " Number of spaces per Tab
set softtabstop=4                                                               " See multiple spaces as tabstops so <BS> does the right thing
set expandtab                                                                   " Change tab to four spaces

set ruler                                                                       " Show row and column ruler information
set autochdir                                                                   " Change working directory to open buffer

set undolevels=1000	                                                            " Number of undo levels
set backspace=indent,eol,start	                                                " Backspace behaviour

set wildmenu                                                                    " Enable suggestions menu
set wildmode=list:longest,full                                                  " Enable suggestions on tab-completions
set mouse=a	                                                                    " Select suggestions by clicking

set clipboard=unnamed                                                           " Copy to clipboard
set nocompatible                                                                " Disable compatibility to old-time vi
filetype plugin indent on                                                       " Allows auto-indenting depending on file type

" Vertical split bar configuration
set fillchars+=vert:\│                                                          " tmux-like separator without color
hi VertSplit cterm=NONE

" Bottom bar
set laststatus=2                                                                " enable bottom bar
" vim-plug section
call plug#begin('~/.vim/plugged')
    " Editor structure
    Plug 'neoclide/coc.nvim', {'branch': 'release'}                             " Conquer of Completion
    Plug 'scrooloose/nerdtree'                                                  " Nerdtree folder manager
    Plug 'ryanoasis/vim-devicons'                                               " Language icons for Nerdtree
    Plug 'Xuyuanp/nerdtree-git-plugin'                                          " Git integration in Nerdtree
    Plug 'airblade/vim-gitgutter'                                               " Git integration in Vim
    " Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }   " In browser Md preview
    Plug 'junegunn/goyo.vim'                                                    " Zen mode for Vim

    " Language support
    " Plug 'plasticboy/vim-markdown'
    " Plug 'derekwyatt/vim-scala'
    " Plug 'rust-lang/rust.vim'

call plug#end()

" CoC configuration

set cmdheight=2	" Better display for messages

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"inoremap <silent><expr> <S-TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<S-TAB>" :
"      \ coc#refresh()
"inoremap <expr><TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" CoC configuration end

" Remove trailing whitespace on write
autocmd BufWritePre * %s/\s\+$//e

" Markdown configuration
"let g:vim_markdown_math = 1
"let g:vim_markdown_folding_disabled = 1

" Scala
"au BufRead,BufNewFile *.sbt set filetype=scala
" Metals specific commands
" Start Metals Doctor
"command! -nargs=0 MetalsDoctor :call CocRequestAsync('metals', 'workspace/executeCommand', { 'command': 'doctor-run' })
" Manually start build import
"command! -nargs=0 MetalsImport :call CocRequestAsync('metals', 'workspace/executeCommand', { 'command': 'build-import' })
" Manually connect with the build server
"command! -nargs=0 MetalsConnect :call CocRequestAsync('metals', 'workspace/executeCommand', { 'command': 'build-connect' })

" AspectJ
au BufNewFile,BufRead *.aj, setf aj
