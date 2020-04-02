call plug#begin('$VIM/plugins')

" Make sure you use single quotes

    " NERD Tree
    Plug 'scrooloose/nerdtree'

    " NERD commenter
    Plug 'scrooloose/nerdcommenter'

    " vim-session
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-session'

    "tagbar
    Plug 'majutsushi/tagbar'

    " " MRU
    Plug 'yegappan/mru'

    " SQL Formatting
    Plug 'mattn/vim-sqlfmt'

    " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
    Plug 'junegunn/vim-easy-align'

    " neocomplete.vim
    Plug 'Shougo/neocomplete.vim'

    " ctrlp.vim Vim plugin for Fuzzy file
    " Plug 'kien/ctrlp.vim'

    " vim-bufonly.vim Delete all the buffers except the current buffer
    Plug 'schickling/vim-bufonly'

    " vim-singleton.vim Uses Vim with singleton
    Plug 'thinca/vim-singleton'

    " vim-surround.vim Vim plugin for Improved incremental search
    Plug 'tpope/vim-surround'

    " vim-bookmarks.vim Vim bookmark plugin
    " Plug 'MattesGroeger/vim-bookmarks'

    " quick run Plugin 
    " Plug 'thinca/vim-quickrun'

    "" nerdtree-execute
    Plug 'ivalkeen/nerdtree-execute'

    "" python3 Plugin :automatically formats Python code need Install jedi  Labrary from pip
    Plug 'tell-k/vim-autopep8'

    "" python3 Plugin :Syntax highlighting
    Plug 'vim-python/python-syntax'

    "" lexima Plugin :Auto close parentheses 
    Plug 'cohama/lexima.vim'

    "extended % matching for Many Fromats
    " Plug 'tmhedberg/matchit'
    Plug 'andymass/vim-matchup'

    "A Vim plugin for Windows PowerShell support
    Plug 'PProvost/vim-ps1'

    "improved Javascript indentation and syntax support in Vim
    Plug 'pangloss/vim-javascript'

    "input support in written HTML &CSS 
    Plug 'mattn/emmet-vim'

    "A code-completion engine for Vim
    " Plug 'Valloric/YouCompleteMe'

    " Git Plugin
    " Plug 'tpope/vim-fugitive'

    " A light and configurable statusline/tabline plugin for vim
    Plug 'itchyny/lightline.vim'

    " A dark vim color scheme inspired by Atoms One Dark syntax theme
    Plug 'joshdick/onedark.vim'

    " A project which translate Vim documents into Japanese
    Plug 'vim-jp/vimdoc-ja'

    " incsearch
    Plug 'haya14busa/incsearch.vim'

    " Run Async Shell Commands in Vim 8.0 and Output to Quickfix Window
    Plug 'skywind3000/asyncrun.vim'

    " Markdown Plugins
    " if you don't have nodejs and yarn
    " use pre build
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}


    " fzf Plugin
    Plug 'junegunn/fzf.vim'



    " have nodejs and yarn
    " Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

    " " Syntax checking Plugin
    " Plug 'vim-syntastic/syntastic'

    " PluginのYouCompleteMeと衝突するため、無効化
    " " python3 Plugin : autocompletion need Install jedi Labrary from pip
    " Plug 'davidhalter/jedi-vim'

    " pt.vim Vim plugin for the platinum_search
    Plug 'nazo/pt.vim'

    " visually displaying indent levels in Vim
    Plug 'nathanaelkane/vim-indent-guides'

    " NERD syntax highlighting
    " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    "" dbext.vim
    "Plug 'vim-scripts/dbext.vim'

    "" twig syntax highlighting
    "Plug 'evidens/vim-twig'


    " Git Plugin shows a git diff in the gutter and stages/undoes hunks
    " Plug 'airblade/vim-gitgutter'

    "" NERDTree and Tagbar combined in one windows
    "Plug 'pseewald/nerdtree-tagbar-combined'

    "" Customize statusbar

    "" powerline-extra-symbols
    "Plug 'ryanoasis/powerline-extra-symbols'

    "" grep.vim
    "Plug 'vim-scripts/grep.vim'

    "" python3 Plugin : debug Tool
    "Plug 'joonty/vdebug'

call plug#end()
