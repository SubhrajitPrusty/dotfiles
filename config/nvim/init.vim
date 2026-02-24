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

" LSP, Mason, CMP
Plug 'mason-org/mason.nvim'
Plug 'mason-org/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'L3MON4D3/LuaSnip'                " Snippet engine
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'mfussenegger/nvim-dap'

" Python extras
Plug 'mfussenegger/nvim-dap-python'   " Optional: Debugger
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" UI Enhancements
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvimdev/dashboard-nvim'
Plug 'ray-x/guihua.lua'          " UI for go.nvim
Plug 'stevearc/dressing.nvim'  " required by avante
Plug 'MunifTanjim/nui.nvim'    " required by avante
Plug 'MeanderingProgrammer/render-markdown.nvim' " required by avante
Plug 'HakonHarnes/img-clip.nvim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'lewis6991/gitsigns.nvim'
Plug 'NeogitOrg/neogit'
Plug 'sindrets/diffview.nvim'

" UX
Plug 'preservim/tagbar' " tags support
Plug 'numToStr/Comment.nvim'
Plug 'folke/which-key.nvim'
Plug 'vim-airline/vim-airline' " Status Line
Plug 'vim-airline/vim-airline-themes'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' } " Theme
Plug 'norcalli/nvim-colorizer.lua'
Plug 'rmagatti/auto-session'
Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': 'make', 'source': 'true' }
Plug 'supermaven-inc/supermaven-nvim' " Avante alternative
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'zbirenbaum/copilot.lua'
Plug 'ray-x/guihua.lua'
Plug 'ahmedkhalf/project.nvim'

" Misc
Plug 'epwalsh/obsidian.nvim'
Plug 'allaman/emoji.nvim'

" Conflicting
" Plug 'ray-x/navigator.lua'       " LSP + navigation

call plug#end()

" Lua
lua require('init')

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

" conceallevel | required by obsidian
set conceallevel=1

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

if has("unnamedplus")
    set clipboard+=unnamedplus
else
    set clipboard+=unnamed
endif

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
" set showcmd  " Show (partial) command in status line.
" set incsearch  " Incremental search
set autowrite  " Automatically save before commands like :next and :make
set hidden  " Hide buffers when they are abandoned
"set mouse=

" setting horizontal and vertical splits
set splitbelow
set splitright

" Enable folding
" set foldmethod=indent
" set foldlevel=99

" Mouse
" set mouse=a  " Enable mouse usage (all modes)
if !has('nvim')
    set ttymouse=xterm2
endif

" Purge orphaned sessions when starting up
" autocmd VimEnter * SessionPurgeOrphaned

" Setting up indendation
" au BufNewFile, BufRead *.py
"     \ set tabstop=4 |
"     \ set softtabstop=4 |
"     \ set shiftwidth=4 |
"     \ set textwidth=79 |
"     \ set expandtab |
"     \ set autoindent |
"     \ set fileformat=unix
"     " setting up pyflakes
"     " \let python_highlight_all=1
"
au BufNewFile, BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

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
let g:airline_section_y = ''
let g:airline_section_z = '%p%% %l:%c'

" Themes
colorscheme catppuccin-frappe " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

" autosave buffers
set autowriteall

""" MarkdownPreview
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
