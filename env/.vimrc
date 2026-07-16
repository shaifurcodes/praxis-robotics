" ─── Basics ───────────────────────────────────────────
syntax on
filetype plugin indent on
set number relativenumber
"set cursorline
set scrolloff=8
set signcolumn=yes
set updatetime=300

" set termguicolors
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"highlight pythonBuiltin ctermfg=green   guifg=#98c379
"highlight Type          ctermfg=cyan  guifg=#56b6c2
"highlight Identifier    ctermfg=white guifg=#ffffff
"highlight pythonType    ctermfg=cyan  guifg=#56b6c2
"highlight Special       ctermfg=white guifg=#ffffff
"highlight Statement     ctermfg=yellow guifg=#e5c07b
"highlight Visual        ctermbg=238   guibg=#3e4451

" Fix selected/visual mode contrast
" highlight Visual ctermbg=238 guibg=#3e4451

" set notermguicolors
" colorscheme default
" set background=dark

" Python PEP 8 indentation
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" ─── Plugin Manager (vim-plug) ────────────────────────
call plug#begin('~/.vim/plugged')
Plug 'dracula/vim'
Plug 'joshdick/onedark.vim'

" LSP & Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Linting
Plug 'dense-analysis/ale'

" Fuzzy file finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" File tree
Plug 'preservim/nerdtree'

" Git
Plug 'tpope/vim-fugitive'

" Python folding & motion
Plug 'tmhedberg/SimpylFold'
Plug 'jeetsukumaran/vim-pythonsense'

" Better statusline
Plug 'vim-airline/vim-airline'

call plug#end()

" ─── LSP (coc.nvim + pyright) ─────────────────────────
" Run once: :CocInstall coc-pyright

" ─── Linting (ALE + ruff) ─────────────────────────────
let g:ale_linters = {'python': ['ruff']}
let g:ale_fixers  = {'python': ['ruff', 'black']}
let g:ale_fix_on_save = 1

" ─── Keymaps ──────────────────────────────────────────
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :Rg<CR>

let g:ale_cpp_clang_options = '-std=c++17 -Wall'
let g:ale_cpp_clangd_options = '--std=c++17'

" ─── C/C++ completion (coc-clangd) ────────────────────

"inoremap <silent><expr> <Tab>
    \ coc#pum#visible() ? coc#pum#next(1) : '\<Tab>'
"inoremap <silent><expr> <S-Tab>
    \ coc#pum#visible() ? coc#pum#prev(1) : '\<S-Tab>'
"inoremap <silent><expr> <CR>
    \ coc#pum#visible() ? coc#pum#confirm() : '\<CR>'
" Use Tab/Shift-Tab to navigate completion menu

inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"

inoremap <silent><expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" Confirm completion with Enter
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

inoremap <silent><expr> <C-Space> coc#refresh()

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>rn <Plug>(coc-rename)

set updatetime=300
set signcolumn=yes
autocmd CursorHold * silent call CocActionAsync('highlight')
"---------end of C/C++ completion (coc-clanged---------------------


" LSP navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> K  :call CocActionAsync('doHover')<CR>

" Run current Python file in a split terminal
nnoremap <leader>r :botright 10split \| terminal python %<CR>
