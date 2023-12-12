let mapleader = 'Alt'

filetype plugin indent on
syntax on

" Runtime path:
" /usr/share/nvim/runtime

" Plugins

call plug#begin("~/.config/nvim/plugged")

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Syntax highlight
Plug 'scrooloose/nerdtree' " File manager
Plug 'nvim-lualine/lualine.nvim' " Status line thing
Plug 'nvim-tree/nvim-web-devicons' " Needed for barbar
Plug 'romgrk/barbar.nvim' " tab stuf

" Formatting stuff
Plug 'Raimondi/delimitMate' " auto bracket stuff
Plug 'preservim/nerdcommenter' " Mutliline comment
Plug 'sbdchd/neoformat' " Do the format dance
Plug 'lukas-reineke/indent-blankline.nvim' " Add a vertical line on indents

" Provided clipboard support for copy / pasting from clipboard
Plug 'matveyt/neoclip'

" Autocompletion stuff
Plug 'neoclide/coc.nvim', {'branch': 'release'} 

" Rust
"Plug 'neovim/nvim-lspconfig'
"Plug 'fannheyward/coc-rust-analyzer'
"Plug 'simrat39/rust-tools.nvim'

" JS Syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'

" Theme
Plug 'Mofiqul/vscode.nvim'

" Session Manager
Plug 'rmagatti/auto-session'

call plug#end()

" Ignoring file types in nerd tree
let g:NERDTreeIgnore = ['\.class']

let g:coc_node_path = '/home/cbac/.nvm/versions/node/v19.7.0/bin/node'

runtime sets.vim
runtime theme.vim
runtime mappings.vim

" MUST BE BEFORE auto-session load, closes nerdtree on vim exit
autocmd VimLeave * NERDTreeClose

" Disable caps lock when entering normal mode.
function TurnOffCaps()  
    let capsState = matchstr(system('xset -q'), '00: Caps Lock:\s\+\zs\(on\|off\)\ze')
    if capsState == 'on'
        silent! execute ':!xdotool key Caps_Lock'
    endif
endfunction

au CursorHold * call TurnOffCaps()
set updatetime=10

" Helps with documentation show
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" Session Manager
lua require('auto-session').setup()
lua require("ibl").setup({
            \ scope = {
                    \ show_start = false,
                    \ show_end = false
                  \ }
  \ })
lua require('vscode').load("dark")

lua vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

"lua require('rust-tools').setup({})

lua require('nvim-treesitter.configs').setup {
            \ highlight = {
                    \ enable = true,
                    \ disable = {"vim"}
                  \ }
      \ }

lua require('lualine').setup()
