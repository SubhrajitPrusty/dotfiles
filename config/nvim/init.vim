" Python setup for nvim
" let g:python3_host_prog = '/usr/bin/python3'
let g:python3_host_prog = '/home/subhrajit/.pyenv/versions/3.10.6/bin/python3'


" Plugins

call plug#begin('~/.vim/plugged')
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'fatih/vim-go'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'
" Plug 'ray-x/go.nvim'
Plug 'ray-x/guihua.lua' " floating window support

Plug 'preservim/tagbar'
Plug 'davidhalter/jedi-vim'
Plug 'nvie/vim-flake8'
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'mrk21/yaml-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'farmergreg/vim-lastplace'
Plug 'vim-vdebug/vdebug'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ycm-core/YouCompleteMe'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'norcalli/nvim-colorizer.lua'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'andythigpen/nvim-coverage'
Plug 'antoinemadec/FixCursorHold.nvim'
" Plug 'nvim-neotest/neotest'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'folke/neodev.nvim'
Plug 'puremourning/vimspector'


" Plug 'zxqfl/tabnine-vim'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copied from http://nerditya.com/code/guide-to-neovim/ "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Map the leader key to SPACE
let mapleader="\\"


set showmatch           " Show matching brackets.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=4           " Render TABs using this many spaces.
set shiftwidth=4        " Indentation amount for < and > commands.

set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
    set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
    set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
" set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
" highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
" match ExtraWhitespace /\s\+$\|\t/

set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

if has("unnamedplus")
    set clipboard+=unnamedplus
else
    set clipboard+=unnamed
endif


" Search and Replace
nmap <Leader>s :%s//g<Left><Left>

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

" Use ; for commands.
nnoremap ; :
" Use Q to execute default register.
nnoremap Q @q

"""""""""""""""""""""
" End of copy       "
"""""""""""""""""""""

" From old vimrc

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
" set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
" if has("autocmd")
"   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd  " Show (partial) command in status line.
" set incsearch  " Incremental search
set autowrite  " Automatically save before commands like :next and :make
set hidden  " Hide buffers when they are abandoned
"set mouse=

" setting horizontal and vertical splits
set splitbelow
set splitright

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Mouse
" set mouse=a  " Enable mouse usage (all modes)
if !has('nvim')
    set ttymouse=xterm2
endif



" Setting up indendation

au BufNewFile, BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
    " setting up pyflakes
    \let python_highlight_all=1

au BufNewFile, BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Lua
lua require('mysetup')

" Setting terminal colors
" This will make vim's theme different than terminal theme
" This is required for coloring hex codes
set termguicolors
lua require('colorizer').setup()

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'zenburn'
let g:airline#extensions#tagbar#flags = 'f'

" Themes
colorscheme catppuccin-frappe " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

" Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({hidden = true})<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Fugitive / Git
" Git blame current line / file
nnoremap <leader>gb :Git blame<cr>
nnoremap <leader>gcp :term git commit -p<cr>i

" NerdTree
" Toggle file browser
" nnoremap <leader>n :NERDTreeToggle %<cr>
nnoremap <leader>n <cmd>lua NERDTreeToggleInCurDir()<cr>

" -----

" Vim-Go options
au BufNewFile,BufRead *.go nnoremap <buffer> <leader>d :GoDef<cr>
au BufNewFile,BufRead *.go nnoremap <buffer> <leader>r :GoReferrers<cr>
au BufNewFile,BufRead *.go nnoremap <buffer> <leader>t :GoDefType<cr>
au BufNewFile,BufRead *.go nnoremap <buffer> <f7> :GoFmt<cr>
au BufNewFile,BufRead *.go nnoremap <buffer> <f8> :GoBuild<cr>


" Dont use default mappings
let g:go_def_mapping_enabled = 0
" Go def will use the same buffer, if open
let g:go_def_reuse_buffer=1
" Go def for type will create a split window
let g:go_def_type_split=1
" Go def will create a split window
let g:go_def_split=1
" Highlight types differently
let g:go_highlight_types=1
" doc in a popup
let g:go_doc_popup_window=1

" " go.nvim options
" lua <<EOF
" local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
" vim.api.nvim_create_autocmd("BufWritePre", {
"   pattern = "*.go",
"   callback = function()
"    require('go.format').goimport()
"   end,
"   group = format_sync_grp,
" })
" 
" EOF
"
" lua require('go').setup()



" Buffers
" Switch to next buffer
nnoremap <C-PageDown> :bn<cr>
" Switch to previous buffer
nnoremap <C-PageUp> :bp<cr>
" Close current buffer
nnoremap <A-d> :bd!<cr>


" autosave buffers
set autowriteall
autocmd BufLeave,FocusLost * wall
" when you enter a buffer, make the current dir the working dir
" this is not good, since it telescope's working dir also changes
" autocmd BufEnter * lcd %:p:h


" YouCompleteMe
set completeopt=menuone

" Jedi Python
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>t"
let g:jedi#goto_stubs_command = "<leader>s"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>r"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>n"
let g:jedi#rename_command_keep_name = "<leader>N"


" File History
nnoremap <C-H> :History<cr>

" Uses $HOME/bin/git-browse command
" Will xdg-open the url
command! -range Gbrowse execute 'silent ! git browse ' . expand('%') . ' ' . <line1> . ' ' . <line2> | checktime | redraw!

" vimspector / debugging
let g:vimspector_install_gadgets = [ 'debugpy', 'delve' ]

let g:vimspector_enable_mappings = 'HUMAN'
" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

" MarkdownPreview
" set to 1, nvim will open the preview window after entering the Markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when changing
" from Markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, Vim will refresh Markdown when saving the buffer or
" when leaving insert mode. Default 0 is auto-refresh Markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" tags
" GOLANG tagging

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

" YAML tagging
let g:tagbar_type_yaml = {
    \ 'ctagstype' : 'yaml',
    \ 'kinds' : [
        \ 'a:anchors',
        \ 's:section',
        \ 'e:entry'
    \ ],
  \ 'sro' : '.',
    \ 'scope2kind': {
      \ 'section': 's',
      \ 'entry': 'e'
    \ },
    \ 'kind2scope': {
      \ 's': 'section',
      \ 'e': 'entry'
    \ },
    \ 'sort' : 0
    \ }

" JSON
let g:tagbar_type_json = {
    \ 'ctagstype' : 'json',
    \ 'kinds' : [
      \ 'o:objects',
      \ 'a:arrays',
      \ 'n:numbers',
      \ 's:strings',
      \ 'b:booleans',
      \ 'z:nulls'
    \ ],
  \ 'sro' : '.',
    \ 'scope2kind': {
    \ 'object': 'o',
      \ 'array': 'a',
      \ 'number': 'n',
      \ 'string': 's',
      \ 'boolean': 'b',
      \ 'null': 'z'
    \ },
    \ 'kind2scope': {
    \ 'o': 'object',
      \ 'a': 'array',
      \ 'n': 'number',
      \ 's': 'string',
      \ 'b': 'boolean',
      \ 'z': 'null'
    \ },
    \ 'sort' : 0
    \ }
