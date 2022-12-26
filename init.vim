let mapleader = 'Alt'

filetype plugin indent on
syntax on

" Must go before load Plugins
let g:ale_disable_lsp = 1

" For some reason my runtime path is in the following location
" /usr/share/nvim/runtime

" Plugins

call plug#begin("~/.config/nvim/plugged")

Plug 'EdenEast/nightfox.nvim' " Vim-Plug
Plug 'vim-airline/vim-airline-themes' " Theme
Plug 'rakr/vim-one' " Theme
Plug 'scrooloose/nerdtree' " File manager
Plug 'Raimondi/delimitMate' " auto closer for brackets
Plug 'preservim/nerdcommenter' " Mutliline comment with C-_
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
Plug 'kyazdani42/nvim-web-devicons' "for barbar
Plug 'romgrk/barbar.nvim' "tab stuf
Plug 'sbdchd/neoformat'

" Rust 
Plug 'neovim/nvim-lspconfig'
Plug 'fannheyward/coc-rust-analyzer'
Plug 'simrat39/rust-tools.nvim'

"Plug 'davidhalter/jedi-vim'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'zchee/deoplete-jedi'

" C++
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'vim-syntastic/syntastic'
Plug 'deoplete-plugins/deoplete-clang'

" Theme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'Mofiqul/vscode.nvim'

" Session Manager
Plug 'rmagatti/auto-session'

call plug#end()

runtime theme.vim
runtime mappings.vim
runtime sets.vim

"let g:deoplete#enable_at_startup = 1
"autocmd FileType .py call deoplete#enable()

" C++ Syntax
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

let g:syntastic_cpp_checkers = ['cpplint']
let g:syntastic_c_checkers = ['cpplint']
let g:syntastic_cpp_cpplint_exec = 'cpplint'

" The following two lines are optional. Configure it to your liking!
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Session Manager
lua require('auto-session').setup()

lua require('vscodetheme')

"fu! SaveSess()
    "execute 'mksession! ' . getcwd() . '/.session.vim'
"endfunction

"fu! RestoreSess()
"if filereadable(getcwd() . '/.session.vim')
    "execute 'so ' . getcwd() . '/.session.vim'
    "if bufexists(1)
        "for l in range(1, bufnr('$'))
            "if bufwinnr(l) == -1
                "exec 'sbuffer ' . l
            "endif
        "endfor
    "endif
"endif
"endfunction

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


" Session management
"autocmd VimLeave * call SaveSess()
"autocmd VimEnter * nested call RestoreSess()

lua vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"


lua require('rust-tools').setup({})
