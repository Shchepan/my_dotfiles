call plug#begin('~/.config/nvim/plugi')
Plug 'https://github.com/derekwyatt/vim-fswitch'
Plug 'sonph/onehalf'
Plug 'reewr/vim-monokai-phoenix'
Plug 'rakr/vim-one'
Plug 'makerj/vim-pdf'
Plug 'preservim/nerdtree'
Plug 'voldikss/vim-floaterm'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'ThePrimeagen/vim-be-good'
Plug 'morhetz/gruvbox'
Plug 'Mizux/vim-colorschemes'
Plug 'chriskempson/vim-tomorrow-theme'
call plug#end()
let mapleader = ","
""colorscheme monokai-phoenix Plug 'reewr/vim-monokai-phoenix'

syntax on
set t_Co=256
set cursorline
let g:gruvbox_contrast_dark = 'hard'
set background=dark
colorscheme one
hi CursorLine   cterm=NONE ctermbg=234 ctermfg=NONE
"highlight Normal ctermbg=0
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>


"white space thingy
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()
"what is dis with cppman
function! s:JbzCppMan()
    let old_isk = &iskeyword
    setl iskeyword+=:
    let str = expand("<cword>")
    let &l:iskeyword = old_isk
    execute 'Man ' . str
endfunction
command! JbzCppMan :call s:JbzCppMan()
"shift k mowi co to jest
au FileType cpp nnoremap <buffer>K :JbzCppMan<CR>
"fswitch
au BufEnter *.h  let b:fswitchdst = "c,cpp,cc,m"
au BufEnter *.cc let b:fswitchdst = "h,hpp,cpp"

nnoremap <silent> <A-o> :FSHere<cr>
" Extra hotkeys to open header/source in the split
nnoremap <silent> <localleader>oh :FSSplitLeft<cr>
nnoremap <silent> <localleader>oj :FSSplitBelow<cr>
nnoremap <silent> <localleader>ok :FSSplitAbove<cr>
nnoremap <silent> <localleader>ol :FSSplitRight<cr>

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
set number
hi MatchParen cterm=none ctermbg=gray ctermfg=red
command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
"floating terminal
  noremap  <leader>t  :FloatermToggle<CR>
  noremap! <leader>t  <Esc>:FloatermToggle<CR>
  tnoremap <leader>t  <C-\><C-n>:FloatermToggle<CR>
  let g:floaterm_width = 100
  let g:floaterm_winblend = 0
	"nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap ; <C-w>

autocmd FileType asm set ft=nasm
autocmd FileType cpp set relativenumber
autocmd FileType c set relativenumber
autocmd FileType asm set relativenumber
autocmd FileType perl set relativenumber
autocmd FileType perl colorscheme gruvbox
