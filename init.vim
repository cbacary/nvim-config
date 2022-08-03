" Set variables

 let mapleader = 'Alt'



filetype plugin indent on
filetype plugin on
syntax on

" Must go before load Plugins
let g:ale_disable_lsp = 1

" Plugins

call plug#begin("~/.config/nvim/plugged")

Plug 'EdenEast/nightfox.nvim' " Vim-Plug
Plug 'vim-airline/vim-airline-themes' " Theme
Plug 'rakr/vim-one' " Theme
Plug 'scrooloose/nerdtree' " File manager
Plug 'kana/vim-smartinput' " double quoting things and such
Plug 'preservim/nerdcommenter' " Mutliline comment with C-_
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
Plug 'kyazdani42/nvim-web-devicons' "for barbar
Plug 'romgrk/barbar.nvim' "tab stuf

" Rust 
Plug 'fannheyward/coc-rust-analyzer'
Plug 'simrat39/rust-tools.nvim'

call plug#end()

runtime theme.vim
runtime mappings.vim
runtime sets.vim

fu! SaveSess()
    execute 'mksession! ' . getcwd() . '/.session.vim'
endfunction

fu! RestoreSess()
if filereadable(getcwd() . '/.session.vim')
    execute 'so ' . getcwd() . '/.session.vim'
    if bufexists(1)
        for l in range(1, bufnr('$'))
            if bufwinnr(l) == -1
                exec 'sbuffer ' . l
            endif
        endfor
    endif
endif
endfunction

autocmd VimLeave * call SaveSess()
autocmd VimEnter * nested call RestoreSess()
