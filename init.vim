let mapleader = 'Alt'

filetype plugin indent on
syntax on

" For some reason my runtime path is in the following location
" /usr/share/nvim/runtime

" Plugins

call plug#begin("~/.config/nvim/plugged")

Plug 'scrooloose/nerdtree' " File manager
Plug 'Raimondi/delimitMate' " auto closer for brackets
Plug 'preservim/nerdcommenter' " Mutliline comment with C-_
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
Plug 'kyazdani42/nvim-web-devicons' "for barbar
Plug 'romgrk/barbar.nvim' "tab stuf
Plug 'sbdchd/neoformat'
Plug 'lukas-reineke/indent-blankline.nvim'

" Provided clipboard support for copy / pasting from clipboard
Plug 'matveyt/neoclip'

" Rust 
Plug 'neovim/nvim-lspconfig'
Plug 'fannheyward/coc-rust-analyzer'
Plug 'simrat39/rust-tools.nvim'

"For Js linting and formatting
Plug 'prettier/vim-prettier', {'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']}

" JS Syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

" C++
"Plug 'jackguo380/vim-lsp-cxx-highlight'
"Plug 'dense-analysis/ale'

" Theme
Plug 'Mofiqul/vscode.nvim'

" Session Manager
Plug 'rmagatti/auto-session'

call plug#end()

let g:coc_node_path = '/home/cbac/.nvm/versions/node/v19.7.0/bin/node'

runtime theme.vim
runtime mappings.vim
runtime sets.vim

"" C++ Syntax
"let g:cpp_class_scope_highlight = 1
"let g:cpp_member_variable_highlight = 1
"let g:cpp_class_decl_highlight = 1

"let g:syntastic_cpp_checkers = ['cpplint']
"let g:syntastic_c_checkers = ['cpplint']
"let g:syntastic_cpp_cpplint_exec = 'cpplint'

" The following two lines are optional. Configure it to your liking!
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"let g:python_highlight_all = 1

let g:prettier#autoformat = 0

" Session Manager
lua require('auto-session').setup()

lua require('vscode').load("dark")

" Disable caps lock when entering normal mode.
function TurnOffCaps()  
    let capsState = matchstr(system('xset -q'), '00: Caps Lock:\s\+\zs\(on\|off\)\ze')
    if capsState == 'on'
        silent! execute ':!xdotool key Caps_Lock'
    endif
endfunction

au CursorHold * call TurnOffCaps()
set updatetime=10

" Closes vim tree on leave
autocmd VimLeave * NERDTreeClose

" Helps with documentation show
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

lua vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

lua require('rust-tools').setup({})
